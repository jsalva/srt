function [event_queue, event] = pop_event(event_queue)

event = event_queue{1};

event_queue(1) = [];

end