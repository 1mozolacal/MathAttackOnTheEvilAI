import g4p_controls.*;

//0 = storyboard
//1 = question 1, etc
private int state;

String [] answers = new String [5];
String [] clues = new String [5];
String [] codes = new String [5];


void setup(){
  size(480, 320);
  createGUI();
  
  labelClue.setVisible(false);
  codePanel.setVisible(false);
  state = 1;
  
  answers[0] = "1";
  answers[1] = "2";
  answers[2] = "3";
  answers[3] = "4";
  answers[4] = "5";
  
  clues[0] = "clue 1";
  clues[1] = "clue 2";
  clues[2] = "clue 3";
  clues[3] = "clue 4";
  clues[4] = "clue 5";
  
  codes[0] = "code 1";
  codes[1] = "code 2";
  codes[2] = "code 3";
  codes[3] = "code 4";
  codes[4] = "code 5";


}

void checkAnswer(GTextField answer){
  if (state == 0) {
    return;
  }
  if (answer.getText().equals(answers[state-1])) {
    fixBinary();
    showClue();
    codePanel.setVisible(true);
    return;
  }
  labelClue.setVisible(true);
  labelClue.setText("Incorrect Answer");
  timer2.start();
}

void checkCode(GTextField code) {
  if (state == 0) {
    return;
  }
  if (code.getText().equals(codes[state-1])) {
    newQuestion();
    timer1.start();
  }
}

void fixBinary() {
  //placeholder
  
}

void showClue() {
  labelClue.setText(clues[state-1]);
  labelClue.setVisible(true);
}

void newQuestion() {
  state++;
  textfieldInputAnswer.setText("");
  textfieldInputAnswer.setEnabled(true);
  labelClue.setVisible(false);
}


void draw(){
  background(200);
  if (state > 0 && state < 6) {
    labelQuestion.setText("Question " + state);
  }
}
