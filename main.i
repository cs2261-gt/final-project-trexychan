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
# 40 "game.h"
enum {PISTOL=2, SHOTGUN=4, MINIGUN=5};
enum {gun0, gun1, gun2};
enum {BEEMON, HEADMAN, BEELLET, RATTANK, CRATE, TANKBULLET};
enum {GUNRIGHT=1, GUNLEFT, GUNJUMPR, GUNJUMPL, GUNIDLE};
enum {BEEMONRIGHT=1, BEEMONLEFT, BEEMONHITR, BEEMONHITL};
enum {BOSSIDLE, BOSSATTACK};
enum {TANKLEFT, TANKRIGHT, TANKATTACK, TANKIDLE};
enum {CRATEFULL=1, CRATEDMG};
enum {STAGE1, BOSS};


typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;
    int hspd;
    int vspd;
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
    int pistolHealth;
    int shotgunHealth;
    int minigunHealth;
    int currentHealth;
    int iFrameCounter;
    int gunType;
} PLAYER;

typedef struct {
    int enemies;
    int pickups;
    int playerSpawnCol;
    int playerSpawnRow;
    int levelHeight;
    int levelWidth;
} LEVEL;

typedef struct {
    int timer;
    int hitStun;
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
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;
    int dst;
} DOOR;

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
    int bulletType;
    int width;
    int height;
    int active;
    int destroyed;
    int hspd;
    int vspd;
    int state;
} BULLET;




void initGame();
void initLevels();
void initPlayer(LEVEL);
void initHealthBar();
void initEnemies(LEVEL, ENEMY enemies[], int enemySpawns[], int enemyTypes[]);
void initEnemy(ENEMY *, LEVEL);
void initBullets();
void initBullet(BULLET *);
void fire(int src, ENEMY *);
void dropLoot(ENEMY *, LEVEL, LOOTBOX pickups[]);
void initLootBoxes();



void updateGame();
void updatePlayer(unsigned short collisionMap[], int levelHeight, int levelWidth);
void updateEnemies(ENEMY enemies[], LEVEL);
void updateEnemy(ENEMY *, LEVEL);
void updateBullets();
void updateBullet(BULLET *);
void updateLootBox(LOOTBOX pickups[], LEVEL);
void changeLevel();


void drawGame();
void drawPlayer();
void drawEnemies(LEVEL, ENEMY enemies[]);
void drawBullets();
void drawLootBox(LOOTBOX pickups[], LEVEL);
void drawHealthBar();



void animatePlayer();
void animateEnemy(ENEMY *);



extern PLAYER player;
extern BULLET bullets[];
extern int playerHealth;
extern int stage;
extern int bossDefeated;


extern ENEMY s1Enemies[];
extern LOOTBOX s1Loot[];
extern LEVEL stage1;
extern int s1EnemySpawns[];
extern DOOR stage1Exit;

extern LEVEL boss;
extern ENEMY bossEnemies[];
extern LOOTBOX bossLoot[];
extern int bossEnemySpawns[];



void animateBeemon(ENEMY *);
void animateBeellet(ENEMY *);
void animateHeadMan(ENEMY *);
void animateRatTank(ENEMY *);

void drawBeemon(ENEMY *, int index);
void drawBeellet(ENEMY *, int index);
void drawHeadMan(ENEMY *, int index);
void drawRatTank(ENEMY *, int index);
void drawCrate(ENEMY *, int index);

void updateBeemon(ENEMY *, LEVEL level);
void updateBeellet(ENEMY *, LEVEL level);
void updateHeadMan(ENEMY *, LEVEL level);
void updateRatTank(ENEMY *, LEVEL level);
void updateCrate(ENEMY *, LEVEL level);

void spawnBeellet(ENEMY enemies[], LEVEL level, ENEMY *boss);
void ratTankAtk(ENEMY enemies[], LEVEL level);

void clearAllMobs(ENEMY enemies[], LEVEL level);

extern int headManFireRate;
# 3 "main.c" 2
# 1 "sound.h" 1
SOUND soundA;
SOUND soundB;



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSound();
void unpauseSound();
void stopSound();

void setupInterrupts();
void interruptHandler();
# 4 "main.c" 2
# 1 "sounds/chaos.h" 1
# 20 "sounds/chaos.h"
extern const unsigned char chaos[363744];
# 5 "main.c" 2
# 1 "sounds/panic.h" 1
# 20 "sounds/panic.h"
extern const unsigned char panic[693229];
# 6 "main.c" 2
# 1 "assets/gwl_STARTBG1.h" 1
# 22 "assets/gwl_STARTBG1.h"
extern const unsigned short gwl_STARTBG1Tiles[2432];


extern const unsigned short gwl_STARTBG1Map[1024];


extern const unsigned short gwl_STARTBG1Pal[256];
# 7 "main.c" 2
# 1 "assets/gwl_GUIDEBG1.h" 1
# 22 "assets/gwl_GUIDEBG1.h"
extern const unsigned short gwl_GUIDEBG1Tiles[1888];


extern const unsigned short gwl_GUIDEBG1Map[1024];


extern const unsigned short gwl_GUIDEBG1Pal[256];
# 8 "main.c" 2
# 1 "assets/gwl_PAUSEBG.h" 1
# 22 "assets/gwl_PAUSEBG.h"
extern const unsigned short gwl_PAUSEBGTiles[6448];


extern const unsigned short gwl_PAUSEBGMap[1024];


