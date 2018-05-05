precision highp float;
attribute vec3 position;        //顶点坐标
attribute vec3 normal;          //法线坐标
uniform float time;            //旋转时间
uniform mat3 normalMatrix;    //法向量的变换矩阵
uniform mat4 modelViewMatrix;     //顶点的模型投影矩阵 
uniform mat4 projectionMatrix;    //透视矩阵
varying vec3 fNormal;           
varying vec3 fPosition;
varying vec3 pp;

void main()
{
  fNormal = normalize(normalMatrix * normal);    //顶点法向量归一化
  pp = position;
  
  vec4 pos = modelViewMatrix * vec4(pp+vec3(sin(time*79.0),cos(time*61.0), sin(time*80.0+17.0)), 1.0);
  fPosition = pos.xyz;
  gl_Position = projectionMatrix * pos;
}