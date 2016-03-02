#include "myLib.h"

void waitForVBlank()
{
	while(SCANLINECOUNTER>160);
	while(SCANLINECOUNTER<160);
}

void setPixel(int row, int col, unsigned short color)
{
	VIDEO_BUFFER[OFFSET(row, col, 240)] = color;
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