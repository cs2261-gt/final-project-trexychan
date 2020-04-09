# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 342 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "game.h" 1
# 25 "game.h"
enum {PISTOL, SHOTGUN, MINIGUN};
enum {BEEMON};
enum {GUNRIGHT, GUNLEFT, GUNJUMPR, GUNJUMPL, GUNIDLE};
enum {ENEMYRIGHT=(GUNIDLE+1), ENEMYLEFT, ENEMYIDLE};
enum {STAGE1, STAGE2, BOSS};


typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;
    int hspd;
    int vspd;
    int vdel;
    int jumping;
    int curFrame;
    int numFrames;
    int state;
    int prevState;
    int frameCounter;
    int airTime;
    int dashTime;
    int fireTimer;
    int dash;
    int fireRate;
    int health;
    int iFrameCounter;
    int gunType;
} PLAYER;

typedef struct {
    int timer;
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;
    int hspd;
    int vspd;
    int curFrame;
    int numFrames;
    int state;
    int prevState;
    int frameCounter;
    int health;
    int alive;
    int enemyType;
    int damage;
    int ammoDrop;
} ENEMY;

typedef struct {
    int worldRow;
    int worldCol;
    int screenRow;
    int screenCol;
    int width;
    int height;
    int active;
    int ammocount;
} LOOTBOX;

typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;
    int active;
    int destroyed;
    int spd;
    int state;
} BULLET;




void initGame();
void initPlayer();
void initEnemies();
void initEnemy(ENEMY *);
void initBullets();
void initBullet(BULLET *);
void fire();
void spawnEnemyLoot(ENEMY *);
void initLootBoxes();
void initLootBox(LOOTBOX *);



void updateGame();
void updatePlayer();
void updateEnemies();
void updateEnemy(ENEMY *);
void updateBullets();
void updateBullet(BULLET *);
void updateLootBox();


void drawGame();
void drawPlayer();
void drawEnemies();
void drawBullets();
void drawLootBox();



void animatePlayer();
void animateEnemy(ENEMY *);



extern PLAYER player;
extern BULLET pistolMag[9];
extern BULLET shotgunMag[2];
extern BULLET minigunMag[50];
extern int playerHealth;
extern int stage;
extern ENEMY s1Enemies[];
extern LOOTBOX s1Loot[];
# 3 "main.c" 2
# 1 "assets/gwl_STARTBG1.h" 1
# 22 "assets/gwl_STARTBG1.h"
extern const unsigned short gwl_STARTBG1Tiles[2384];


extern const unsigned short gwl_STARTBG1Map[1024];


extern const unsigned short gwl_STARTBG1Pal[256];
# 4 "main.c" 2
# 1 "assets/gwl_GUIDEBG1.h" 1
# 22 "assets/gwl_GUIDEBG1.h"
extern const unsigned short gwl_GUIDEBG1Tiles[1776];


extern const unsigned short gwl_GUIDEBG1Map[1024];


extern const unsigned short gwl_GUIDEBG1Pal[256];
# 5 "main.c" 2
# 1 "assets/gwl_PAUSEBG.h" 1
# 22 "assets/gwl_PAUSEBG.h"
extern const unsigned short gwl_PAUSEBGTiles[3648];


extern const unsigned short gwl_PAUSEBGMap[1024];


extern const unsigned short gwl_PAUSEBGPal[256];
# 6 "main.c" 2
# 1 "assets/gwl_GAMEBG1.h" 1
# 22 "assets/gwl_GAMEBG1.h"
extern const unsigned short gwl_GAMEBG1Tiles[896];


extern const unsigned short gwl_GAMEBG1Map[1024];


extern const unsigned short gwl_GAMEBG1Pal[256];
# 7 "main.c" 2
# 1 "assets/gwl_STAGE1.h" 1
# 22 "assets/gwl_STAGE1.h"
extern const unsigned short gwl_STAGE1Tiles[25696];


extern const unsigned short gwl_STAGE1Map[4096];


