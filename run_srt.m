function run_srt(subj,r,set)

global subject;
global run;
global setting;
global start_time;
global current_time;
global next_event_bool;
global trial;
global collect_rt_bool;

subject = subj;
run = r;

if set == 2

    setting = 'button_box';

elseif set == 1

    setting = 'keyboard';

end


config_output;

exp = config_exp;

event_queue = create_event_queue(exp);

config_screen;

config_response_collection;
KbQueueCheck

draw_instructions;

while ~check_for_trigger
    
end
start_time = GetSecs;

event = config_event(0,'start','start',0,start_time,0);
write_event_log(event);

next_event_bool = true;
collect_rt_bool = true;

while ~isempty(event_queue)
    
    update_time
    
    [event_queue,event] = execute_events(event_queue,event);
    
end

quit_exp

end