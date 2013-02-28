function [pressed_keys, times] = collect_responses()
% returns the time-sorted members of the queue created for the device 
% designated to collect responses

%Check Queue
[pressed firstPress firstRelease lastPress lastRelease] = KbQueueCheck;

pressed_keys = [];
times = [];

%if keys found
if pressed
    
    %only look at indexes of keys that were pressed
    key_ids = find(firstPress);
    
    %init queue
    key_queue = [0,0];
    queue_counter = 1;
    
    for key = 1:length(key_ids)
    
        key_queue(queue_counter,:) = [key_ids(key),firstPress(key_ids(key))];
        queue_counter = queue_counter + 1;

        if firstPress(key) ~= lastPress(key)
        
            key_queue(queue_counter,:) = [key_ids(key),lastPress(key_ids(key))];
            queue_counter = queue_counter + 1;
            
        end
        
    end
    
    time_sorted_key_queue = sortrows(key_queue,2);    

    pressed_keys = time_sorted_key_queue(:,1)';
    times = time_sorted_key_queue(:,2)';

end


end