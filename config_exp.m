function exp = config_exp()

global run;

global cue_dur;
global trial_dur;
global removal_dur;
global isi_dur;
global rest_dur;

cue_dur = 2.000;
trial_dur = 0.600;
removal_dur = 0.250;
isi_dur = 0.250;
rest_dur = 12.000;

if run == 1
    
    exp.structure = {'R','S','R','T','R','T','R','S','R'};
    
elseif run == 2
   
    exp.strucutre = {'R','T','R','S','R','S','R','T','R'};
    
end

exp.trials_per_block = [24,72,24,72,24,72,24,72,24,72,24];

exp.blocks = {};

for block_idx = 1:length(exp.structure)

    exp.blocks{end+1} = config_block(block_idx,...
        exp.structure{block_idx},...
        exp.trials_per_block(block_idx));
    
end

end