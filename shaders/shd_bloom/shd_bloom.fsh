//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texel;

const float blurDirs = 8.0;
const float blurQuality = 8.0;
const float blurRadius = 16.0;

const float pi2 = 6.28318530718;

const float cutoff_lower = 0.5;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec3 colorness = gl_FragColor.rgb;
	float lightness = (gl_FragColor.r + gl_FragColor.g + gl_FragColor.b)/3.0;
    
    //Loop and add surrounding colors
    for(float d=0.0; d<pi2; d+=pi2/blurDirs){
        for(float i=1.0/blurQuality; i<1.0; i+=1.0/blurQuality){
            vec2 newCoord = v_vTexcoord + vec2(cos(d) * texel.x, -sin(d) * texel.y)*i*blurRadius;
            
            vec4 newFrag = texture2D(gm_BaseTexture, newCoord);
            float avg = (newFrag.r + newFrag.g + newFrag.b)/3.0;
			
            //gl_FragColor += newFrag;
			lightness += avg;
			colorness += newFrag.rgb;
        }
    }
    
    //Divide
    //gl_FragColor /= 1.0 + (blurQuality * blurDirs);
	lightness /= blurQuality*blurDirs;
	colorness /= blurQuality*blurDirs;
	
	//Bloom pixels
	//Alpha
	//gl_FragColor.a = (gl_FragColor.r + gl_FragColor.g + gl_FragColor.b)/3.0;
	//gl_FragColor.a = (gl_FragColor.a - cutoff_lower) * (1.0/(1.0-cutoff_lower));
	//gl_FragColor.a*=1.2;
	
	//Color
	gl_FragColor.rgb = colorness*2.0;
	gl_FragColor.a = lightness;
}


