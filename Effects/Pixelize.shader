shader_type canvas_item;
uniform vec2 resolution = vec2(10, 10);

void fragment() {
	vec2 sample = floor(SCREEN_UV * resolution + vec2(0.5, 0.5)) / resolution;
	COLOR = textureLod(SCREEN_TEXTURE, sample, 0.0).rgba;
}