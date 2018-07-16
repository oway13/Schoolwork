#version 330

// Gouraud Shader Example

// uniform = variables passed in from the C++ code
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform mat4 normalMatrix;

uniform vec3 lightPosition; //already in eye space
uniform vec4 Ia, Id, Is;
uniform vec4 ka, kd, ks;
uniform float s;

// these variables come from the mesh data stored in buffers in gfx card memory
layout(location = 0) in vec3 vertex;
layout(location = 1) in vec3 normal;

// for Gouraud shading, the key output of the vertex shader is the color
// calculated based on lighting this vertex
out vec4 color;



void main() {
    
    // vertex position in "eye space"
    vec3 v = (modelViewMatrix * vec4(vertex,1)).xyz;

    // unit vector from the vertex to the light
    vec3 l = normalize(lightPosition - v);
    
    // unit vector from the vertex to the eye point, which is at 0,0,0 in "eye space"
    vec3 e = normalize(-v);

    // normal transformed into "eye space"
    vec3 n = (normalMatrix * vec4(normal,0)).xyz;
    
    // halfway vector
    vec3 h = normalize(l + e); //(l+e)/2 average of light + eye
    

    // color = ka*Ia + kd*Id*(n dot l) + ks*Is*(h dot n)^s
    //color = vec4(0,1,1,1);
    vec4 ambient = ka * Ia;
	vec4 diffuse = kd * Id * max(dot(n, l), 0);
	vec4 specular = ks * Is * pow(max(dot(n, h), 0), s);
	color = ambient + diffuse + specular;
    
    // standard projection of the incoming vertex
    gl_Position = projectionMatrix * modelViewMatrix * vec4(vertex,1);
}
