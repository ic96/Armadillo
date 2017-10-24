uniform vec3 lightPos2;

void main() {
	/* HINT: WORK WITH lightPosition HERE! */
    // Multiply each vertex by the model-view matrix and the projection matrix to get final vertex position
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position + lightPos2, 1.0);
}
