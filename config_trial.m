function trial = config_trial(trial_num,target_num,block_type,block_num)

global trial_dur;
global removal_dur;

trial.trial = trial_num;
trial.type = block_type;
trial.block = block_num;

if strcmp(block_type,'T')
    
    trial.motor_target = mod(target_num+1,5);
    
    if trial.motor_target == 0
       
        trial.motor_target = 1;
        
    end

else
    
    trial.motor_target = target_num;

end

trial.visual_target = target_num;
trial.rt = 0;
trial.onset = 0;
trial.target_duration = trial_dur + removal_dur;
trial.duration = 0;
trial.made_errors = 0;

end