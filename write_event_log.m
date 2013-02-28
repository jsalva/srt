function write_event_log(event_object)

global event_log_file;
global event_log_format;

if isnumeric(event_object.value)
   
    value = num2str(event_object.value);
    
else
    
    value = event_object.value;

end

fprintf(event_log_file,event_log_format,...
    event_object.event,...
    event_object.type,...
    value,...
    event_object.run_time);

end