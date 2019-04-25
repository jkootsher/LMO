classdef frame
    % Frame class containing mrp attitude and angular velocity
    
    properties
        RN; w;
        n = tools.get.constant.value.N;
    end
    
    methods
        function obj = frame(RN,n)
            % Construct frame class
            obj.w = datatypes.datapoint;
            
            % Populate
            obj.n = n;
            obj.RN = RN;
        end
    end
end

