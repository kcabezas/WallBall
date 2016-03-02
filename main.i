# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1
# 23 "myLib.h"
unsigned int oldButtons;
unsigned int buttons;
# 43 "myLib.h"
void setPixel(int, int, unsigned short);
void drawRect(int, int, int, int, unsigned short);
void initialize();
void draw();
void update();
void waitForVBlank();
void drawBricks();
# 2 "main.c" 2
# 1 "myLib.c" 1
# 1 "myLib.h" 1
# 23 "myLib.h"
unsigned int oldButtons;
unsigned int buttons;
# 43 "myLib.h"
void setPixel(int, int, unsigned short);
void drawRect(int, int, int, int, unsigned short);
void initialize();
void draw();
void update();
void waitForVBlank();
void drawBricks();
# 2 "myLib.c" 2

void waitForVBlank()
{
 while(*(volatile unsigned short*) 0x4000006>160);
 while(*(volatile unsigned short*) 0x4000006<160);
}

void setPixel(int row, int col, unsigned short color)
{
 ((unsigned short *)0x6000000)[((row)*240 +(col))] = color;
}

void drawRect(int row, int col, int height, int width, unsigned short color)
{
 for(int r = 0; r < height; r++)
 {
  for(int c = 0; c < width; c++)
  {
   setPixel(row+r, col+c, color);
  }
 }
}
# 3 "main.c" 2


int p1Height = 5;
int p1Width = 40;
int p1Row = 140;
int p1Col = 97;
int oldP1Row = 120;
int oldP1Col = 97;


int ballSize = 5;
int ballCol = 117;
int ballRow = 50;
int oldBallRow = 50;
int oldBallCol = 117;
int rd = 0;
int cd = 0;

char start = 0;
char dead = 1;


int main() {
 *(unsigned short *)0x4000000 = 3 | (1<<10);

 initialize();

 while(1)
 {
  oldButtons = buttons;
  buttons = *(volatile unsigned short*) 0x4000130;

  if(!dead)
  {
   update();

   waitForVBlank();

   draw();
  }

  if(dead && (!(~(oldButtons)&((1<<3))) && (~(buttons) & ((1<<3)))))
  {
   initialize();
  }
 }
}







void initialize()
{
 drawRect(oldP1Row, oldP1Col, p1Height+4, p1Width+4, 0);


 ballSize = 5;
 ballCol = 117;
 ballRow = 50;
 dead = 0;


 p1Height = 5;
 p1Width = 40;
 p1Col = 97;
 p1Row = 140;

 rd = 0;
 cd = 0;
}





void update()
{
 ballRow += rd;
 ballCol += cd;

 if (rd == 0 && cd == 0)
 {
  ballRow++;
 }

 oldP1Row = p1Row;
 oldP1Col = p1Col;

 if ((~(*(volatile unsigned short*) 0x4000130) & ((1<<5)))) {
  if (p1Col > 0) {
   p1Col--;
  }
 }
 if ((~(*(volatile unsigned short*) 0x4000130) & ((1<<4)))) {
  if (p1Col < (240 - p1Width)) {
   p1Col++;
  }
 }

 if(ballCol < (p1Col+p1Width) && ballCol >= p1Col && ballRow == (p1Row-ballSize))
 {
  rd = 1;
  cd = 1;

  ballRow = p1Row-ballSize;
  cd = cd;
  if(ballCol < (p1Col+(p1Width/2)))
  {
   ballRow = p1Row-ballSize;
   rd = -rd;
   cd = -cd;
  } else if (ballCol >= (p1Col+(p1Width/2))) {
   ballCol = ballCol + 1;
   ballRow = p1Row-ballSize;
   rd = -rd;
  }
 }


 if(ballRow < 0)
 {
  ballRow = 0;
  rd = -rd;
 }
 if(ballRow>159-ballSize+1)
 {
  ballRow = 159-ballSize+1;
  rd = -rd;
 }
 if(ballCol < 0)
 {
  ballCol = 0;
  cd = -cd;
 }
 if(ballCol>239-ballSize+1)
 {
  ballCol = 239-ballSize+1;
  cd = -cd;
 }


 if (ballRow > p1Row && (ballCol >= (p1Col+p1Width) || ballCol < p1Col))
 {
  dead = 1;
 }
}

void draw()
{

 drawRect(oldP1Row, oldP1Col, p1Height, p1Width, 0);
 drawRect(p1Row, p1Col, p1Height, p1Width, ((31) | (31)<<5 | (31)<<10));


 drawRect(oldBallRow, oldBallCol, ballSize, ballSize, 0);
 drawRect(ballRow, ballCol, ballSize, ballSize, ((31) | (31)<<5 | (0)<<10));

 oldBallRow = ballRow;
 oldBallCol = ballCol;
}