extern const unsigned short gwl_PAUSEBGPal[256];
# 9 "main.c" 2
# 1 "assets/gwl_GAMEBG1.h" 1
# 22 "assets/gwl_GAMEBG1.h"
extern const unsigned short gwl_GAMEBG1Tiles[896];


extern const unsigned short gwl_GAMEBG1Map[1024];


extern const unsigned short gwl_GAMEBG1Pal[256];
# 10 "main.c" 2
# 1 "assets/gwl_STAGE1.h" 1
# 22 "assets/gwl_STAGE1.h"
extern const unsigned short gwl_STAGE1Tiles[16224];


extern const unsigned short gwl_STAGE1Map[4096];


extern const unsigned short gwl_STAGE1Pal[256];
# 11 "main.c" 2
# 1 "assets/gwl_BOSS.h" 1
# 22 "assets/gwl_BOSS.h"
extern const unsigned short gwl_BOSSTiles[3888];


extern const unsigned short gwl_BOSSMap[2048];


extern const unsigned short gwl_BOSSPal[256];
# 12 "main.c" 2
# 1 "assets/gwl_WINBG1.h" 1
# 22 "assets/gwl_WINBG1.h"
extern const unsigned short gwl_WINBG1Tiles[7584];


extern const unsigned short gwl_WINBG1Map[1024];


extern const unsigned short gwl_WINBG1Pal[256];
# 13 "main.c" 2
# 1 "assets/gwl_LOSEBG1.h" 1
# 22 "assets/gwl_LOSEBG1.h"
extern const unsigned short gwl_LOSEBG1Tiles[1376];


extern const unsigned short gwl_LOSEBG1Map[1024];


extern const unsigned short gwl_LOSEBG1Pal[256];
# 14 "main.c" 2
# 1 "assets/gwl_SPRITES.h" 1
# 21 "assets/gwl_SPRITES.h"
extern const unsigned short gwl_SPRITESTiles[16384];


extern const unsigned short gwl_SPRITESPal[256];
# 15 "main.c" 2



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
extern int screenBlock;


int seed;
# 74 "main.c"
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

    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    setupInterrupts();
    setupSounds();

    DMANow(3, gwl_SPRITESPal, ((unsigned short *)0x5000200), 512 / 2);
    DMANow(3, gwl_SPRITESTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    hideSprites();

    (*(unsigned short *)0x4000000) = 0 | (1<<8);

    goToStart();
}

void goToStart() {
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gwl_STARTBG1Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gwl_STARTBG1Tiles, &((charblock *)0x6000000)[0], 4864 / 2);
    DMANow(3, gwl_STARTBG1Map, &((screenblock *)0x6000000)[28], 2048 / 2);
    seed = 0;
    state = START;
}

void start() {
    seed++;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initGame();
        goToGame();
        srand(seed);
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToRules();
    }
}

void goToRules() {
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gwl_GUIDEBG1Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gwl_GUIDEBG1Tiles, &((charblock *)0x6000000)[0], 3776 / 2);
    DMANow(3, gwl_GUIDEBG1Map, &((screenblock *)0x6000000)[28], 2048 / 2);
    state = RULES;
}

void rules() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

void goToGame() {

    switch (stage) {
    case STAGE1:
        (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((screenBlock)<<8) | (1<<7) | (1<<14);

        DMANow(3, gwl_STAGE1Pal, ((unsigned short *)0x5000000), 512 / 2);
        DMANow(3, gwl_STAGE1Tiles, &((charblock *)0x6000000)[0], 32448 / 2);
        DMANow(3, gwl_STAGE1Map, &((screenblock *)0x6000000)[28], 8192 / 2);
        break;


    case BOSS:
        (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((screenBlock)<<8) | (0<<7) | (1<<14);

        DMANow(3, gwl_BOSSPal, ((unsigned short *)0x5000000), 512 / 2);
        DMANow(3, gwl_BOSSTiles, &((charblock *)0x6000000)[0], 7776 / 2);
        DMANow(3, gwl_BOSSMap, &((screenblock *)0x6000000)[28], 4096 / 2);
    }


    state = GAME;
}

void game() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        pauseSound();
        goToPause();
    }
    if (player.pistolHealth <= 0 && player.shotgunHealth <= 0) {
        stopSound();
        goToLose();
    }
    if (bossDefeated) {
        stopSound();
        goToWin();
    }

    updateGame();
    drawGame();
}

void goToPause() {
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gwl_PAUSEBGPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gwl_PAUSEBGTiles, &((charblock *)0x6000000)[0], 12896 / 2);
    DMANow(3, gwl_PAUSEBGMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    state = PAUSE;
}

void pause() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        unpauseSound();
        goToGame();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
    }

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    hideSprites();

    waitForVBlank();

    DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void goToWin() {

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gwl_WINBG1Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gwl_WINBG1Tiles, &((charblock *)0x6000000)[0], 15168 / 2);
    DMANow(3, gwl_WINBG1Map, &((screenblock *)0x6000000)[28], 2048 / 2);

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    state = WIN;
}

void win() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }

    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;

    hideSprites();

    waitForVBlank();

    DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void goToLose() {
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (0<<14);

    DMANow(3, gwl_LOSEBG1Pal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gwl_LOSEBG1Tiles, &((charblock *)0x6000000)[0], 2752 / 2);
    DMANow(3, gwl_LOSEBG1Map, &((screenblock *)0x6000000)[28], 2048 / 2);
    state = LOSE;
}

void lose() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
    (*(volatile unsigned short *)0x04000010) = 0;
    (*(volatile unsigned short *)0x04000012) = 0;
    hideSprites();
    waitForVBlank();
    DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
