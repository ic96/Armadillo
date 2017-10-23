// Create shared variable. The value is given as the interpolation between normals computed in the vertex shader
varying vec3 interpolatedNormal;

/* HINT: YOU WILL NEED MORE SHARED/UNIFORM VARIABLES TO COLOR ACCORDING TO COS(ANGLE) */

void main() {
  // Set final rendered color according to the surface normal
  gl_FragColor = vec4(normalize(interpolatedNormal), 1.0); // REPLACE ME
}
