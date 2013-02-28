function config_screen()

global main_window;
global rect_1;
global rect_2;
global rect_3;
global rect_4;

rect_1 = [0,0,0,0];
rect_2 = [0,0,0,0];
rect_3 = [0,0,0,0];
rect_4 = [0,0,0,0];

screen_number = max(Screen('Screens'));

main_window = Screen('OpenWindow', screen_number);

Screen('FillRect',main_window,[0,0,0])

main_rect = Screen('Rect', main_window);

width = main_rect(3);
height = main_rect(4);

rect_1(1) = width/2 - height/16 - 3*(height/8);
rect_1(2) = height/2 - height/16;
rect_1(3) = width/2 - height/16 - 2*(height/8);
rect_1(4) = height/2 + height/16;

rect_2(1) = width/2 - height/16 - 1*(height/8);
rect_2(2) = height/2 - height/16;
rect_2(3) = width/2 - height/16 - 0*(height/8);
rect_2(4) = height/2 + height/16;

rect_3(1) = width/2 + height/16 + 0*(height/8);
rect_3(2) = height/2 - height/16;
rect_3(3) = width/2 + height/16 + 1*(height/8);
rect_3(4) = height/2 + height/16;

rect_4(1) = width/2 + height/16 + 2*(height/8);
rect_4(2) = height/2 - height/16;
rect_4(3) = width/2 + height/16 + 3*(height/8);
rect_4(4) = height/2 + height/16;

end