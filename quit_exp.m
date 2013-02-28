function quit_exp()

Screen('CloseAll')

KbQueueStop
KbQueueRelease

%load event_log

%sort by runtime

%save event log

error('Experimenter Quit')

end