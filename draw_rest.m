function flip_time = draw_rest()

global main_window;

Screen('TextSize',main_window,50);

DrawFormattedText(main_window,...
    '+',...
    'center',...
    'center',...
    [255,255,255]);

flip_time = Screen('Flip',main_window);

end