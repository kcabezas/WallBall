#include "myLib.h"
#include "myLib.c"

/* Player 1 Variables */
int p1Height = 5;
int p1Width = 40;
int p1Row = 140;
int p1Col = 97;
int oldP1Row = 120;
int oldP1Col = 97;

/* Ball Variables */
int ballSize = 5;
int ballCol = 117;
int ballRow = 50;
int oldBallRow = 50;
int oldBallCol = 117;
int rd = 0;
int cd = 0;

char start = 0;
char dead = 1; //boolean


int main() {
	REG_DISPCTL = MODE3 | BG2_ENABLE;

	initialize();

	while(1)
	{
		oldButtons = buttons;
		buttons = BUTTONS;

		if(!dead)
		{
			update();

			waitForVBlank();

			draw();
		}

		if(dead && BUTTON_PRESSED(BUTTON_START))
		{
			initialize();
		}
	}
}

/* 
purpose of initialize:
-method to set all of our variables
-sooooo, when game is reset, 
 you just have to call the function again
*/
void initialize()
{
	drawRect(oldP1Row, oldP1Col, p1Height+4, p1Width+4, BLACK); // erases paddle

	// reset ball
	ballSize = 5;
	ballCol = 117;
	ballRow = 50;
	dead = 0;

	// reset paddle
	p1Height = 5;
	p1Width = 40;
	p1Col = 97;
	p1Row = 140;

	rd = 0;
	cd = 0;
}

/*
update method holds game logic (including button presses)
and is called once per frame
*/
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

	if (BUTTON_HELD(BUTTON_LEFT)) {
		if (p1Col > 0) {
			p1Col--;
		}
	}
	if (BUTTON_HELD(BUTTON_RIGHT)) {
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

	// checking wall collisions
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

	// ball goes past paddle
	if (ballRow > p1Row && (ballCol >= (p1Col+p1Width) || ballCol < p1Col))
	{
		dead = 1;
	}
}

void draw() 
{
	// draw paddle
	drawRect(oldP1Row, oldP1Col, p1Height, p1Width, BLACK); // erases paddle
	drawRect(p1Row, p1Col, p1Height, p1Width, WHITE);

	// draw ball
	drawRect(oldBallRow, oldBallCol, ballSize, ballSize, BLACK);
	drawRect(ballRow, ballCol, ballSize, ballSize, YELLOW);

	oldBallRow = ballRow;
	oldBallCol = ballCol;
}