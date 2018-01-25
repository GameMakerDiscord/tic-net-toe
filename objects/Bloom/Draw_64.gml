/// @description 
//Texture info
var surfTex = surface_get_texture(application_surface);
var texelW = texture_get_texel_width(surfTex);
var texelH = texture_get_texel_height(surfTex);

//Surface
var bloomSurf = surface_create(surface_get_width(application_surface),
                                surface_get_height(application_surface));

//Draw app surface on bloom surf                                
surface_set_target(bloomSurf);
draw_clear_alpha(0, 0);

gpu_set_blendmode_ext(bm_one, bm_zero);

shader_set(shd_bloom);
shader_set_uniform_f(uniTexel, texelW, texelH);

draw_surface(application_surface, 0, 0);

gpu_set_blendmode(bm_normal);

shader_reset();

surface_reset_target();

//Draw bloom surf
draw_surface(bloomSurf, 0, 0);
surface_free(bloomSurf);

