classdef simulator
    % Run a simulation of the ASEN 5010 Capstone Project
    
    properties
        GMO; LMO;   % Mars orbiters
    end
    
    properties (Access = private)
        simtime;    % Sim runtime
    end
    
    methods
        function obj = simulator(dt)
            % Construct a simulation to run for duration dt
            if exist('dt','var')
                obj.simtime = dt;   % User specified runtime (s)
            else
                obj.simtime = 6500; % Default runtime of 6500s
            end
        end
        
        function obj = run(obj)
            % Run the simulation
            constants = tools.get.constant.value;
            constants.sim_enable = 1;
            
            % Configure integration times
            constants.dn = obj.simtime/constants.h;
            
            % Configure models
            mGMO = spacecraft.GMO.satellite;
            mLMO = spacecraft.LMO.satellite;
            
            % Default control is sun pointing
            mLMO.C = @mLMO.N2S;
            mLMO.U = @gnc.controls.pdc;
            
            % Execution loop
            for i = 1:constants.dn
                % Set current sample
                mGMO.n = i;
                mLMO.n = mGMO.n;
                
                % Kick off models
                mGMO.launch;
                mLMO.launch;
                
                % Control selection
                gnc.state.simulation(mGMO,mLMO);
            end
            
            % Save off the models in the sim object
            obj.GMO = mGMO;
            obj.LMO = mLMO;
        end
    end
end

