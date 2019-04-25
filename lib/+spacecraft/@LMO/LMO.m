classdef (Sealed) LMO < handle
    % Singleton for LMO craft
    
    properties
        o; r;    % State
        do; dr;  % State
        s; w; X; % State
        
        u; n;    % Control
        U; C;    % Control
    end
    
    properties (Access = private)
        O = [20;30;60];             % Initial orientation (deg, orbit)
        R = [400;0;0];              % Altitude above Mars (km, orbit)
        
        S = [0.3;-0.4;0.5];         % Initial attitude (radian, body, MRP)
        W = [1.00;1.75;-2.20];      % Initial rates (deg, body)
    end

    methods (Access = private)
        function obj = LMO
            % Construct an instance of this class
            obj.o = datatypes.parameter;
            obj.r = datatypes.parameter;
        
            obj.do = datatypes.parameter;
            obj.dr = datatypes.parameter;
            
            obj.s = datatypes.parameter;
            obj.w = datatypes.parameter;
            
            % Initial conditions
            obj.o.ic.data = tools.convert.deg2rad(obj.O);
            obj.r.ic.data = tools.get.ic.altitude(obj.R);
            
            obj.do.ic.data = tools.get.ic.eulerrate(obj.r.ic.data);
            obj.dr.ic.data = obj.r.ic.data.*obj.do.ic.data;
            
            obj.s.ic.data = obj.S;
            obj.w.ic.data = tools.convert.deg2rad(obj.W);
            
            % IC Frames (default=Orbit)
            obj.s.ic.frame = "Body";
            obj.w.ic.frame = "Body";
            
            % Control parameters
            obj.n = 0;                  % Initialize samples
            obj.C = @tools.get.stub;    % Default frame is passthrough
            obj.U = @gnc.controls.cct;  % Controller default (constant torque)
        end
    end
    
    methods (Static)
        function singleObj = satellite
            persistent localObj
            if isempty(localObj) || ~isvalid(localObj)
                localObj = spacecraft.LMO;
            end
            singleObj = localObj;
        end
    end
    
    methods
        HN = N2H(obj,n);               % Orbit frame
        [SN,sbar,wbar] = N2S(obj,n);   % Sun pointing frame
        [PN,sbar,wbar] = N2P(obj,n);   % Nadir pointing frame
        [CN,sbar,wbar] = N2C(obj,n);   % GMO pointing frame
        
        function run(obj,dt)
            % Configure integration times
            constants = tools.get.constant.value;
            
            % Use defined run time or default (500s)
            if exist('dt','var')
                constants.dn = dt/constants.h;
            end
            
            for i = 1:constants.dn
                % Set current sample
                obj.n = i;
                obj.launch;                
            end
        end
        
        function launch(obj)
            % Configure state data for current sample.
            % The sample should be set in an exterior loop.
            gnc.attitude.orbit(obj);
            gnc.rates.orbit(obj);

            gnc.state.inertial(obj);
            gnc.rates.inertial(obj);

            % Body state vector
            gnc.state.body(obj);
        end
    end
end

