import SimpleOpenNI.*;
import development.*;
import ddf.minim.*;

Animation animation;

void setup() {
  animation = new Animation("", 31);
  size(842, 595);  // strange, get drawing error in the cameraFrustum if i use P3D, in opengl there is no problem
}

void draw() {
  animation.display(0, 0, 30);
}

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + i + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos, int d) {
      frame = (frame + 1) % imageCount;
      background(0);
      delay(d);
      image(images[frame], xpos, 0);
      delay(d);
  }
  
  int getWidth() {
    return (int)images[0].width;
  }  
}

