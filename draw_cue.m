function flip_time = draw_cue(event_type)

global main_window;

switch event_type

    case 'R'
    
        text = '#';
        
    case 'S'
        
        text = '#';
        
    case 'T'
        
        text = '%';
        
end

Screen('TextSize',main_window,50);

DrawFormattedText(main_window,...
    text,...
    'center',...
    'center',...
    [255,255,255]);

flip_time = Screen('Flip',main_window);

end