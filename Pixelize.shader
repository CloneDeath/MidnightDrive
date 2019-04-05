shader_type canvas_item;
uniform vec2 resolution = vec2(10, 10);

void fragment() {
	vec2 sample = floor(SCREEN_UV * resolution) / resolution;
	COLOR = textureLod(SCREEN_TEXTURE, sample, 0.0).rgba;
}