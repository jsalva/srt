function flip_time = draw_instructions()

global main_window;
global keys;
global rect_1;
global rect_2;
global rect_3;
global rect_4;

rects = {rect_1,rect_2,rect_3,rect_4};

Screen('FrameRect',main_window,[255,255,255],rect_1);
Screen('FrameRect',main_window,[255,255,255],rect_2);
Screen('FrameRect',main_window,[255,255,255],rect_3);
Screen('FrameRect',main_window,[255,255,255],rect_4);

Screen('TextSize',main_window,25);

DrawFormattedText(main_window,...
    ['When you see the DOWN ARROW, press the buttons corresponding to ',...
    'the box with the circle in it. \n\n\n\n\n\n\n\n\n\n\n\n\n',...
    'When you see the RIGHT ARROW, press the buttons to the RIGHT of ',...
    'the box with the circle in it. \n(NOTE: for the LAST box on the ',...
    'right, press the FIRST button on the left)'],...
    'center',...
    'center',...
    [255,255,255]);


Screen('TextSize',main_window,30);

nudge = 15;

for i = 1:length(keys)
    DrawFormattedText(main_window,...
        KbName(keys(i)),...
        rects{i}(1)+(rects{i}(3)-rects{i}(1))/2 - nudge,...
        'center',...
        [255,255,255]);
end

flip_time = Screen('Flip',main_window);

end