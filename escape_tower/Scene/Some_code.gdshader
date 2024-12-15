shader_type canvas_item;

uniform int colorMode = 0; // 将 uint 替换为 int

uniform float timescale = 0.2;
uniform float hScrollSpeedFactor = 1.0;
uniform float vScrollSpeedFactor = 1.0;
uniform float entropyFactor = 1.0;
uniform float sharpness = 5.0; // 控制烟雾清晰度
uniform float alphaFactor = 0.3; // 控制烟雾透明度
uniform float fireIntensity = 0.5; // 控制火光强度
uniform float fireAlpha = 0.4; // 控制火光的透明度

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

vec3 hash(vec3 p)
{
    p = vec3(dot(p, vec3(127.1, 311.7, 74.7)),
             dot(p, vec3(269.5, 183.3, 246.1)),
             dot(p, vec3(113.5, 271.9, 124.6)));
    p = fract(sin(p) * 43758.5453123);
    return p;
}

float shard_noise(in vec3 p, in float _sharpness) {
    vec3 ip = floor(p);
    vec3 fp = fract(p);

    float v = 0.0, t = 0.0;
    for (int z = -1; z <= 1; z++) {
        for (int y = -1; y <= 1; y++) {
            for (int x = -1; x <= 1; x++) {
                vec3 o = vec3(float(x), float(y), float(z)); // 显式类型转换
                vec3 io = ip + o;
                vec3 h = hash(io);
                vec3 r = fp - (o + h);

                float w = exp2(-TAU * dot(r, r));
                float s = _sharpness * dot(r, hash(io + vec3(11.0, 31.0, 47.0)) - 0.5);
                v += w * s * inversesqrt(1.0 + s * s);
                t += w;
            }
        }
    }
    return ((v / t) * 0.5) + 0.5;
}

// 生成稳定的烟雾渐变（黑色烟雾）
vec3 smoke_gradient(float t) {
    return mix(vec3(0.0, 0.0, 0.0), vec3(0.2, 0.2, 0.2), smoothstep(0.3, 0.7, t)); // 从黑色到深灰色
}

// 生成深红色火焰渐变
vec3 fire_gradient(float t) {
    return mix(vec3(0.4, 0.1, 0.1), vec3(0.7, 0.2, 0.2), t); // 从暗红到深红
}

vec4 mainImage(in vec2 _uv)
{
    // 为烟雾纹理缩放 UV 坐标
    vec3 uv = vec3(_uv.x * 1.5 + TIME * timescale * hScrollSpeedFactor,
                   _uv.y * 1.5 + TIME * timescale * vScrollSpeedFactor,
                   TIME * timescale * 0.5 * entropyFactor);

    // 生成烟雾噪声
    float noise =
            (shard_noise(128.0 * uv, sharpness) * 0.03125) +
            (shard_noise(64.0 * uv, sharpness) * 0.0625) +
            (shard_noise(32.0 * uv, sharpness) * 0.125) +
            (shard_noise(16.0 * uv, sharpness) * 0.25) +
            (shard_noise(8.0 * uv, sharpness) * 0.5);

    // 烟雾颜色（总是可见）
    vec3 smoke_color = smoke_gradient(noise);

    // 火焰颜色（稳定的深红色）
    vec3 fire_color = fire_gradient(noise) * fireIntensity;

    // 合并烟雾和火焰
    vec3 final_color = smoke_color + fire_color;

    // 调整透明度
    float final_alpha = alphaFactor + fireAlpha;

    return vec4(final_color, final_alpha); // 返回合并后的颜色和透明度
}

void fragment()
{
    vec4 smoke_fire = mainImage(UV);

    switch (colorMode)
    {
        case 0:
            // 烟雾和稳定的火焰效果
            COLOR = smoke_fire;
            break;
        default:
            COLOR = smoke_fire;
            break;
    }
}

