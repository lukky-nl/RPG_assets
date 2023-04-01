shader_type canvas_item;

uniform float MULTIPLIER = 0.56;
uniform float SCALE = 0.5;
uniform float SOFTNESS = 0.45;

uniform float BASE_OPACITY = 0.6;

void fragment(){
	
	float val = distance(vec2(UV.x , UV.y * MULTIPLIER), vec2(0.5 , 0.5 * MULTIPLIER));
	
	val = val / SCALE;
	
	float vignette = smoothstep(0.0, SOFTNESS, val);
	
	if(vignette > BASE_OPACITY){
		vignette = BASE_OPACITY;
	}
	
	if(COLOR.a > 0.99){
		COLOR = vec4(COLOR.r,COLOR.g,COLOR.b , vignette );
	}
	
}