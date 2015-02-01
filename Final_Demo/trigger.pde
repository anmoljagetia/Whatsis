import SimpleOpenNI.*;
import development.*;
import ddf.minim.*;

Minim minim; 
AudioPlayer player0, player1, player2, player3, player4, player5;

// declare our poser object
SkeletonPoser pose0, pose1, pose2, pose3, pose4, pose5;
SimpleOpenNI context;


float        zoomF =0.5f;
float        rotX = radians(180);  // by default rotate the hole scene 180deg around the x-axis, 
// the data from openni comes upside down
float        rotY = radians(0);
boolean      autoCalib=true;

boolean      isLessThanThousand = false;
boolean      justStarted = true;
int          poseActive = -1;
int          flag = 0;
int          returnPlayed = 0;
int          hideall = 0;
boolean      newShit = false;

Animation    animation1;
Animation    animation2;
Animation    animation3;
Animation    animation4;
Animation    animation5;
Animation    animation6;
Animation    animation7;
Animation    animation8;

PVector      bodyCenter = new PVector();
PVector      bodyDir = new PVector();
PVector      com = new PVector();                                   
PVector      com2d = new PVector();                                   
color[]       userClr = new color[] { 
  color(255, 0, 0), 
  color(0, 255, 0), 
  color(0, 0, 255), 
  color(255, 255, 0), 
  color(255, 0, 255), 
  color(0, 255, 255)
};


void setup()
{
  animation1 = new Animation(1, 10);
  animation2 = new Animation(2, 24);
  animation3 = new Animation(3, 29);
  animation4 = new Animation(4, 39);
  animation5 = new Animation(5, 7);
  animation6 = new Animation(6, 8);
  animation7 = new Animation(7, 7);
  animation8 = new Animation(8, 7);

  size(1024, 760);  

  context = new SimpleOpenNI(this);
  if (context.isInit() == false) {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }

  // disable mirror
  context.setMirror(false);

  // enable depthMap generation 
  context.enableDepth();

  // enable skeleton generation for all joints
  context.enableUser();

  // initialize the minim object
  minim = new Minim(this);

  //minim1 = new Minim(this);
  player0 = minim.loadFile("akapaku_3.mp3");
  player1 = minim.loadFile("akapaku_3.mp3");
  player2 = minim.loadFile("akapaku_3.mp3");
  player3 = minim.loadFile("akapaku_3.mp3");
  player4 = minim.loadFile("akapaku_3.mp3");
  player5 = minim.loadFile("akapaku_3.mp3");

  //player1= minim1.loadFile("pehlibaaris.mp3");



  stroke(255, 255, 255);
  smooth();  
  perspective(radians(45), 
  float(width)/float(height), 
  10, 150000);

  // initialize the pose object
  getPose();
  strokeWeight(25);
}

void getPose() {

  pose0 = new SkeletonPoser(context);

  pose1 = new SkeletonPoser(context);

  pose2 = new SkeletonPoser(context);

  pose3 = new SkeletonPoser(context);

  pose4 = new SkeletonPoser(context);

  pose5 = new SkeletonPoser(context);

  pose0.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  pose0.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  pose0.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  //pose0.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // rules for the left arm
  pose0.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  //pose0.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  pose0.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  pose0.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // rules for the right leg
  pose0.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_HIP);
  // rules for the left leg
  pose0.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_KNEE);


  // rules for the right arm
  pose1.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  //pose1.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  pose1.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  pose1.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // rules for the left arm
  pose1.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  pose1.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  pose1.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  pose1.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // rules for the right leg
  pose1.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_HIP);
  // rules for the left leg
  pose1.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_KNEE);


  // rules for the right arm
  pose2.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  pose2.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  pose2.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // rules for the left arm
  pose2.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  pose2.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  pose2.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // rules for the right leg
  pose2.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_HIP);
  // rules for the left leg
  pose2.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_KNEE);


  // rules for the right arm
  pose3.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  pose3.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  pose3.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);

  // rules for the left arm
  pose3.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  pose3.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_ELBOW);

  // rules for the right leg
  pose3.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_HIP);

  // rules for the left leg
  pose3.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_HIP);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_KNEE);


  // rules for the right arm
  pose4.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  pose4.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  //      pose4.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);

  // rules for the left arm
  pose4.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  //pose4.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  pose4.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_ELBOW);

  // rules for the right leg
  pose4.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  ////      pose.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_HIP);
  //pose4.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_KNEE);

  //      // rules for the left leg
  pose4.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  ////      pose.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_HIP);
  //pose4.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_KNEE);
  ////      pose.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_KNEE);


  // rules for the right arm
  pose5.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  pose5.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  //  //      pose4.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  pose5.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // rules for the left arm
  //  pose5.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  pose5.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  pose5.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  pose5.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_ELBOW);
  // rules for the right leg
  pose5.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  //  ////      pose.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_HIP);
  //  //pose4.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_KNEE);
  //  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_KNEE);
  //
  //       rules for the left leg
  pose5.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  //  ////      pose.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_HIP);
  //  //pose5.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_KNEE);
  //  ////      pose.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_KNEE);

  return;
}


