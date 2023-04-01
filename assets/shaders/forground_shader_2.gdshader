shader_type canvas_item;

uniform float OPACITY = 0.0;

void fragment() {
	
	float grey = (COLOR.r+COLOR.g+COLOR.b)/3.0;
	if(COLOR.a > 0.9){
		COLOR = vec4(grey,grey,grey,OPACITY);
	}
}
