function event = config_event(num,type,value,target_time,run_time,data)

event.event = num;
event.type = type;
event.value = value;

%should be 0 if added at runtime
event.target_time = target_time;

%should be 0 if added as part of exp
event.run_time = run_time;

%should be trial object if type is 'S','R','T'
%else 0
event.data = data;

end