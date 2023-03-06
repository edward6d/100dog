shader_type canvas_item;

uniform float tempo : hint_range(0.1, 10.0);

void fragment() {
	vec4 start = vec4(135.0/255.0, 206.0/255.0, 235.0/255.0, 1.0);
	// Place fragment code here.
	COLOR = start*clamp(((10.0-TIME)/10.0), 0.0, 1.0);
	COLOR.a=1.0;
}
