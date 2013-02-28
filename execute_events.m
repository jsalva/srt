function [event_queue,event] = execute_events(event_queue, event)

global start_time;
global current_time;
global next_event_bool;
global trial;
global keys;
global collect_rt_bool;

if current_time >= event_queue{1}.target_time

    if strcmp(event.type,'removal');
                    
        %update & write out previous trial
        trial.duration = current_time - trial.onset;
        write_data(trial)

    end

    [event_queue,event] = pop_event(event_queue);
    next_event_bool = true;
    collect_rt_bool = true;
    
else
   
    [pressed_keys,times] = log_key_events;
        
    if ~isempty(trial)

        if collect_rt_bool && any(pressed_keys == keys(trial.motor_target))

            sorted_press_times = sort(...
                times(pressed_keys == keys(trial.motor_target))...
                );

            trial.rt = sorted_press_times(1) - trial.onset - start_time;
            collect_rt_bool = false;

            if (pressed_keys(1) == keys(trial.motor_target))
                
                trial.made_errors = 0;
            
            end

        end

    end
    
end

if next_event_bool
    
    switch event.type

        case 'cue'
            
            event.run_time = draw_cue(event.value) - start_time;

            trial = [];
            
        case 'S'

            event.run_time = draw_target(event.value) - start_time;

            trial = event.data;
            trial.onset = event.run_time;
            
        case 'R'
            
            event.run_time = draw_target(event.value) - start_time;
            
            trial = event.data;
            trial.onset = event.run_time;
            
        case 'T'
            
            event.run_time = draw_target(event.value) - start_time;
            
            trial = event.data;
            trial.onset = event.run_time;
            
        case 'removal'

            event.run_time = draw_removal - start_time;

        case 'rest'

            event.run_time = draw_rest - start_time;
            
            trial = [];

    end
    
    write_event_log(event);
    
    next_event_bool = false;
    
end

end