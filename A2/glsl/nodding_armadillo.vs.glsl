// Shared variable passed to the fragment shader
varying vec3 color;
// Constant set via your javascript code
uniform float angle;
uniform float armAngle;

void main() {
	// No lightbulb, but we still want to see the armadillo!
	vec3 l = vec3(0.0, 0.0, -1.0);
	color = vec3(1.0) * dot(l, normal);

	// Identifying the head

vec3 neck = vec3(0.0, 2.5, -0.3);

mat4 inverse = mat4(1,0,0,0,
                    0,1,0,0,
                    0,0,1,0,
                   -neck, 1);
mat4 translation = mat4(1,0,0,0,
                        0,1,0,0,
                        0,0,1,0,
                        neck, 1);
mat4 rotateX = mat4( 1 ,   0 ,    0,      0,
                    0, cos(angle), sin(angle),0,
                    0, -sin(angle), cos(angle), 0,
                    0,     0,           0,     1);



   if (position.z < -0.33 && abs(position.x) < 0.46){
   gl_Position = projectionMatrix * modelViewMatrix  * translation * rotateX * inverse* vec4(position, 1.0);

} else{
	// Multiply each vertex by the model-view matrix and the projection matrix to get final vertex position
	gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
	}
}
