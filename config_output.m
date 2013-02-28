function config_output()

%init vars with global scope
global setting;
global subject;
global data_file;
global data_format;
global event_log_file;
global event_log_format;


if strcmp(setting,'button_box')
    
    data_filename = ['./data/',subject,'_data_buttonbox.txt'];
    data_file = fopen(data_filename,'w');
    
    event_log_filename = ['./data/',subject,'_event_log_buttonbox.txt'];
    event_log_file = fopen(event_log_filename,'w');
    
    
elseif strcmp(setting,'keyboard')
    
    data_filename = ['./data/',subject,'_data_keyboard.txt'];
    data_file = fopen(data_filename,'w'); 
    
end    

data_format = '%d\t%s\t%d\t%d\t%d\t%0.6f\t%0.6f\t%0.6f\t%d\n';
data_header_format = '%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n';
fprintf(data_file,data_header_format,'trial','type','block','visual_target','motor_target','rt','onset','duration','made_errors');

event_log_format = '%d\t%s\t%s\t%0.6f\n';
event_log_header_format = '%s\t%s\t%s\t%s\n';
fprintf(event_log_file,event_log_header_format,'event','type','value','time');

end