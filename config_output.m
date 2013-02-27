function config_output()

%init vars with global scope
global setting;
global subject;
global data_file;
global data_header;
global event_log_file;
global event_log_header;


if strcmp(setting,'button_box')
    
    data_filename = ['./data/',subject,'_data_buttonbox.txt'];
    data_file = fopen(data_filename,'w');
    
    event_log_filename = ['./data/',subject,'_event_log_buttonbox.txt'];
    event_log_file = fopen(event_log_filename,'w');
    
    
elseif strcmp(setting,'keyboard')
    
    data_filename = ['./data/',subject,'_data_keyboard.txt'];
    data_file = fopen(data_filename,'w'); 
    
end    

data_header = '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t\n';
fprintf(data_file,data_header,'trial','type','block','visual_target','motor_target','rt','onset','duration','made_errors');

event_log_header = '%s\t%s\t%s\t%s\t\n';
fprintf(event_log_file,event_log_header,'event','type','value','time');

end