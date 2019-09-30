void setup() {
  size(512, 256, P3D);
}
float xRot=0;
float yRot=0;
float zRot=0;
float osc=4;
float divGrid=1;
int cuadros=1;
void draw() {
  background(0);
  translate(width/2, height/2, -height);
  rotateX(radians(xRot));
  rotateY(radians(yRot));
  rotateZ(radians(zRot));
  strokeWeight(2);
  for (int j=0; j<=360; j+=divGrid) {
    rotateY(radians(j));
    for (int i=-width; i<=width; i+=divGrid) {
      float angulo=map(i, -width, width, -360*osc, 360*osc);
      float yy=map(sin(radians(angulo))/radians(angulo), -1, 1, height, -height);
      stroke(255, 0, 0, map(abs(yy), height, 0, 255, 0));
      point(i, yy);
    }
  }
  if (xRot<360) {
    xRot+=0.5;
  }
  if (yRot<360) {
    yRot+=0.5;
  }
  if (zRot<360) {
    zRot+=0.5;
  }
  if (cuadros<=720) {
    saveFrame("gif/space004-######.png");
    cuadros++;
    println(cuadros);
  }
}
