function flip_time = draw_cue(event_type)

global main_window;
global down_arrow;
global right_arrow;

switch event_type

    case 'R'
    
        line_set = down_arrow;
        
    case 'S'
        
        line_set = down_arrow;
        
    case 'T'
        
        line_set = right_arrow;
        
end

Screen('DrawLines',main_window,line_set,10,[255,255,255]);

flip_time = Screen('Flip',main_window);

end