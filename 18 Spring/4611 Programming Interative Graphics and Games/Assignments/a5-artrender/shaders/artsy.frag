#version 330

// CSci-4611 Assignment 5:  Art Render

// TODO: You need to calculate per-fragment shading here using a toon shading model

in vec3 Position;
in vec3 Normal;

out vec4 color;

uniform vec3 lightPosition;
uniform vec4 Ia, Id, Is;

uniform vec4 ka, kd, ks;
uniform float s;

uniform sampler2D diffuseRamp;
uniform sampler2D specularRamp;


void main() {
        // unit vector from the fragment to the light
    vec3 l = normalize(lightPosition - Position);
    
    // unit vector from the fragment to the eye point, which is at 0,0,0 in "eye space"
    vec3 e = normalize(-Position);

    // normal transformed into "eye space"
    vec3 n = normalize(Normal);
    
    // halfway vector
    vec3 h = normalize(l + e); //(l+e)/2 average of light + eye
    
    //color
    vec2 texDif = vec2(0.5*dot(n, l)+0.5,0);
    vec2 texSpec = vec2(pow(max(dot(h, n), 0), s), 0);

    vec4 ambient = ka * Ia;
	vec4 diffuse = kd * Id * texture(diffuseRamp, texDif) ;//* max(dot(n, l), 0);
	vec4 specular = ks *Is*  texture(specularRamp, texSpec);// * pow(max(dot(n, h), 0), s);
    
	color = ambient + diffuse + specular;

}
