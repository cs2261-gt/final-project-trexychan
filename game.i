# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2
# 1 "assets/gwl_STARTBG1.h" 1
# 22 "assets/gwl_STARTBG1.h"
extern const unsigned short gwl_STARTBG1Tiles[2384];


extern const unsigned short gwl_STARTBG1Map[1024];


extern const unsigned short gwl_STARTBG1Pal[256];
# 4 "game.c" 2
# 1 "assets/gwl_GUIDEBG1.h" 1
# 22 "assets/gwl_GUIDEBG1.h"
extern const unsigned short gwl_GUIDEBG1Tiles[1776];


extern const unsigned short gwl_GUIDEBG1Map[1024];


extern const unsigned short gwl_GUIDEBG1Pal[256];
# 5 "game.c" 2
# 1 "assets/gwl_PAUSEBG.h" 1
# 22 "assets/gwl_PAUSEBG.h"
extern const unsigned short gwl_PAUSEBGTiles[3648];


extern const unsigned short gwl_PAUSEBGMap[1024];


extern const unsigned short gwl_PAUSEBGPal[256];
# 6 "game.c" 2
# 1 "assets/gwl_GAMEBG1.h" 1
# 22 "assets/gwl_GAMEBG1.h"
extern const unsigned short gwl_GAMEBG1Tiles[896];


extern const unsigned short gwl_GAMEBG1Map[1024];


extern const unsigned short gwl_GAMEBG1Pal[256];
# 7 "game.c" 2
# 1 "assets/gwl_STAGE1CM.h" 1
# 20 "assets/gwl_STAGE1CM.h"
extern const unsigned short gwl_STAGE1CMBitmap[262144];
# 8 "game.c" 2
# 1 "assets/gwl_WINBG1.h" 1
# 22 "assets/gwl_WINBG1.h"
extern const unsigned short gwl_WINBG1Tiles[1216];


extern const unsigned short gwl_WINBG1Map[1024];


extern const unsigned short gwl_WINBG1Pal[256];
# 9 "game.c" 2
# 1 "assets/gwl_SPRITES.h" 1
# 21 "assets/gwl_SPRITES.h"
extern const unsigned short gwl_SPRITESTiles[16384];


extern const unsigned short gwl_SPRITESPal[256];
# 10 "game.c" 2

int stage;
int oldVDisp;
int vDisp;
int timer;

PLAYER player;
ENEMY s1Enemies[1];
BULLET minigunMag[50];
LOOTBOX s1Loot[1];

unsigned short hOff;
unsigned short vOff;
int playerHOff;

int screenBlock;

void initGame() {
    stage = STAGE1;
    screenBlock = 28;
    playerHOff = 0;

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    initPlayer();
    initBullets();
    initEnemies();
    initLootBoxes();

    hOff = 0;
    vOff = 0;
}

void initPlayer() {
    player.worldCol = 20;
    player.worldRow = 120;
    player.width = 16;
    player.height = 16;
    player.gunType = PISTOL;
    player.fireRate = 20;
    player.health = 9;
    player.numFrames = 4;
    player.hspd = 2;
    player.vspd = 0;
    player.curFrame = 0;
    player.state = GUNRIGHT;
    player.frameCounter = 12;
    player.jumping = 1;
    player.airTime = 0;
    player.fireTimer = 0;
}

void initBullets() {
    for (int i = 0; i < 50; i++) {
        initBullet(&minigunMag[i]);
    }
}

void initBullet(BULLET *b) {
    b->active = 0;
    b->width = 8;
    b->height = 8;
}

void initEnemies() {
    for (int i = 0; i < 1; i++) {
        s1Enemies[i].enemyType = BEEMON;
        initEnemy(&s1Enemies[i]);
    }

}

void initEnemy(ENEMY *e) {
    if (e->enemyType == BEEMON) {
        e->worldCol = 200;
        e->worldRow = 120;
        e->alive = 1;
        e->height = 16;
        e->width = 16;
        e->health = 3;
        e->numFrames = 4;
        e->curFrame = 0;
        e->state = ENEMYLEFT;
        e->frameCounter = 12;
        e->hspd = 1;
        e->damage = 1;
        e->timer = 0;
        e->ammoDrop = 3;
    }
}

void initLootBoxes() {
    for (int i = 0; i < 1; i++) {
        initLootBox(&s1Loot[i]);
    }
}

void initLootBox(LOOTBOX *l) {
    l->active = 0;
    l->height = 8;
    l->width = 8;
}

