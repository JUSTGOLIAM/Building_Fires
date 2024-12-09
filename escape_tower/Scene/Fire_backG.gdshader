shader_type canvas_item;

// Uniform to control speed
uniform vec2 speed = vec2(0.5, 0.5);

void fragment() {
    // Move texture coordinates over time
    vec2 uv = UV + speed * TIME;
    COLOR = texture(TEXTURE, uv);
}
