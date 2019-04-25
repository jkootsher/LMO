classdef (Sealed) constant < handle
    % Class containing project specific constants
    % Description: Initial conditions, constants, and
    % helper variables are all accessible as class members
    
    properties (Constant)
        u = 42828.3;            % Mars gravity constant (km^3/s^2)
        R = 3396.19;            % Radius of Mars (km)
        T = 60;                 % Half of decay time (s)
    end
    
    properties
        % Timing parameters
        h = 1;                 % Step size
        dn = 500;              % Initial samples
        
        % Control parameters
        N = 10;                % Sample query default
        L = [0;0;0];           % Control torque (N*m)
        
        % Full simulation switch (used for Comm Pointing)
        sim_enable = 0;
    end
      
    methods (Access = private)
        function obj = constant
            % Construct an instance of this class
            obj.N = obj.N/obj.h;
            obj.dn = obj.dn/obj.h;
        end
    end
    
    methods (Static)
        function singleObj = value
            persistent localObj
            if isempty(localObj) || ~isvalid(localObj)
                localObj = tools.get.constant;
            end
            singleObj = localObj;
        end
    end
end