void spawnEnemyLoot(ENEMY *e) {
    for (int i = 0; i < 1; i++) {
        if (!(s1Loot[i].active)) {

            s1Loot[i].ammocount = e->ammoDrop;
            s1Loot[i].worldCol = e->worldCol;
            s1Loot[i].worldRow = e->worldRow;
            s1Loot[i].active = 1;
        }
    }
}

void updateGame() {
    if (hOff > 256 && screenBlock < 31) {
        screenBlock++;
        hOff -= 256;
        (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((screenBlock)<<8) | (1<<14) | (1<<7);
    }

    if (playerHOff > 512) {
        playerHOff -= 512;
    }

    updatePlayer();
    updateBullets();
    updateEnemies();
    updateLootBox();

}

void updatePlayer() {
    if (player.iFrameCounter > 0) {
        player.iFrameCounter--;
    }



    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (player.worldCol - player.hspd >= (screenBlock - 28) * 256
        && gwl_STAGE1CMBitmap[((player.worldRow)*(1024)+(player.worldCol - player.hspd - 1))]
        && gwl_STAGE1CMBitmap[((player.worldRow + player.height - 1)*(1024)+(player.worldCol - player.hspd - 1))]) {

            player.worldCol -= player.hspd;
        }

        if (hOff - player.hspd >= 0 && player.screenCol < 240 / 2) {
            hOff -= player.hspd;
            playerHOff -= player.hspd;
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if ((player.worldCol + player.width) < (1024 - player.width)
        && gwl_STAGE1CMBitmap[((player.worldRow)*(1024)+(player.worldCol + player.width + player.hspd - 1))]
        && gwl_STAGE1CMBitmap[((player.worldRow + player.height - 1)*(1024)+(player.worldCol + player.width + player.hspd - 1))]) {

            player.worldCol += player.hspd;



        }
        if (hOff < (1024 - 240 - 1) && player.screenCol > 240 / 2 && screenBlock < 31) {
            hOff += player.hspd;
            playerHOff += player.hspd;
        }
    }



    if (((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))) || (~((*(volatile unsigned short *)0x04000130)) & ((1<<1)))) && player.fireTimer >= player.fireRate && player.health > 0) {
        player.fireTimer = 0;
        player.health--;
        fire();
    }

    player.fireTimer++;


    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - playerHOff;

    animatePlayer();
}

void updateBullets() {
    for (int i = 0; i < 50; i++) {
        if (minigunMag[i].active) {
            updateBullet(&minigunMag[i]);
        }
    }
}

void updateBullet(BULLET *b) {
    if (b->state == GUNRIGHT) {
        if (b->screenCol + b->width + b->spd > 240) {
            b->active = 0;
        }
    }
    if (b->state == GUNLEFT) {
        if (b->worldCol + b->spd < 0) {
            b->active = 0;
        }
    }

    b->worldCol += b->spd;

    b->screenCol = b->worldCol - hOff;
    b->screenRow = b->worldRow - vOff;

}

