PImage src;
int[] xs, ys;
float[] ns;
float t;

void setup() {
  src = loadImage("http://behance.vo.llnwd.net/profiles12/278483/projects/862398/967eded2e5a7bdbcb8317e7ca4491650.jpg");
  src.resize(src.width * 2, src.height * 2);
  size(src.width, src.height);
  render();
}

void draw() {
  // Do nothing but listen for a keypress.
}

void render() {
  background(255);
  noFill();

  t = random(1000);
  xs = new int[width];
  ys = new int[height];
  ns = new float[height];

  for (int i = 0; i < width; i+= 20) {
    xs[i] = i;
  }

  for (int i = 0; i < height; i += 3) {
    ys[i] = i;
    t += 0.0025;
    ns[i] = map(noise(t), 0, 1, -500, 500);
  }

  for (int x = 0; x < xs.length; x++) {
    for (int y = 0; y < ys.length; y++) {
      int newX = floor(xs[x] + ns[y]);
      newX = (newX > width) ? -width + newX : newX;
      newX = (newX < 0) ? width + newX : newX;
      int c = src.get(newX, ys[y]);
      float radius = map(brightness(c), 0, 255, 15, 0);
      strokeWeight(radius);
      stroke(40);
      point(newX + random(-0.5, 0.5), ys[y]);
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    render();
  }
  if (key == 's' || key == 'S') {
    save("data/output/composition-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + ".tif");
  }
}

