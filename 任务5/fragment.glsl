precision highp float;
uniform float time;
uniform vec2 resolution;
varying vec3 fPosition;
varying vec3 fNormal;
varying vec3 pp;

vec2 blinnPhongDir(vec3 lightDir, float lightInt, float Ka, float Kd, float Ks, float shininess)
{
  vec3 s = normalize(lightDir);
  vec3 v = normalize(-fPosition);
  vec3 n = normalize(fNormal);
  vec3 h = normalize(v+s);
  float diffuse = Ka + Kd * lightInt * max(0.0, dot(n, s));
  float spec =  Ks * pow(max(0.0, dot(n,h)), shininess);
  return vec2(diffuse, spec);
}

void main()
{
  vec3 lightPos = vec3(0.0, -2.0, 0.0);
  vec3 lightDir = normalize(fPosition-lightPos);
  vec2 bp = blinnPhongDir(lightDir, 1.0, 0.1, 0.8, 1.0, 1.0);
  
  float width = 0.3;
  float str = bp.x+bp.y;
  float fp = time*7.0;
  float tp = (fp-float(int(fp)));
  if(tp>0.5) tp = 1.0-tp;
  str = str*tp*8.0;
  int xb = int(fPosition.x/width); float xr = abs(fPosition.x-float(xb)*width)/width*str;
  int yb = int(fPosition.y/width); float yr = abs(fPosition.y-float(yb)*width)/width*str;
  int zb = int(fPosition.z/width); float zr = abs(fPosition.z-float(zb)*width)/width*str;
  gl_FragColor = vec4(xr, yr, zr, 1.0);
}