void updateEnemies() {
    for (int i = 0; i < 1; i++) {
        if (s1Enemies[i].alive) {
            updateEnemy(&s1Enemies[i]);
        }
    }
}
void updateEnemy(ENEMY *e) {
    if (e->state == ENEMYRIGHT) {
        e->worldCol += e->hspd;
    }
    if (e->state == ENEMYLEFT) {
        e->worldCol -= e->hspd;
    }

    if (collision(e->worldCol, e->worldRow, e->width, e->height, player.worldCol, player.worldRow, player.width, player.height) && player.iFrameCounter == 0) {
        player.health -= e->damage;
        player.iFrameCounter = 50;
    }

    for (int b = 0; b < 50; b++) {
        if (minigunMag[b].active && collision(minigunMag[b].worldCol, minigunMag[b].worldRow, minigunMag[b].width, minigunMag[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - 1 <= 0) {
            e->alive = 0;
            minigunMag[b].active = 0;
            spawnEnemyLoot(e);
        } else if (minigunMag[b].active && collision(minigunMag[b].worldCol, minigunMag[b].worldRow, minigunMag[b].width, minigunMag[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health > 0) {
            e->health--;
            minigunMag[b].active = 0;
        }
    }

    e->screenCol = e->worldCol - hOff;
    e->screenRow = e->worldRow -vOff;

    animateEnemy(e);
}

void updateLootBox() {
    for (int i = 0; i < 1; i++) {
        if (s1Loot[i].active) {
            if (collision(player.worldCol, player.worldRow, player.width, player.height, s1Loot[i].worldCol, s1Loot[i].worldRow, s1Loot[i].width, s1Loot[i].height)) {
                s1Loot[i].active = 0;
                player.health += s1Loot[i].ammocount;
            }

            s1Loot[i].screenCol = s1Loot[i].worldCol - hOff;
            s1Loot[i].screenRow = s1Loot[i].worldRow - vOff;
        }
    }

}

void animatePlayer() {

    player.prevState = player.state;
    player.state = GUNIDLE;


    if (player.frameCounter % 12 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }


    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        player.state = GUNLEFT;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        player.state = GUNRIGHT;
    }

    if (player.state == GUNIDLE) {
        player.curFrame = 0;
        player.frameCounter = 0;
        player.state = player.prevState;
    } else {
        player.frameCounter++;
    }


}

void animateEnemy(ENEMY *e) {


    if (e->frameCounter % 12 == 0) {
        e->curFrame = (e->curFrame + 1) % e->numFrames;
    }

    if (e->timer >= 40 && e->state == ENEMYRIGHT) {
        e->timer = 0;
        e->state = ENEMYLEFT;
    } else if (e->timer >= 40 && e->state == ENEMYLEFT) {
        e->timer = 0;
        e->state = ENEMYRIGHT;
    }

    e->frameCounter++;
    e->timer++;
}

void drawGame() {
    drawPlayer();
    drawBullets();
    drawEnemies();
    drawLootBox();

    waitForVBlank();

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}

void drawPlayer() {
    shadowOAM[0].attr0 = (0xFF & player.screenRow) | (0<<14);
    shadowOAM[0].attr1 = (0x1FF & player.screenCol) | (1<<14);
    shadowOAM[0].attr2 = ((player.curFrame * 2)*32+((player.state + 1) * 2));
}

void fire() {
    for (int i = 0; i < 50; i++) {
        if (!(minigunMag[i].active)) {
            if (player.state == GUNRIGHT) {
                minigunMag[i].worldCol = player.worldCol + player.width - 1;
                minigunMag[i].worldRow = player.worldRow;
                minigunMag[i].active = 1;
                minigunMag[i].state = GUNRIGHT;
                minigunMag[i].spd = 4;
                break;
            } else if (player.state == GUNLEFT) {
                minigunMag[i].worldCol = player.worldCol + 1;
                minigunMag[i].worldRow = player.worldRow;
                minigunMag[i].active = 1;
                minigunMag[i].state = GUNLEFT;
                minigunMag[i].spd = -4;
                break;
            }
        }
    }
}

void drawBullets() {
    for (int i = 0; i < 50; i++) {
        if (minigunMag[i].active) {
            shadowOAM[i + 1].attr0 = (0xFF & minigunMag[i].screenRow) | (0<<14);
            shadowOAM[i + 1].attr1 = (0x1FF & minigunMag[i].screenCol) | (0<<14);
            shadowOAM[i + 1].attr2 = ((8)*32+(2));
        } else {
            shadowOAM[i + 1].attr0 |= (2<<8);
        }
    }
}

void drawEnemies() {
    for (int i = 0; i < 1; i++) {
        if (s1Enemies[i].alive) {
            shadowOAM[i + 50 + 1].attr0 = (0xFF & s1Enemies[i].screenRow) | (0<<14);
            shadowOAM[i + 50 + 1].attr1 = (0x1FF & s1Enemies[i].screenCol) | (1<<14);
            shadowOAM[i + 50 + 1].attr2 = ((s1Enemies[i].curFrame * 2)*32+((s1Enemies[i].state) * 2));
        } else {
            shadowOAM[i + 50 + 1].attr0 |= (2<<8);
        }
    }
}

void drawLootBox() {
    for (int i = 0; i < 1; i++)
    {
        if (s1Loot[i].active) {
            shadowOAM[i + 50 + 1 + 1].attr0 = (0xFF & s1Loot[i].screenRow) | (0<<14);
            shadowOAM[i + 50 + 1 + 1].attr1 = (0x1FF & s1Loot[i].screenCol) | (0<<14);
            shadowOAM[i + 50 + 1 + 1].attr2 = ((8)*32+(2));
        } else {
            shadowOAM[i + 50 + 1 + 1].attr0 |= (2<<8);
        }
    }

}