extern const unsigned short gwl_STAGE1Pal[256];
# 8 "main.c" 2
# 1 "assets/gwl_WINBG1.h" 1
# 22 "assets/gwl_WINBG1.h"
extern const unsigned short gwl_WINBG1Tiles[1216];


extern const unsigned short gwl_WINBG1Map[1024];


extern const unsigned short gwl_WINBG1Pal[256];
# 9 "main.c" 2
# 1 "assets/gwl_LOSEBG1.h" 1
# 22 "assets/gwl_LOSEBG1.h"
extern const unsigned short gwl_LOSEBG1Tiles[832];


extern const unsigned short gwl_LOSEBG1Map[1024];


extern const unsigned short gwl_LOSEBG1Pal[256];
# 10 "main.c" 2
# 1 "assets/gwl_SPRITES.h" 1
# 21 "assets/gwl_SPRITES.h"
extern const unsigned short gwl_SPRITESTiles[16384];


extern const unsigned short gwl_SPRITESPal[256];
# 11 "main.c" 2



void initialize();
void goToStart();
void start();
void goToRules();
void rules();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();


int state;
enum {START, RULES, GAME, PAUSE, WIN, LOSE};


unsigned short buttons;
unsigned short oldButtons;


extern unsigned short hOff;
extern unsigned short vOff;


int seed;

int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch (state) {
            case START:
                start();
                break;
            case RULES:
                rules();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }

}

void initialize() {
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gwl_SPRITESPal, ((unsigned short *)0x5000200), 512 / 2);
    DMANow(3, gwl_SPRITESTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    hideSprites();

    (*(unsigned short *)0x4000000) = 0 | (1<<8);

    goToStart();
}

void goToStart() {
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gwl_STARTBG1Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gwl_STARTBG1Tiles, &((charblock *)0x6000000)[0], 4768 / 2);
    DMANow(3, gwl_STARTBG1Map, &((screenblock *)0x6000000)[28], 2048 / 2);
    seed = 0;
    state = START;
}

void start() {
    seed++;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
        initGame();
        srand(seed);
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToRules();
    }
}

void goToRules() {
    DMANow(3, gwl_GUIDEBG1Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gwl_GUIDEBG1Tiles, &((charblock *)0x6000000)[0], 3552 / 2);
    DMANow(3, gwl_GUIDEBG1Map, &((screenblock *)0x6000000)[28], 2048 / 2);
    state = RULES;
}

void rules() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

void goToGame() {

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (1<<7) | (1<<14);

    DMANow(3, gwl_STAGE1Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gwl_STAGE1Tiles, &((charblock *)0x6000000)[0], 51392 / 2);
    DMANow(3, gwl_STAGE1Map, &((screenblock *)0x6000000)[28], 8192 / 2);

    state = GAME;
}

void game() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToPause();
    }
    if (player.health <= 0) {
        goToLose();
    }
    if (player.worldCol >= 256 * 3) {
        goToWin();
    }

    updateGame();
    drawGame();
}

void goToPause() {
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gwl_PAUSEBGPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gwl_PAUSEBGTiles, &((charblock *)0x6000000)[0], 7296 / 2);
    DMANow(3, gwl_PAUSEBGMap, &((screenblock *)0x6000000)[28], 2048 / 2);
    state = PAUSE;
}

void pause() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
    }

    hideSprites();

    waitForVBlank();

    DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void goToWin() {

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gwl_WINBG1Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gwl_WINBG1Tiles, &((charblock *)0x6000000)[0], 2432 / 2);
    DMANow(3, gwl_WINBG1Map, &((screenblock *)0x6000000)[28], 2048 / 2);
    state = WIN;
}

void win() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
    hideSprites();

    waitForVBlank();

    DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void goToLose() {
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gwl_LOSEBG1Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gwl_LOSEBG1Tiles, &((charblock *)0x6000000)[0], 1664 / 2);
    DMANow(3, gwl_LOSEBG1Map, &((screenblock *)0x6000000)[28], 2048 / 2);
    state = LOSE;
}

void lose() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
    hideSprites();
    waitForVBlank();
    DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
