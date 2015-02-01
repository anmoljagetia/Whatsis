import development.*;

Animation animation1, animation2;

float xpos;
float ypos;
float drag = 1;

void setup() {
  size(940, 560);
  background(255, 204, 0);
  frameRate(12);
  animation1 = new Animation("", 16);
  animation2 = new Animation("", 16);
  ypos = height * 0.25;
}

void draw() { 
  float dx = mouseX - xpos;
  // Display the sprite at the position xpos, ypos
//  while (true) {
  if (mousePressed) {
    background(0, 0, 0);
    animation1.display(xpos-animation1.getWidth()/2, ypos);
  } else {
    background(0, 0, 0);
    animation2.display(xpos-animation1.getWidth()/2, ypos);
  }
//  }
}



// Class for animating a sequence of GIFs

class Animation {
  PShape[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PShape[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = i + ".svg";
      images[i] = loadShape(filename);
    }
  }

  void display(float xpos, float ypos) {
//    int x = 1;
//    for (int i = 0; i < imageCount; i = i + x) {
//      if (i == frame - 1) {
//        x = -1;
//      }
//      
//      if (i == 0) {
//        x = 1;
//      }
//    }
      frame = (frame + 1) % imageCount;
      shape(images[frame], xpos, 0);
  }
  
  int getWidth() {
    return 100;
  }
}
