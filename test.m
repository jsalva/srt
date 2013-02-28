function test(subj,r,set)

global subject;
global run;
global setting;

subject = subj;
run = r;

if set == 1

    setting = 'button_box';

elseif set == 2

    setting = 'keyboard';

end

config_response_collection;

config_output;

trial_obj = config_trial(1,1,'R',1);
write_data(trial_obj);

%event_obj = create_event_obj();
%write_event_log(event_obj);

exp = config_exp;

event_queue = create_event_queue(exp);

result = check_for_trigger;
disp(result);

result = check_for_quit;
disp(result);

end