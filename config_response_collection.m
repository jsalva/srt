function config_response_collection()

%init vars with global scope
global setting;
global trigger_key;
global quit_key;
global keys;

keyboard = GetKeyboardIndices('Apple Internal Keyboard / Trackpad');
KbQueueCreate(keyboard)
KbQueueStart()

trigger_key = KbName('=+');
quit_key = KbName('q');

if strcmp(setting,'button_box')
    
    keys = KbName({'1!','2@','3#','4$'});
    
elseif strcmp(setting,'keyboard')
    
    keys = KbName({'1!','2@','9(','0)'});
    
end    

end