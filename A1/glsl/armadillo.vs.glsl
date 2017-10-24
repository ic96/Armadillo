// Create shared variable for the vertex and fragment shaders
varying vec3 interpolatedNormal;
uniform vec3 lightPosition;
varying float costheta;
varying vec3 FragPos;

/* HINT: YOU WILL NEED MORE SHARED/UNIFORM VARIABLES TO COLOR ACCORDING TO COS(ANGLE) */

void main() {
    // Set shared variable to vertex normal
    interpolatedNormal = normal;
    costheta = dot(interpolatedNormal, lightPosition)/(length(interpolatedNormal)*length(lightPosition));
    FragPos = vec3(modelMatrix* vec4(position, 1.0));
    // Multiply each vertex by the model-view matrix and the projection matrix to get final vertex position
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
