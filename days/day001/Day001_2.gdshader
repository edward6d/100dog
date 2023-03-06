shader_type canvas_item;

uniform float tempo : hint_range(0.1, 2.0);

void fragment() {
	float t = TIME/2.0-float(int(TIME/2.0));
	vec4 origPixel = texture(TEXTURE, UV+vec2(-TIME*0.01, -2.0*t-0.1*sin(t*2.0*PI+tempo*PI)));
	COLOR = origPixel;
	// Place fragment code here.
}
