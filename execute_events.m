function [event_queue,event] = execute_events(event_queue, event)

global start_time;
global current_time;
global next_event_bool;
global trial;
global keys;

if current_time >= event_queue{1}.target_time

    [event_queue,event] = pop_event(event_queue);
    next_event_bool = true;
    collect_rt = true;
    
else
   
    [pressed_keys,times] = log_key_events;
    
    if strcmp(event.type,'S') || ...
            strcmp(event.type,'R') || ...
            strcmp(event.type,'T') ||...
            strcmp(event.type,'removal')

        if collect_rt && any(pressed_keys == keys(trial.motor_target))

            sorted_press_times = sort(...
                times(pressed_keys == keys(trial.motor_target))...
                );

            trial.rt = sorted_press_times(1) - trial.onset;
            collect_rt = false;

        elseif trial.rt == 0

            trial.made_errors = 1;

        end
        
    end
    
end

if next_event_bool
    
    switch event.type

        case 'cue'

            event.run_time = draw_cue(event.value) - start_time;

        case 'S'

            %update & write out previous trial
            trial.duration = current_time - trial.onset;
            write_data(trial)

            event.run_time = draw_target(event.value) - start_time;

            trial = event.data;
            trial.onset = event.run_time;
            
        case 'R'
            
            %update & write out previous trial
            trial.duration = current_time - trial.onset;
            write_data(trial)
            
            event.run_time = draw_target(event.value) - start_time;
            
            trial = event.data;
            trial.onset = event.run_time;
            
        case 'T'
            
            %update & write out previous trial
            trial.duration = current_time - trial.onset;
            write_data(trial)
            
            event.run_time = draw_target(event.value) - start_time;
            
            trial = event.data;
            trial.onset = event.run_time;
            
        case 'removal'

            event.run_time = draw_removal - start_time;

        case 'rest'

            event.run_time = draw_rest - start_time;

    end
    
    write_event_log(event);
    
    next_event_bool = false;
    
end

end