void draw()
{  
  // update the cam
  context.update();

  //setup the background
  background(0, 0, 0);

  if (isLessThanThousand == false && justStarted == false && returnPlayed == 0) {
    println("Animation 7 : Out Return");
    background(255, 0, 0);
    //animation0.stop();
    //    animation1.stop();
    //    animation3.stop();
    //    animation4.stop();
    //    animation5.stop();
    //animation2 = new Animation("Happy_out_sequence_return_", 24);
    animation1.stop();
    animation7.display(34, 100, 100);
    returnPlayed = 1;
    flag = 2;
  }

  if (flag != 1 && isLessThanThousand == false && (poseActive == 0 || poseActive == 1) && returnPlayed == 1) {
    println("Animation 7 : Hand Dance");
    background(0, 255, 0);
    //animation0.stop();
    //    animation1.stop();
    //    animation3.stop();
    //    animation2.stop();
    //    animation5.stop();
    //animation4 = new Animation("Happy_hand_dance_", 39);
    animation1.stop();
    animation7.display(34, 100, 100);
    //returnPlayed = 1;
    //flag = 2;
  }

  if (flag != 1 && isLessThanThousand == false && poseActive == 2 && justStarted == false && returnPlayed == 1) {
    println("Animation 6 : Hi 5");
    background(0, 0, 255);
    //animation0.stop();
    //    animation1.stop();
    //    animation3.stop();
    //    animation4.stop();
    //    animation2.stop();
    //animation5 = new Animation("Happy_hi5_", 7);
    animation1.stop();
    animation6.display(34, 100, 100);
    //returnPlayed = 1;
    //flag = 2;
  }

  if (flag == 2 && isLessThanThousand == false && poseActive == 3 && justStarted == false) {
    println("Animation 5 : #####");
    background(255, 255, 0);
    //animation0.stop();
    //    animation1.stop();
    //    animation4.stop();
    //    animation5.stop();
    //    animation2.stop();
    //animation3 = new Animation("Happy_out_sequence_", 29);
    animation1.stop();
    animation5.display(34, 100, 100);
    //returnPlayed = 1;
    //flag = 2;
  }

  if (flag == 2 && isLessThanThousand == false && poseActive == 4 && justStarted == false) {
    println("Animation 5 : ----");
    background(255, 255, 0);
    //animation0.stop();
    //    animation1.stop();
    //    animation4.stop();
    //    animation5.stop();
    //    animation2.stop();
    //animation3 = new Animation("Happy_out_sequence_", 29);
    animation1.stop();
    animation5.display(34, 100, 100);
    //returnPlayed = 1;
    //flag = 2;
  }

  if (flag == 2 && isLessThanThousand == false && poseActive == 5 && justStarted == false) {
    println("Animation 4 : ----");
    background(255, 255, 0);
    //animation0.stop();
    //    animation1.stop();
    //    animation4.stop();
    //    animation5.stop();
    //    animation2.stop();
    //animation3 = new Animation("Happy_out_sequence_", 29);
    animation1.stop();
    animation4.display(34, 100, 100);
    //returnPlayed = 1;
    //flag = 2;
  }

  //animations that play by default on startup
  if (justStarted == true || isLessThanThousand == false) {
    println("Animation 1 : Base");
    //background(255, 255, 255);
    //animation0.stop();
    //     animation3.stop();
    //     animation4.stop();
    //     animation5.stop();
    //     animation2.stop();
    //animation1 = new Animation("Happy_base_", 10);
    animation1.display(34, 100, 100);
  }

  if (isLessThanThousand) {
    background(255, 0, 255);
    println("Animation 10 : Scared Animation");
    //animation0.stop();
    //    animation1.stop();
    //    animation4.stop();
    //    animation5.stop();
    //    animation2.stop();
    //animation3 = new Animation("Happy_out_sequence_", 29);
    animation1.stop();
    animation3.display(34, 100, 100);
    //delay(500);
    //animation2.display(34, 100, 100);
    justStarted = false;
  }

  //  if(newShit == true && flag == 2 && isLessThanThousand == false && justStarted == false) {
  //    animation1.stop();
  //    animation3.display(34, 100, 100);
  //  }




  // set the scene pos
  translate(width/2, height/2, 0);

  rotateX(rotX);
  rotateY(rotY);

  scale(zoomF);

  int[]   depthMap = context.depthMap();
  int[]   userMap = context.userMap();
  int     steps   = 3;  // to speed up the drawing, draw every third point
  int     index;
  PVector realWorldPoint;

  translate(0, 0, -1000);  // set the rotation center of the scene 1000 infront of the camera

  IntVector userList = new IntVector();

  context.getUsers(userList);

  if (userList.size() > 0) {
    int userId = userList.get(0);
    if ( context.isTrackingSkeleton(userId)) {
      // check to see if the user
      // is in the pose
      if (pose0.check(userId)) {
        //if they are, set the color white
        stroke(0, 0, 255);
        // and start the song playing
        player1.pause();
        player2.pause();
        player3.pause();
        player4.pause();
        player5.pause();
        player0.play();
        poseActive = 0;
        justStarted = false;
        println("pose 0");
      } else if (pose1.check(userId)) {
        //if they are, set the color white
        stroke(0, 0, 255);
        // and start the song playing
        //player1.pause();
        player0.pause();
        player2.pause();
        player3.pause();
        player4.pause();
        player5.pause();

        player1.play();
        justStarted = false;
        poseActive = 1;
        println("pose 1");
      } else if (pose2.check(userId)) {
        //if they are, set the color white
        stroke(0, 0, 255);
        // and start the song playing
        //player1.pause();
        player1.pause();
        player0.pause();
        player3.pause();
        player4.pause();
        player5.pause();

        player2.play();
        justStarted = false;
        poseActive = 2;
        println("pose 2");
      } else if (pose3.check(userId)) {
        //if they are, set the color white
        stroke(0, 0, 255);
        // and start the song playing
        //player1.pause();
        player1.pause();
        player2.pause();
        player0.pause();
        player4.pause();
        player5.pause();

        player3.play();
        justStarted = false;
        poseActive = 3;
        println("pose 3");
      } else if (pose4.check(userId)) {
        //if they are, set the color white
        stroke(0, 0, 255);
        // and start the song playing
        //player.pause();
        player1.pause();
        player2.pause();
        player3.pause();
        player0.pause();
        player5.pause();

        player4.play();
        justStarted = false;
        poseActive = 4;
        println("pose 4");
      } else if (pose5.check(userId)) {
        //if they are, set the color white
        stroke(255, 255, 255);
        // and start the song playing
        //player.pause();
        player1.pause();
        player2.pause();
        player3.pause();
        player0.pause();
        player4.pause();

        player5.play();
        justStarted = false;
        poseActive = 5;
        println("pose 5");
      }
    } else {
      // otherwise set the color to red
      // and don't start the song
      stroke(255, 0, 0);
      player0.pause();
      player1.pause();
      player2.pause();
      player3.pause();
      player4.pause();
      player5.pause();
    }


    for (int i = 0; i < userList.size (); i++) {

      if (context.isTrackingSkeleton(userList.get(i))) {
        drawSkeleton(userList.get(i));
      }

      // draw the center of mass
      if (context.getCoM(userList.get(i), com)) {
        stroke(100, 255, 0);
        strokeWeight(25);
        beginShape(LINES);
        vertex(com.x - 15, com.y, com.z);
        vertex(com.x + 15, com.y, com.z);

        vertex(com.x, com.y - 15, com.z);
        vertex(com.x, com.y + 15, com.z);

        vertex(com.x, com.y, com.z - 15);
        vertex(com.x, com.y, com.z + 15);
        //println("onNewUser - userId [y]: " + com.y);
        endShape();

        fill(0, 255, 100);
        text(Integer.toString(userList.get(i)), com.x, com.y, com.z);
      }
    }
  }
}

