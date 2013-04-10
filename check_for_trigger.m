function [result, time] = check_for_trigger()

%global trigger_key;

%disp(trigger_key)
[bool,presstime,keycode] = KbCheckM;
%[keys, times] = collect_responses();
%trigger_key = KbName('+');
disp(find(keycode))
if any(intersect(find(keycode),[KbName('=+'),KbName('+')]))

    result = true;
    time = presstime; %times(keys == trigger_key);
    
else
    
   result = false;
   time = NaN;
    
end

end