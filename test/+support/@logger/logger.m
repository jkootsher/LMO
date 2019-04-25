classdef logger
    % Simple logger class
    
    properties
        fd = -1;
    end
    
    properties (Access = private)
        filepath = strrep(mfilename('fullpath'),'\','/');
    end        
    
    methods
        function obj = logger(filename)
            % Constructor
            filepath = strrep(obj.filepath,'/logger','');
            filepath = sprintf("%s/../../%s",filepath,filename);
            obj.fd = fopen(filepath,'w');
            
            if obj.fd < 0
                error('Cannot open file');
            end
        end
        
        function obj = close(obj)
            % Close file handle
            fclose(obj.fd);
            obj.fd = -1;
        end
    end
end

