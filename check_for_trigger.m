function [result, time] = check_for_trigger()

global trigger_key;

[keys, times] = collect_responses();

if any(keys == trigger_key)

    result = true;
    time = times(keys == trigger_key);
    
else
    
    result = false;
    time = NaN;
    
end

end