function flip_time = draw_target(target)

global main_window;
global rect_1;
global rect_2;
global rect_3;
global rect_4;

Screen('FrameRect',main_window,[255,255,255],rect_1);
Screen('FrameRect',main_window,[255,255,255],rect_2);
Screen('FrameRect',main_window,[255,255,255],rect_3);
Screen('FrameRect',main_window,[255,255,255],rect_4);

switch target
    
    case 1
   
        rect = rect_1;
        
    case 2
        
        rect = rect_2;
        
    case 3
        
        rect = rect_3;
        
    case 4
        
        rect = rect_4;
        
end

Screen('FillOval',main_window,[255,255,255],rect);

flip_time = Screen('Flip',main_window);

end