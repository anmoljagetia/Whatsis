class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int stop_flag = 0;
  
  Animation(int imgNo, int count) {
    imageCount = count;
    images = new PImage[imageCount];
    String imagePrefix;
    
    switch(imgNo){
      case 1: imagePrefix = "Happy_base_";
              break;
      case 2: imagePrefix = "Happy_out_sequence_return_";
              break;
      case 3: imagePrefix = "Happy_out_sequence_";
              break;
      case 4: imagePrefix = "Happy_hand_dance_";
              break;
      case 5: imagePrefix = "Happy_hi5_";
              break;
      case 6: imagePrefix = "Happy_hand_abwv_";
              break;
      case 7: imagePrefix = "Happy_hand_updn_";
              break;
      case 8: imagePrefix = "Happy_coming_fwd_";
              break;         
      default: imagePrefix = "Happy_base_";
              break;
    }
    
    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + i + ".png";
      
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos, int d) {
      frame = (frame + 1) % imageCount;
      //background(255,255,255);
      if(stop_flag != 1){
        image(images[frame], xpos, 0);
      }
      else      {
        return;
      }
      delay(d);
      
  }
  
  void stop(){
    stop_flag = 1;
  }
  
  int getWidth() {
    return (int)images[0].width;
  }  
}

