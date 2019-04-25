classdef parameter
    % Parameter data class
    
    properties
        ic;
        ts;
    end
    
    methods
        function obj = parameter
            % Construct an instance of this class
            obj.ic = datatypes.datapoint;
            obj.ts = datatypes.timeseries;
        end
 
        function value = at(obj,n)
            % Return the state at sample n
            dn = tools.get.constant.value.dn;
            
            if isequal(n,0)
                value = obj.ic.data;
            else
                if n > dn
                    value = obj.ts.data(:,dn);
                else
                    value = obj.ts.data(:,n);
                end
            end
        end
    end
end

