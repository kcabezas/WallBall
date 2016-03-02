#define REG_DISPCTL *(unsigned short *)0x4000000
#define VIDEO_BUFFER ((unsigned short *)0x6000000)

#define MODE3 3
#define BG2_ENABLE (1<<10)

#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

#define OFFSET(R,C,ROWLEN) ((R)*ROWLEN+(C))

#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define DARKER_GREEN COLOR(0, 20, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

#define SCANLINECOUNTER *(volatile unsigned short*) 0x4000006

unsigned int oldButtons;
unsigned int buttons;

#define BUTTONS *(volatile unsigned short*) 0x4000130

#define BUTTON_HELD(key) (~(BUTTONS) & (key))
#define BUTTON_PRESSED(key) (!(~(oldButtons)&(key)) && (~(buttons) & (key)))

#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

// prototypes
void setPixel(int, int, unsigned short);
void drawRect(int, int, int, int, unsigned short);
void initialize();
void draw();
void update();
void waitForVBlank();
void drawBricks();