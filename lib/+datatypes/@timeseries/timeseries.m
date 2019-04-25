classdef timeseries
    % Time series data class
    
    properties
        data = 0;
        frame = "Orbit";
    end
    
    methods
        function obj = timeseries
            % Construct an instance of this class
            obj.data = zeros(3,tools.get.constant.value.dn);
        end
    end
end

