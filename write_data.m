function write_data(trial_object)

global data_file;
global data_format;

fprintf(data_file,data_format,...
    trial_object.trial,...
    trial_object.type,...
    trial_object.block,...
    trial_object.visual_target,...
    trial_object.motor_target,...
    trial_object.rt,...
    trial_object.onset,...
    trial_object.duration,...
    trial_object.made_errors);

end