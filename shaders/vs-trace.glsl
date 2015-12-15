
uniform mat4 iModelMat;
uniform float time;

varying vec3 vPos;
varying vec3 vNorm;
varying vec3 vCam;

varying vec3 vMNorm;
varying vec3 vMPos;

varying vec2 vUv;
varying float vNoise;

$simplex


void main(){

  vUv = uv;

  vPos = position;
  vNorm = normal;

  vMNorm = normalMatrix * normal;
  vMPos = (modelMatrix * vec4( position , 1. )).xyz;

  vCam   = ( iModelMat * vec4( cameraPosition , 1. ) ).xyz;

  vNoise = snoise( vMPos  * 10. + vec3(0. , time , 0.));

  //vLight = ( iModelMat * vec4(  vec3( 400. , 1000. , 400. ) , 1. ) ).xyz;


  // Use this position to get the final position 
  gl_Position = projectionMatrix * modelViewMatrix * vec4( position , 1.);

}