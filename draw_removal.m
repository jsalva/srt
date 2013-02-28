function flip_time = draw_removal()

global main_window;
global rect_1;
global rect_2;
global rect_3;
global rect_4;

Screen('FrameRect',main_window,[255,255,255],rect_1);
Screen('FrameRect',main_window,[255,255,255],rect_2);
Screen('FrameRect',main_window,[255,255,255],rect_3);
Screen('FrameRect',main_window,[255,255,255],rect_4);

flip_time = Screen('Flip',main_window);

end