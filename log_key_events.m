function [pressed_keys,times] = log_key_events()

%listen for button presses and add them to the event log
[pressed_keys,times] = collect_responses;

for key_idx = 1:length(pressed_keys)

    key_event = config_event(0,...
        'key',...
        KbName(pressed_keys(key_idx)),...
        0,...
        times(key_idx),...
        0);

    write_event_log(key_event);

end

end