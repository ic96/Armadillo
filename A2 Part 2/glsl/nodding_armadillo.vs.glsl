// Shared variable passed to the fragment shader
varying vec3 color;
// Constant set via your javascript code
uniform float angle;
uniform float y_angle;
uniform float z_angle;

uniform float armAngle;
uniform float y_armAngle;
uniform float z_armAngle;

uniform float x_leg;
uniform float y_leg;
uniform float z_leg;

void main() {
	// No lightbulb, but we still want to see the armadillo!
	vec3 l = vec3(0.0, 0.0, -1.0);
	color = vec3(1.0) * dot(l, normal);

	// Identifying the head

vec3 neck = vec3(0.0, 2.5, -0.3);
vec3 arm = vec3 (-2, 2.5, -0.3);
vec3 ears = vec3(0.2, 2.8, -0.3);
vec3 legs = vec3(-0.5, 1.5, 0);


 // HEAD
    if (position.z < -0.33 && abs(position.x) < 0.46){
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
     mat4 rotateY = mat4( cos(y_angle) ,   0 , -sin(y_angle),  0,
                                                  0, 1, 0,0,
                                                 sin(y_angle),  0, cos(y_angle),  0,
                                                   0,     0,        0,     1);
      mat4 rotateZ = mat4( cos(z_angle) ,   sin(z_angle) ,    0,      0,
                             -sin(z_angle), cos(z_angle), 0,0,
                                0,       0,      1,       0,
                                0,     0,        0,     1);
   gl_Position = projectionMatrix * modelViewMatrix  * translation *rotateZ * rotateX * rotateY * inverse* vec4(position, 1.0);

} // ARMS
 else if(position.z < -0.33 && abs(position.x) < 2.5){
      mat4 inverse = mat4(1,0,0,0,
                                0,1,0,0,
                                0,0,1,0,
                                -arm, 1);

       mat4 translation = mat4(1,0,0,0,
                               0,1,0,0,
                               0,0,1,0,
                               arm, 1);
       mat4 rotateX = mat4( 1 ,   0 ,    0,      0,
                            0, cos(armAngle), sin(armAngle),0,
                            0, -sin(armAngle), cos(armAngle), 0,
                            0,     0,           0,     1);

       mat4 rotateY = mat4( cos(y_armAngle) ,   0 , -sin(y_armAngle),  0,
                            0, 1, 0,0,
                            sin(y_armAngle),  0, cos(y_armAngle),  0,
                            0,     0,        0,     1);

       mat4 rotateZ = mat4( cos(z_armAngle),sin(z_armAngle), 0,0,
                          -sin(z_armAngle), cos(z_armAngle), 0,0,
                           0,       0,      1,       0,
                           0,     0,        0,     1);
    gl_Position = projectionMatrix * modelViewMatrix  * translation * rotateZ * rotateX * rotateY* inverse* vec4(position, 1.0);


  } // LEGS
  else if(position.z < -0.2 && position.y < 2.1 && abs(position.x) < 0.4){
         mat4 inverse = mat4(1,0,0,0,
                                   0,1,0,0,
                                   0,0,1,0,
                                   -legs, 1);

          mat4 translation = mat4(1,0,0,0,
                                  0,1,0,0,
                                  0,0,1,0,
                                  legs, 1);
          mat4 rotateX = mat4( 1 ,   0 ,    0,      0,
                               0, cos(x_leg), sin(x_leg),0,
                               0, -sin(x_leg), cos(x_leg), 0,
                               0,     0,           0,     1);

          mat4 rotateY = mat4( cos(y_leg) ,   0 , -sin(y_leg),  0,
                               0, 1, 0,0,
                               sin(y_leg),  0, cos(y_leg),  0,
                               0,     0,        0,     1);

          mat4 rotateZ = mat4( cos(z_leg),sin(z_leg), 0,0,
                             -sin(z_leg), cos(z_leg), 0,0,
                              0,       0,      1,       0,
                              0,     0,        0,     1);
       gl_Position = projectionMatrix * modelViewMatrix  * translation * rotateZ * rotateX * rotateY* inverse* vec4(position, 1.0);

} else  {
	// Multiply each vertex by the model-view matrix and the projection matrix to get final vertex position
	gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
	}
}