// draw the skeleton with the selected joints
void drawSkeleton(int userId) {
  strokeWeight(25);

  // to get the 3d joint data
  //drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);

  //drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  //drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  //drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);

  //drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  //drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  //drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);

  drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);

  drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);

  drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  

  // draw body direction
  getBodyDirection(userId, bodyCenter, bodyDir);

  bodyDir.mult(200);  // 200mm length
  bodyDir.add(bodyCenter);

  stroke(255, 200, 200);
  line(bodyCenter.x, bodyCenter.y, bodyCenter.z, 
  bodyDir.x, bodyDir.y, bodyDir.z);
  //println("x:"+ bodyCenter.x + " y:" + bodyCenter.y + " z:" + bodyCenter.z);
  println(" z:" + bodyCenter.z);

  if ( bodyCenter.z < 1000) {
    isLessThanThousand = true;
    strokeWeight(25);
  } else {
    isLessThanThousand = false;
  }
}

void drawLimb(int userId, int jointType1, int jointType2)
{
  PVector jointPos1 = new PVector();
  PVector jointPos2 = new PVector();
  float  confidence;

  // draw the joint position
  confidence = context.getJointPositionSkeleton(userId, jointType1, jointPos1);
  //println("Joint Type:" + jointType1 + " Joint Vec:" + jointPos1);

  confidence = context.getJointPositionSkeleton(userId, jointType2, jointPos2);

  stroke(255, 0, 0, confidence * 200 + 55);
  line(jointPos1.x, jointPos1.y, jointPos1.z, 
  jointPos2.x, jointPos2.y, jointPos2.z);

  drawJointOrientation(userId, jointType1, jointPos1, 50);
}

