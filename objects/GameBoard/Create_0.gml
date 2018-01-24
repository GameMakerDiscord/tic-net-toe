state = gameboard_states.waiting;
player_type = player_types.x;
cell_size = 16 * image_xscale;
hover_x = -1;
hover_y = -1;
grid = ds_grid_create(3,3);
ds_grid_clear(grid,-1);