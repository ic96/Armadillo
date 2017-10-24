uniform int colorChange;

void main() {
	// Set constant color
    vec3 red = vec3(1,0,0);
    vec3 orange = vec3(1,0.5,0);
    vec3 blue = vec3(0,0,1);
    vec3 yellow = vec3(1,1,0);

    if(colorChange == 0){
    gl_FragColor = vec4(red,1);
    } else
    if(colorChange == 1){
     gl_FragColor = vec4(orange,1);
     } else
     if(colorChange == 2){
    gl_FragColor = vec4(blue,1);
    } else
    if(colorChange == 3){
    gl_FragColor = vec4(yellow,1);
    }

}