void drawJointOrientation(int userId, int jointType, PVector pos, float length)
{
  // draw the joint orientation  
  PMatrix3D  orientation = new PMatrix3D();
  float confidence = context.getJointOrientationSkeleton(userId, jointType, orientation);
  if (confidence < 0.001f) 
    // nothing to draw, orientation data is useless
    return;

  pushMatrix();
  translate(pos.x, pos.y, pos.z);

  // set the local coordsys
  applyMatrix(orientation);

  // coordsys lines are 100mm long
  // x - r
  stroke(255, 0, 0, confidence * 200 + 55);
  line(0, 0, 0, 
  length, 0, 0);
  // y - g
  stroke(0, 255, 0, confidence * 200 + 55);
  line(0, 0, 0, 
  0, length, 0);
  // z - b    
  stroke(0, 0, 255, confidence * 200 + 55);
  line(0, 0, 0, 
  0, 0, length);
  popMatrix();
}


// -----------------------------------------------------------------
// SimpleOpenNI user events

void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  newShit = true;
  context.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  //println("onVisibleUser - userId: " + userId);
}



void keyPressed()
{
  switch(key) {
  case ' ':
    context.setMirror(!context.mirror());
    break;
  }

  switch(keyCode) {
  case LEFT:
    rotY += 0.1f;
    break;
  case RIGHT:
    // zoom out
    rotY -= 0.1f;
    break;
  case UP:
    if (keyEvent.isShiftDown())
      zoomF += 0.01f;
    else
      rotX += 0.1f;
    break;
  case DOWN:
    if (keyEvent.isShiftDown())
    {
      zoomF -= 0.01f;
      if (zoomF < 0.01)
        zoomF = 0.01;
    } else
      rotX -= 0.1f;
    break;
  }
}

void getBodyDirection(int userId, PVector centerPoint, PVector dir)
{
  PVector jointL = new PVector();
  PVector jointH = new PVector();
  PVector jointR = new PVector();
  float  confidence;

  // draw the joint position
  confidence = context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, jointL);
  confidence = context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_HEAD, jointH);
  confidence = context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, jointR);

  // take the neck as the center point
  confidence = context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_NECK, centerPoint);

  /*  // manually calc the centerPoint
   PVector shoulderDist = PVector.sub(jointL,jointR);
   centerPoint.set(PVector.mult(shoulderDist,.5));
   centerPoint.add(jointR);
   */

  PVector up = PVector.sub(jointH, centerPoint);
  PVector left = PVector.sub(jointR, centerPoint);

  dir.set(up.cross(left));
  dir.normalize();
}

