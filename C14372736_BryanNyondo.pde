//Bryan Nyondo C14372736
// states
  final int stateMenu                  = 0;
  final int stateSeeDotChart           = 1;
  final int stateSeePieChart           = 2;
  final int stateSeeGame               = 3;
  int state = stateMenu;

// font
  PFont font;
  color[] dessert = {#9F9694, #791F33, #BA3D49, #F1E6D4, #E2E1DC};
  color[] palette = dessert;
  PFont titleFont, labelFont;
  
// snake variables 
  int snakesize=1; //size of the snake 
  int MAXLENGTH=1011; 
  int headx[]=new int[MAXLENGTH]; //xlocation 
  int heady[]=new int[MAXLENGTH]; //ylocation 
  int i; 

//FOOD VARIABLES 
  int yumx=(round(random(49))+1)*10; 
  int yumy=(round(random(49))+1)*10; 

//SPEED          
  int xspeed, yspeed; 

// ----------------------------------------------------------------------
// main functions


  TChart sheak;
  int rowCount;
  float mx = 29; // mouseX

void setup()
{
  // runs only once
  size(600, 500, P3D);
  
  
  sheak = new TChart("shakespeare.tsv");
  rowCount = sheak.getRowCount();
  println("rowCount = " + rowCount);
  
  titleFont = loadFont("GillSans-Bold-18.vlw");
  labelFont = loadFont("GillSans-12.vlw");
  smooth();
  
  headx[0] = 250; 
  heady[0] = 250; 
  // SNAKE HEAD BEGINS UNMOVING. 
           
  xspeed=0;     
  yspeed=0;
  
} // func
//
void draw()
{
  //Background
  
  // the main routine. It handels the states.
  // runs again and again
  switch (state) {
  case stateMenu:
    showMenu();  
    break;
  case stateSeeDotChart:
    handleStateSeeDotChart();
    break;
  case stateSeePieChart:
    handleStateSeePieChart();
    break;
    case stateSeeGame:
    handleStateSeeGame();
    break;
  default:
    println ("Unknown state (in draw) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch
  //
} // func
// ----------------------------------------------------------------
// keyboard functions

void keyPressed() {
  
  // keyboard. Also different depending on the state.
  switch (state) {
  case stateMenu:
    keyPressedForStateMenu();
    break;
  case stateSeeDotChart:
    keyPressedForStateSeeDotChart();
    break;
  case stateSeePieChart:
    keyPressedForStateSeePieChart();
    break;
  case stateSeeGame:
    keyPressedForStateSeeGame();
    break;
  default:
    println ("Unknown state (in keypressed) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch
  //
} // func
void keyPressedForStateMenu() {
  //
  switch(key) {
  case '1':
    state = stateSeeDotChart;
    break;
  case '2':
    state = stateSeePieChart;
    break;
    case '3':
    state = stateSeeGame;
    break;
  case 'x':
  case 'X':
    // quit
    exit();
    break;
  default:
    // do nothing
    break;
  }// switch
  
  //
} // func
void keyPressedForStateSeeDotChart() {
  // any key is possible
  switch(key) {
  default:
    state = stateMenu;
    break;
  } // switch
  //
} // func
void keyPressedForStateSeePieChart() {
  // any key is possible
  switch(key) {
  default:
    state = stateMenu;
    break;
  } // switch
  //
} // func
void keyPressedForStateSeeGame() {
  // any key is possible
  switch(key) {
    case 'w':
    xspeed=0; 
    yspeed=-2;
    break;
  case 'a':
    xspeed=-2; 
    yspeed=0;
    break;
    case 's':
    xspeed=0; 
    yspeed=2;
    break;
    case 'd':
    xspeed=2; 
    yspeed=0;
    break;
  default:
    state = stateMenu;
    break;
  } // switch
  //
}
// ----------------------------------------------------------------
// functions to show the menu and functions that are called from the menu.
// They depend on the states and are called by draw().

void showMenu() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  //textAlign(CENTER);
  text(" Results for Sheakespeare Searches ", 20, 100, 3);
  textSize(14);
  text("Press 1 See Dot Chart ", 100, 200);
  text("Press 2 See Pie Chart ", 100, 220);
  text("Press 3 See Snakespeare Game ", 100, 240);
  //
  text("Press x to quit ", 100, 280);
  //
} // func

void handleStateSeeDotChart() {
  
  noCursor();
  background(palette[0]);
  textFont(titleFont);
  stroke(palette[3]);
  fill(palette[3]);
  textAlign(CENTER);
  text("Google Searches for Sheakspeare", width/2, 20);
  
  textFont(labelFont);
  textAlign(LEFT);

  // Read popularity
  for (int row = 0; row < rowCount; row++) {
    
    // sheakspeare's popularity data
    String dates = sheak.getString(row, 0);
    float popularity = sheak.getFloat(row, 1);
    float x = map(row, 0, 104, 30, 575);
    float y = map(popularity, -2, 4, 150, 20);


    // Placed here so it goes behind the data lines
    strokeWeight(1);
    if((mx > 30) && (mx < 575)) {
      line(mx, 30, mx, 150);
      if(abs(mx - x) < 2) {
        fill(palette[1]);
        text(dates, mx + 6, 40);
        text(nfp(popularity, 1, 3), mx + 6, 55);
      }
    }  
    
    // Lines and dots
    stroke(palette[1]);
    line(x, y, x, 150);
    noStroke();
    fill(palette[1]);
    int d = 3;
    ellipse(x, y, d, d);
  }
  
  // Read dates
  for (int row = 0; row < rowCount; row += 12) {
    String dates = sheak.getString(row, 0);
    float popularity = sheak.getFloat(row, 1);
    float x = map(row, 0, 104, 30, 575);
    float y = map(popularity, -2, 4, 150, 20);
    
    // Dates
    text(dates, x, 170);


      
    // Lines and dots for January
    stroke(palette[1]);
    strokeWeight(3);
    strokeCap(SQUARE);
    line(x, y, x, 150);
    noStroke();
  }
  //
} // func
//

void handleStateSeePieChart() {
   background(palette[0]);
   textFont(titleFont);
   smooth();
   noStroke();
   textAlign(CENTER);
   text("Searches in months for Shakespeare", width/2, 20);
    
   int centX;
   int centY;
    

   centX = width/2;
   centY =  height/2;


   float lastAng = 0;
   float [] popularity = new float [12];
   //fill(r, g, b);
   //lastAng = 0;
   int row = 0;
   float [] angles = new float [rowCount];
   color[] colors = new color[rowCount];
    
   for (int i = 0; i < rowCount; i++) {
    angles[i]= sheak.getFloat(row, 1);
   }
    
   for (int i = 0; i < 12; i++) {
   popularity[i] = angles[i];
   for (int j = 0; j < rowCount; j += 12)
   {
     popularity[i] += angles[j];
   }
   }

    
   for (int i = 0 ; i < 12 ; i ++)
    {
     colors[i] = color(random(100, 255), random(100, 255), 0);
    }
    float sum = sum(popularity);

   for (int i = 0; i < 12; i++) {
      
      fill(colors[i]);
      stroke(colors[i]);
      float theta = map(popularity[i], 0, sum, 0, PI);
      String dates = sheak.getString(i, 0);
      float radius = centX * 0.6f;
      float x = centX + sin(lastAng + (theta * 0.5f) + HALF_PI) * radius;      
      float y = centY - cos(lastAng + (theta * 0.5f) + HALF_PI) * radius;
      fill(255);
      text(dates, x, y);             
      float gray = map(i, 0, 12, 0, 255);
      fill(gray);
       arc( centX , centY , centX, centY, lastAng, lastAng+radians(popularity[i]));
       lastAng += lastAng+radians(popularity[i]);
                   
   }
     
     
     
     
//  //
} // func

void mouseMoved() {
  mx = mouseX;
}

float sum(float[] array)
    {
      float sum = 0;
      for (float r:array)
      {
      sum += r;
      }
      return sum;
      }
      
      int maxIndex(float[] r)
{
  float max = r[0];
  int maxIndex = 0;
  for (int i = 1 ; i < r.length ; i ++)
  {
    if (r[i] > max)
    {
      max = r[i];
      maxIndex = i;
    }
  }
  return maxIndex;
}

void handleStateSeeGame() {
  
   
  background (0);
  textAlign(CENTER);
  text("WASD TO PLAY", width/2, 20);
    

  fill(255, 0, 0); 
  ellipseMode(CENTER); 
  ellipse(yumx, yumy, 15, 15); 

  for (int i =0; i < snakesize; i++) { 
    //tail 
    fill(200, 20, 200); 
    rectMode(CENTER); 
    rect(headx[i], heady[i], 20, 20);
    
  } 
  headx[0]=headx[0]+xspeed; 
  heady[0]=heady[0]+yspeed; 

  for (int i = snakesize; i > 0; i--) { 
    headx[i] = headx[i-1]; 
    heady[i] = heady[i-1];
    
    if((headx[i] > width - 10) || (headx[i] < 10))
        {
            xspeed = -xspeed;
        }
        if((heady[i]>height - 10) || (heady[i] < 10))
        {
            yspeed = -yspeed; 
        }
  } 
  // FOOD 
  if (snakesize<headx.length) 
  { 
    if (headx[0]>=yumx-20 && headx[0]<=yumx+20 && heady[0]>=yumy-20 && heady[0]<yumy+20) 
    { 
      yumx=(round(random(49))+1)*10; 
      yumy=(round(random(49))+1)*10; 

      snakesize++; 

      if (i!=1) 
      { 
        headx[snakesize -1] = headx[snakesize - 2] - 0; 
        heady[snakesize -1] = heady[snakesize - 2] - 20; 
      }
   // ARROW KEYS OR LETTER KEYS PRESSED. 
  // RIGHT & LEFT HAND CONTROLS. 

    if (keyCode==UP || key == 'w') 
    { 
      xspeed=0; 
      yspeed=-2; 
    } 
    else if (keyCode==DOWN || key =='s') 
    { 
      xspeed=0; 
      yspeed=2; 
    } 

    else if (keyCode==LEFT || key=='a') 
    { 
      xspeed=-2; 
      yspeed=0; 
    } 
    else if (keyCode==RIGHT || key =='d') 
    { 
      xspeed=2; 
      yspeed=0; 
    }
    } 
  } 
} 

 
  
