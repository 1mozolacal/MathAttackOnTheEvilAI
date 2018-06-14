/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void textfieldInputAnswer_change1(GTextField source, GEvent event) { //_CODE_:textfieldInputAnswer:382653:
  println("textfieldInputAnswer - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfieldInputAnswer:382653:

public void buttonSubmit_click1(GButton source, GEvent event) { //_CODE_:buttonSubmit:738354:
  println("buttonSubmit - GButton >> GEvent." + event + " @ " + millis());
  checkAnswer(textfieldInputAnswer);
} //_CODE_:buttonSubmit:738354:

public void codePanel_Click1(GPanel source, GEvent event) { //_CODE_:codePanel:475285:
  println("panel1 - GPanel >> GEvent." + event + " @ " + millis());
} //_CODE_:codePanel:475285:

synchronized public void winStory_draw1(PApplet appc, GWinData data) { //_CODE_:windowStory:922006:
  appc.background(230);
} //_CODE_:windowStory:922006:

public void buttonStory_click1(GButton source, GEvent event) { //_CODE_:buttonStory:723930:
  println("buttonStory - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:buttonStory:723930:

public void timer1_Action1(GTimer source) { //_CODE_:timer1:827374:
  println("timer1 - GTimer >> an event occured @ " + millis());
} //_CODE_:timer1:827374:

public void timer2_Action1(GTimer source) { //_CODE_:timer2:229519:
  println("timer2 - GTimer >> an event occured @ " + millis());
} //_CODE_:timer2:229519:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  labelQuestion = new GLabel(this, 120, 50, 180, 40);
  labelQuestion.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelQuestion.setText("{Question}");
  labelQuestion.setOpaque(false);
  textfieldInputAnswer = new GTextField(this, 130, 110, 160, 60, G4P.SCROLLBARS_NONE);
  textfieldInputAnswer.setPromptText("Type in your answer here");
  textfieldInputAnswer.setOpaque(true);
  textfieldInputAnswer.addEventHandler(this, "textfieldInputAnswer_change1");
  buttonSubmit = new GButton(this, 160, 190, 80, 30);
  buttonSubmit.setText("Submit");
  buttonSubmit.addEventHandler(this, "buttonSubmit_click1");
  labelClue = new GLabel(this, 120, 250, 170, 40);
  labelClue.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelClue.setText("{Clue}");
  labelClue.setOpaque(false);
  codePanel = new GPanel(this, 381, 4, 100, 60, "Code");
  codePanel.setText("Code");
  codePanel.setOpaque(true);
  codePanel.addEventHandler(this, "codePanel_Click1");
  windowStory = GWindow.getWindow(this, "Story", 0, 0, 480, 320, JAVA2D);
  windowStory.noLoop();
  windowStory.addDrawHandler(this, "winStory_draw1");
  labelStory = new GLabel(windowStory, 130, 50, 210, 90);
  labelStory.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  labelStory.setText("An A.I has turned evil. And now it is your job to stop it using your math skill to solve problem which will fix the A.I's code");
  labelStory.setOpaque(false);
  buttonStory = new GButton(windowStory, 180, 180, 120, 40);
  buttonStory.setText("Start your mission");
  buttonStory.addEventHandler(this, "buttonStory_click1");
  timer1 = new GTimer(this, this, "timer1_Action1", 2000);
  timer2 = new GTimer(this, this, "timer2_Action1", 2000);
  windowStory.loop();
}

// Variable declarations 
// autogenerated do not edit
GLabel labelQuestion; 
GTextField textfieldInputAnswer; 
GButton buttonSubmit; 
GLabel labelClue; 
GPanel codePanel; 
GWindow windowStory;
GLabel labelStory; 
GButton buttonStory; 
GTimer timer1; 
GTimer timer2; 
