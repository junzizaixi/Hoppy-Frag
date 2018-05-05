precision highp float;
attribute vec3 position;
attribute vec3 normal;
uniform float time;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
varying vec3 fNormal;
varying vec3 fPosition;
varying vec3 pp;

void main()
{
  fNormal = normalize(normalMatrix * normal);
  pp = position;
  
  vec4 pos = modelViewMatrix * vec4(pp+vec3(sin(time*79.0),cos(time*61.0), sin(time*80.0+17.0)), 1.0);
  fPosition = pos.xyz;
  gl_Position = projectionMatrix * pos;
}