// Import the Video Library, setup webcam , video
import processing.video.*;
Capture cam;
Movie movie;

// Import the Sound Library
import processing.sound.*;
SoundFile file;

// Import the rita Grammar
import rita.*;

//Setting up different variabels for each phrase
RiGrammar phrase1;
RiGrammar phrase2;
RiGrammar phrase3;
RiGrammar phrase4;
RiGrammar phrase5;
RiGrammar phrase6;
String output1;
String output2;
String output3;
String output4;
String output5;
String output6;

void setup()
{
  size(640, 480);
  textLeading(26);
  //Creating the Chinese calligraphy font
  textFont(createFont("abc.ttf",40));
 
  //setting up camera for capturing
  cam = new Capture(this, width, height);
  cam.start();
  
  //setting up muted video
  //ink study from (https://www.youtube.com/watch?v=RUina9K2Y8g)
  movie = new Movie(this, "123.mp4"); 
  movie.loop();
  movie.volume(0);
  
  //setting up sound
  file = new SoundFile(this, "Famous Chinese Classical Music Return of the Fishing Boat.mp3");
  file.loop(); 
  
  //loading six grammar files for each phrase
  phrase1 = new RiGrammar(this);
  phrase1.loadFrom("phrase1.yaml");
  phrase2 = new RiGrammar(this);
  phrase2.loadFrom("phrase2.yaml");
  phrase3 = new RiGrammar(this);
  phrase3.loadFrom("phrase3.yaml");
  phrase4 = new RiGrammar(this);
  phrase4.loadFrom("phrase4.yaml");
  phrase5 = new RiGrammar(this);
  phrase5.loadFrom("phrase5.yaml");
  phrase6 = new RiGrammar(this);
  phrase6.loadFrom("phrase6.yaml");
  mouseReleased();
  
  
}

void movieEvent(Movie m)
{
  m.read(); 
}


void draw() 
{
 
  fill(255);
  // Vertically arranged the phrases 
  // modified from code provide by "QUARK" https://processing.org/discourse/beta/num_1265980385.html
  for(int i = 1; i <= output1.length(); i++){
    text(output1.substring(i-1,i), 550, 50 + i *50);
    text(output2.substring(i-1,i), 450, 50 + i *50);
    text(output3.substring(i-1,i), 350, 50 + i *50);
    text(output4.substring(i-1,i), 250, 50 + i *50);
    text(output5.substring(i-1,i), 150, 50 + i *50);
    text(output6.substring(i-1,i), 50, 50 + i *50);
  }
  
  if (cam.available()) 
  {
    cam.read();
  }
  
  image(cam, 0, 0);
  //setting up the colour effect of camera images
  fill(255);
  filter(GRAY);
  tint(255,10);
  image(movie, 0, 0, width, height);
 
}

//with each mouse click so to change the words in each phrase

void mouseReleased()
{ 
  output1 = phrase1.expandFrom("P0");
  println(output1);
  
  output2 = phrase2.expandFrom("P0");
  println(output2);
  
  output3 = phrase3.expandFrom("P0");
  println(output3);
  
  output4 = phrase4.expandFrom("P0");
  println(output4);
  
  output5 = phrase5.expandFrom("P0");
  println(output5);
  
  output6 = phrase6.expandFrom("P0");
  println(output6);
}