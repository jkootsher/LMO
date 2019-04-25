classdef (Sealed) GMO < handle
    % Singleton for GMO craft
    
    properties
        o; r; do; dr; n;
    end
    
    properties (Access = private)
        O = [0;0;250];     % Initial orientation (deg, orbit)
        R = [17028.1;0;0]; % Altitude above Mars (km, orbit)
    end
    
    methods (Access = private)
        function obj = GMO
            % Construct an instance of this class
            obj.o = datatypes.parameter;
            obj.r = datatypes.parameter;
        
            obj.do = datatypes.parameter;
            obj.dr = datatypes.parameter;
            
            % Initial conditions
            obj.o.ic.data = tools.convert.deg2rad(obj.O);
            obj.r.ic.data = tools.get.ic.altitude(obj.R);
            
            obj.do.ic.data = tools.get.ic.eulerrate(obj.r.ic.data);
            
            % Control parameters
            obj.n = 0;  % Initialize samples
        end
    end
    
    methods (Static)
        function singleObj = satellite
            persistent localObj
            if isempty(localObj) || ~isvalid(localObj)
                localObj = spacecraft.GMO;
            end
            singleObj = localObj;
        end
    end
    
    methods
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
        end
    end
end

