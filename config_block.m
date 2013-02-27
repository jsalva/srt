function block = config_block(block_num,block_type,num_trials)

global trial_order;

block.num = block_num;
block.type = block_type;
block.num_trials = num_trials;

block.structure = trial_order(block.num,:);

if length(block.structure) ~= num_trials
    
    disp(['the trial structure found does not match the expected input.\n',...
        'block: ',num2str(block.num),', expected: ',num2str(num_trials),...
        'got: ',num2str(length(block.structure))]);
    
    quit_exp; 
    
end

block.trials = {};

for trial_idx = 1:length(block.structure)

    block.trials{end+1} = config_trial(trial_idx,block.structure(trial_idx),block.type,block.num);
    
end

end