shader_type canvas_item;

void fragment() {
	vec2 pos = UV;
	pos.x = pos.x + TIME * -0.50;
	COLOR = texture(TEXTURE, pos);
}
