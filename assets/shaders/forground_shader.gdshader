shader_type canvas_item;

uniform float MULTIPLIER = 0.56; // adjusts the height of the vignette effect
uniform float SCALE = 0.5; // adjusts the size of the vignette
uniform float SOFTNESS = 0.45; // adjusts the smoothness of the edges

uniform float BASE_OPACITY = 0.6; // sets the opacity of the vignette effect

void fragment(){ // beginning of the fragment shader function
	
	// calculate the distance from the center of the canvas item to each pixel, taking into account the MULTIPLIER variable to adjust the height of the vignette
	float val = distance(vec2(UV.x , UV.y * MULTIPLIER), vec2(0.5 , 0.5 * MULTIPLIER));
	
	// divide the val variable by the SCALE variable to adjust the size of the vignette
	val = val / SCALE;
	
	// apply a smoothstep function to the val variable, creating a smooth gradient from the center of the canvas item to the edges based on the SOFTNESS variable. This creates the actual vignette.
	float vignette = smoothstep(0.0, SOFTNESS, val);
	
	// if the vignette is greater than the BASE_OPACITY variable, set it to BASE_OPACITY. This allows you to set a base opacity for the layer
	if(vignette > BASE_OPACITY){
		vignette = BASE_OPACITY;
	}
	
	// if the alpha value of the pixel is greater than 0.99 apply the effect
	if(COLOR.a > 0.99){
		COLOR = vec4(COLOR.r,COLOR.g,COLOR.b , vignette );
	}
	
}