import g4p_controls.*;


PVector[] fallingNum = new PVector[100];//x loc, y loc, 1 or 0
PVector[] metaData = new PVector[100];//speed , size
boolean addWhiteBoxForClue = false;

//0 = storyboard
//1 = question 1, etc
private int state;

String [] answers = new String [5];
String [] clues = new String [5];
String [] codes = new String [5];


public boolean fixingCode = false;
public int whichLineToFix = 0;
public int currentCharFixing = 0;
public int timeStorage = 0;

void setup(){
  size(480, 320);
  createGUI();
  
  for(int i =0; i< fallingNum.length;i++ ){
    fallingNum[i] = new PVector((float)Math.random()*width, -10 - ((float)Math.random()*height), (int)(Math.random()*2) );
    metaData[i] = new PVector( (float) Math.random()*5+1 , (float) Math.random()*20+5);
  }
  
  labelClue.setVisible(false);
  textfieldEnterCode.setVisible(false);
  state = 1;
  
  answers[0] = "1";//winnie
  answers[1] = "2";//katelyn
  answers[2] = "3";//Christine
  answers[3] = "4";//Christine
  answers[4] = "5";//Calvin
  
  clues[0] = "clue 1";
  clues[1] = "clue 2";
  clues[2] = "clue 3";
  clues[3] = "clue 4";
  clues[4] = "clue 5";
  
  codes[0] = "8942";//Speaker
  codes[1] = "COAT";//Coat hanger
  codes[2] = "KUEH";//teachers desk
  codes[3] = "3679";//white board
  codes[4] = "code 5";//is not used

  labelCode1.setText( getRandomBit(30) );
  labelCode2.setText( getRandomBit(30) );
  labelCode3.setText( getRandomBit(30) );
  labelCode4.setText( getRandomBit(30) );
  labelCode5.setText( getRandomBit(30) );
}

void checkAnswer(GTextField answer){
  if (state == 0) {
    return;
  }
  if (answer.getText().equals(answers[state-1])) {
    showClue();
    textfieldEnterCode.setVisible(true);
    buttonSubmit.setEnabled(false);
    return;
  }
  labelClue.setVisible(true);
  labelClue.setText("Incorrect Answer");
  addWhiteBoxForClue=true;
  labelClue.setLocalColorScheme(GCScheme.RED_SCHEME);
  timer2.start();
}

void checkCode(GTextField code) {
  if (state == 0) {
    return;
  }
  if (code.getText().equals(codes[state-1])) {
    newQuestion();
    fixBinary();
    buttonSubmit.setEnabled(true);
    timer1.start();
  }
}

void fixBinary() {
  windowCode.setVisible(true);
  timeStorage = millis();
  currentCharFixing =0;
  fixingCode=true;
  
}

void showClue() {
  labelClue.setText(clues[state-1]);
  addWhiteBoxForClue = true;
  labelClue.setVisible(true);
}

void newQuestion() {
  state++;
  textfieldInputAnswer.setText("");
  textfieldInputAnswer.setEnabled(true);
  labelClue.setVisible(false);
}

String getRandomBit(int length_){
 String str = "";
 for (int i =0; i<length_; i++){
   if((int)(Math.random()*2) ==0){
     str+="0";
   }else {
     str+="1";
   }
 }
 return str;
}

void draw(){
  background(10);
  if (state > 0 && state < 6) {
    labelQuestion.setText("Question " + state);
  } else if(state == 6){//finshed the game
    windowStory.setVisible(true);
    labelStory.setText("You have fixed the A.I. and saved the day");
    buttonStory.setText("Horay");
  }
  
  
  for(int i = 0; i<fallingNum.length; i++){
    
    if(fallingNum[i].y>(height+10) ){
      fallingNum[i] = new PVector((float)Math.random()*width, -10, (int)(Math.random()*2) );
    } else {
      fallingNum[i].y+= metaData[i].x;
      fill(0,255,0);
      textSize(metaData[i].y);
      text((int)fallingNum[i].z, fallingNum[i].x, fallingNum[i].y);
    }
    
    
    
  }
  
  noStroke();
  fill(255,255,255);
  rect(0,0,width,70);
  
  if(addWhiteBoxForClue){
    fill(200,200,200);
    rect(140,230,180,40);
  }
  
  
  
}