function run_srt(subj,r,set)

global subject;
global run;
global setting;
global start_time;
global current_time;
global next_event_bool;
global trial;

subject = subj;
run = r;

if set == 1

    setting = 'button_box';

elseif set == 2

    setting = 'keyboard';

end

config_response_collection;
KbQueueCheck
config_output;

exp = config_exp;

event_queue = create_event_queue(exp);

config_screen;

draw_instructions;

while ~check_for_trigger
    
end

start_time = GetSecs;

event = config_event(0,'start','start',0,0,0);
write_event_log(event);

next_event_bool = true;

while ~isempty(event_queue)
    
    update_time
    
    event_queue = execute_events(event_queue,event);
    
end

quit_exp

end