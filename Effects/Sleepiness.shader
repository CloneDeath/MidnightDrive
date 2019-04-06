shader_type canvas_item;
uniform float sleepiness : hint_range(0.0, 1.0) = 0.5;
uniform float zoom_factor = 2;

void fragment() {
	float zoom = mix(1, zoom_factor, sleepiness);
	vec2 sample = ((SCREEN_UV - vec2(0.5)) / zoom) + vec2(0.5);
	vec3 screen_color = textureLod(SCREEN_TEXTURE, sample, 0.0).rgb;
	
	float eyelid_height = 1.0 - (abs(SCREEN_UV.y - 0.5) * 2.0);
	float darkness = clamp(eyelid_height - (sleepiness - 0.5) * 2.0, 0.0, 1.0);
	
	COLOR = vec4(screen_color * darkness, 1);
}