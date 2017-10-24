
uniform vec3 lightPosition;
uniform vec3 eyePosition;

void main() {



  float dist = distance(lightPosition, eyePosition)*0.5;

  mat4 scaling = mat4(1, 0, 0, 0,
                      0, dist, 0, 0,
                      0,  0, 1, 0,
                      0,  0,  0,  1);

 float angle = 1.57;

 mat4 rotateX = mat4( 1 ,   0 ,    0,      0,
                            0, cos(angle), sin(angle),0,
                            0, -sin(angle), cos(angle), 0,
                            0,     0,           0,     1);

    vec3 z = normalize(lightPosition - eyePosition);
    vec3 x = normalize(cross(vec3(0,1,0), z));
    vec3 y = cross(z, x);
    mat4 lookAtMatrix = mat4(x ,0,y,0,z,0,
                                  eyePosition,1);

    gl_Position = projectionMatrix * modelViewMatrix * lookAtMatrix* rotateX * scaling* vec4(position, 1.0);
}
