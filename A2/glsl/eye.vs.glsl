// Shared variable passed to the fragment shader
varying vec3 color;
uniform vec3 lightPosition;
uniform vec3 eyePosition;
#define MAX_EYE_DEPTH 0.15

void main() {
  // simple way to color the pupil where there is a concavity in the sphere
  // position is in local space, assuming radius 1
  float d = min(1.0 - length(position), MAX_EYE_DEPTH);
  color = mix(vec3(1.0), vec3(0.0), d * 1.0 / MAX_EYE_DEPTH);
    float angle = 1.57;
    mat4 translation = mat4(1, 0, 0, 0,
                            0, 1, 0, 0,
                            0, 0, 1, 0,
                            eyePosition, 1);
    mat4 scaling = mat4(0.2, 0, 0, 0,
                         0, 0.2, 0, 0,
                         0,  0, 0.2, 0,
                         0,  0,  0,  1);
    mat4 rotateX = mat4( 1 ,   0 ,    0,      0,
                            0, cos(angle), sin(angle),0,
                            0, -sin(angle), cos(angle), 0,
                            0,     0,           0,     1);
    mat4 rotateZ = mat4( cos(angle) ,   sin(angle) ,    0,      0,
                        -sin(angle), cos(angle), 0,0,
                           0,       0,      1,       0,
                           0,     0,        0,     1);

    mat4 rotateY = mat4( cos(angle) ,   0 , -sin(angle),  0,
                          0, 1, 0,0,
                         sin(angle),  0, cos(angle),  0,
                           0,     0,        0,     1);

   vec3 z = normalize(lightPosition - eyePosition);
   vec3 x = normalize(cross(vec3(0,1,0), z));
   vec3 y = cross(z, x);

   mat4 lookAtMatrix = mat4(x ,0,y,0,z,0,
                              eyePosition,1);

  // Multiply each vertex by the model-view matrix and the projection matrix to get final vertex position
  gl_Position = projectionMatrix * modelViewMatrix * translation * lookAtMatrix* rotateX * rotateY * scaling * vec4(position, 1.0);
}
