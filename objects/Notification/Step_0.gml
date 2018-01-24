++tick;
x = lerp(start_x,end_x,clamp(tick/tween_time,0,1));
y = lerp(start_y,end_y,clamp(tick/tween_time,0,1));