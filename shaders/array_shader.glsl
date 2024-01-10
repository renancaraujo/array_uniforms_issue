#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform float[10] uFloats;

out vec4 fragColor;

void main() { 
    vec2 pos = FlutterFragCoord().xy;
    vec2 uv = pos / uSize;
    
    /// render bars for float values (between 0 and 1)
    float barWidth = 1.0 / 10.0;
    float barIndex = floor(uv.x / barWidth);
    for(int i = 0; i < 10; i++) {
        if(i == int(barIndex)) {
            float barHeight = uFloats[i];
            if(uv.y > (1.0 - barHeight)) {
                fragColor = vec4(0.33, 0.09, 0.09, 1.0);
            } else {
                fragColor = vec4(1.0, 1.0, 1.0, 1.0);
            }
        }
    }    
}
