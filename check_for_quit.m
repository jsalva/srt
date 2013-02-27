function [result, time] = check_for_quit()

global quit_key;

[keys, times] = collect_responses();

if any(keys == quit_key)

    result = true;
    time = times(quit_key);
    
else
    
    result = false;
    time = NaN;
    
end

end