//miranda craghead 
//deal with moving the time around tomorrow 
clock myclock = new clock(); 
//reviewed clock examples on the processing page 
//https://processing.org/examples/clock.html

void setup() {
  size(600, 600);
  background(0);
  myclock.display();
  //one frame per second 
  frameRate(1);
}
//class name clock 
class clock {
  //data
  int hour;
  int minute; 
  int second;
  float angleH;
  float angleM;
  float angleS;

  //constructor
  void clock() {
    hour = hour();
    //minute
    minute = minute();
    //second hand
    second = second();
    if (hour==0 || hour==12) {
      angleH=0;
      //base case is zero 
      //no need for correction
      angleM=minute*radians(6);
      angleS=second*radians(6);
    } else {
      angleH = hour * 3.14/6;
      angleM = minute * radians(6);
      angleS = second*radians(6);
    }
  }

  //functionality
  void display() {
    //constructor inital values 
    clock();
    fill(0);
    rect(0,0,150,40);
    fill(255);
    textSize(30);
    if(second<10 ||minute<10||hour<10){
      if(second<10 && minute<10 && hour<10){
        text("0" + hour + ":0" + minute + ":0" + second, 10,30);
      }
      else if(second<10 && minute<10){
        text(hour + ":0" + minute + ":0" + second, 10,30);
      }
      else if(second<10 && hour<10){
        text("0" + hour + ":" + minute + ":0" + second, 10,30);
        
      }
      else if(minute<10 && hour<10){
        text("0" + hour + ":0" + minute + ":" + second, 10,30);
      }
      else if(minute<10){
        text(hour + ":0" + minute + ":" + second, 10,30);
      }
      else if(hour<10){
        text("0" + hour + ":" + minute + ":" + second, 10,30);
      }
      //second<10
      else{
        text(hour + ":" + minute + ":0" + second, 10,30);
      }
    }
    else{
    text(hour + ":" + minute + ":" + second, 10,30);
    }
    noStroke();
    fill(0, 255, 255);
    //outline of the clock 
    ellipse(300, 300, 600, 600);
    fill(255);
    //clock face
    ellipse(300, 300, 550, 550);
    stroke(0, 255, 190);
    strokeWeight(4);
    translate(300, 300);
    fill(0);
    textSize(60);
    text("12", -40, -215);
    text("1", 90, -190);
    text("2", 190, -100);
    text("3", 230, 20);
    text("4", 190, 135);
    text("5", 105, 225);
    text("6", -20, 260);
    text("7", -140, 225);
    text("8", -230, 135);
    text("9", -260, 20);
    text("10", -240, -80);
    text("11", -160, -170);
    rotate(angleH);
    //hour line 
    line(0, 0, 0, -110);
    noFill();
    strokeWeight(2);
    triangle(-10, -110, 10, -110, 0, -120);
    //reset
    rotate(-angleH);
    //minute hand
    rotate(angleM);
    strokeWeight(2);
    triangle(-10, -150, 10, -150, 0, -160);
    line(0, 0, 0, -150);
    //second hand 
    //strokeWeight(1);
    rotate(-angleM);
    rotate(angleS);
    line(0, 0, 0, -180);
    //strokeWeight(2);
    triangle(-10, -180, 10, -180, 0, -190);
    rotate(-angleS);
    stroke(0);
    fill(0);
    ellipse(0, 0, 10, 10);
  }
}
void draw() {
  myclock.display();
  //bebugging found the functions that tell the time 
  //println(second());
  //println(hour());
}