function trial = config_trial(trial_num,target_num,block_type,block_num)

trial.trial = trial_num;
trial.type = block_type;
trial.block = block_num;

if strcmp(block_type,'T')
    trial.visual_target = mod(target_num+1,4);
else
    trial.visual_target = target_num;
end

trial.motor_target = target_num;
trial.rt = NaN;
trial.onset = NaN;
trial.duration = NaN;
trial.made_errors = false;

end