text = "Notification!";
lifetime = room_speed * 3;
tween_time = room_speed * 0.2;
alarm[0] = lifetime;

start_x = display_get_gui_width()/2;
start_y = display_get_gui_height() + 100;
end_x = start_x;
end_y = start_y - 100;
tick = 0;
on_finish = noone;