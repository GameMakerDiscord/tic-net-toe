/// @param text 
/// @param [lifetime]
/// @param [on_finish]
instance_destroy(Notification);

with(instance_create_depth(0,0,0,Notification)){
	text = argument[0];	
	lifetime = (argument_count > 1) ? argument[1] : room_speed * 2;
	on_finish = (argument_count > 2) ? argument[2] : noone;
	alarm[0] = lifetime;
}