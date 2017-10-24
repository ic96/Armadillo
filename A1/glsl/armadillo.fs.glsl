// Create shared variable. The value is given as the interpolation between normals computed in the vertex shader

varying vec3 interpolatedNormal;
uniform vec3 lightPosition;
varying float costheta;
varying vec3 FragPos;


/* HINT: YOU WILL NEED MORE SHARED/UNIFORM VARIABLES TO COLOR ACCORDING TO COS(ANGLE) */

void main() {
  // Set final rendered color according to the surface normal
vec3 gray = vec3(1,1,1);
vec3 green = vec3(0,1,0);

float dist = distance(lightPosition, FragPos);

if(dist <= 4.0){
    gl_FragColor = vec4(green*-costheta, 1);
} else{
    gl_FragColor = vec4(gray*-costheta,1);
    }
}
