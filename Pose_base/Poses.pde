import SimpleOpenNI.*;


// import and declarations for minim:
import ddf.minim.*;
Minim minim, minim1;
AudioPlayer player;
// declare our poser object
SkeletonPoser pose0, pose1, pose2, pose3, pose4, pose5;

SimpleOpenNI  kinect;

void setup() {
  size(640, 480);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.enableUser();
  kinect.setMirror(true);

  // initialize the minim object
  minim = new Minim(this);
  //minim1 = new Minim(this);
  // and load the stayin alive mp3 file
  player = minim.loadFile("stayingalive.mp3");
  //player1= minim1.loadFile("pehlibaaris.mp3");

  // initialize the pose object
  getPose();
  strokeWeight(5);
}

void getPose() {

  //int num = 0;
  pose0 = new SkeletonPoser(kinect);
  pose1 = new SkeletonPoser(kinect);
  pose2 = new SkeletonPoser(kinect);
  pose3 = new SkeletonPoser(kinect);
  pose4 = new SkeletonPoser(kinect);
  pose5 = new SkeletonPoser(kinect);

  pose0.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  pose0.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  pose0.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  pose0.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // rules for the left arm
  pose0.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  pose0.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
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
  pose1.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
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
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  pose2.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  // rules for the left arm
  pose2.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
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
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_ELBOW);
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
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_ELBOW, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  //      // rules for the left arm
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  ////      pose.addRule(SimpleOpenNI.SKEL_LEFT_ELBOW, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  ////      pose.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_ELBOW);
  ////      pose.addRule(SimpleOpenNI.SKEL_LEFT_HAND, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_ELBOW);
  //      // rules for the right leg
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_RIGHT_HIP);
  ////      pose.addRule(SimpleOpenNI.SKEL_RIGHT_KNEE, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_RIGHT_HIP);
  pose4.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.ABOVE, SimpleOpenNI.SKEL_RIGHT_KNEE);
  //      pose.addRule(SimpleOpenNI.SKEL_RIGHT_FOOT, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_RIGHT_KNEE);

  //      // rules for the left leg
  //      pose.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.BELOW, SimpleOpenNI.SKEL_LEFT_HIP);
  ////      pose.addRule(SimpleOpenNI.SKEL_LEFT_KNEE, PoseRule.LEFT_OF, SimpleOpenNI.SKEL_LEFT_HIP);
  pose4.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.ABOVE, SimpleOpenNI.SKEL_LEFT_KNEE);
  ////      pose.addRule(SimpleOpenNI.SKEL_LEFT_FOOT, PoseRule.RIGHT_OF, SimpleOpenNI.SKEL_LEFT_KNEE);

  return;
}

void draw() {
  background(0);
  kinect.update();
  image(kinect.depthImage(), 0, 0);
  //int userId;

  IntVector userList = new IntVector();
  kinect.getUsers(userList);
  if (userList.size() > 0) {
    int userId = userList.get(0);
    if ( kinect.isTrackingSkeleton(userId)) {

      // check to see if the user
      // is in the pose
      if (pose0.check(userId)) {
        //if they are, set the color white
        stroke(0, 0, 255);
        // and start the song playing
        player.play();
        println("pose 0");
      }
      
      else if (pose1.check(userId)) {
      //if they are, set the color white
      stroke(0, 0, 255);
      // and start the song playing

      //player1.pause();
      player.play();
      println("pose 1");
      }
    
      else if (pose2.check(userId)) {
      //if they are, set the color white
      stroke(0, 0, 255);
      // and start the song playing

      //player1.pause();
      player.play();
      println("pose 2");
      }
    
      else if (pose3.check(userId)) {
      //if they are, set the color white
      stroke(0, 0, 255);
      // and start the song playing

      //player1.pause();
      player.play();
      println("pose 3");
      }
    
      else if (pose4.check(userId)) {
      //if they are, set the color white
      stroke(0, 0, 255);
      // and start the song playing

      //player.pause();
      player.play();
      println("pose 4");
      }   
    } 
    else {
    // otherwise set the color to red
    // and don't start the song
    stroke(255, 0, 0);
    player.pause();
    //player1.pause();
  }

  // draw the skeleton in whatever color we chose
  drawSkeleton(userId);
  }
}

void drawSkeleton(int userId) {
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_LEFT_HIP);
}

void drawLimb(int userId, int jointType1, int jointType2)
{
  PVector jointPos1 = new PVector();
  PVector jointPos2 = new PVector();
  float  confidence;

  // draw the joint position
  confidence = kinect.getJointPositionSkeleton(userId, jointType1, jointPos1);
  confidence = kinect.getJointPositionSkeleton(userId, jointType2, jointPos2);

  line(jointPos1.x, jointPos1.y, jointPos1.z, 
  jointPos2.x, jointPos2.y, jointPos2.z);
}

void keyPressed() 
{
  saveFrame("project"+random(100)+".png");
}


// user-tracking callbacks!
void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  kinect.startTrackingSkeleton(userId);
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  println("onVisibleUser - userId: " + userId);
}

