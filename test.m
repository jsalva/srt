function test(subj,r,set)

global subject;
global run;
global setting;
global trial_order;

trial_order = csvread('trial_order.csv');

subject = subj;

run = r;

if set == 1

    setting = 'button_box';

elseif set == 2

    setting = 'keyboard';

end

config_response_collection;

config_output;

trial_obj = create_trial_obj();
write_data(trial_obj);

event_obj = create_event_obj();
write_event_log(event_obj);

config_exp;

result = check_for_trigger;
disp(result);

result = check_for_quit;
disp(result);

end