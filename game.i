# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
# 38 "game.h"
enum {PISTOL=2, SHOTGUN=2*6, MINIGUN=5};
enum {BEEMON};
enum {GUNRIGHT=1, GUNLEFT, GUNJUMPR, GUNJUMPL, GUNIDLE};
enum {BEEMONRIGHT=1, BEEMONLEFT, BEEMONHITR, BEEMONHITL};
enum {BOSSIDLE, BOSSATTACK};
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
    int health;
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
    int spd;
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
void fire();
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



void animatePlayer();
void animateEnemy(ENEMY *);



extern PLAYER player;
extern BULLET bullets[70];
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



void animateBeemon(ENEMY *);
void animateBoss(ENEMY *);

void drawBeemon(ENEMY *, int index);
void drawBoss(ENEMY *, int index);

void updateBeemon(ENEMY *, LEVEL level);
void updateBoss(ENEMY *, LEVEL level);
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
# 1 "assets/gwl_STAGE1.h" 1
# 22 "assets/gwl_STAGE1.h"
extern const unsigned short gwl_STAGE1Tiles[16224];


extern const unsigned short gwl_STAGE1Map[4096];


extern const unsigned short gwl_STAGE1Pal[256];
# 8 "game.c" 2
# 1 "assets/gwl_STAGE1CM.h" 1
# 20 "assets/gwl_STAGE1CM.h"
extern const unsigned short gwl_STAGE1CMBitmap[262144];
# 9 "game.c" 2
# 1 "assets/gwl_BOSS.h" 1
# 22 "assets/gwl_BOSS.h"
extern const unsigned short gwl_BOSSTiles[3344];


extern const unsigned short gwl_BOSSMap[2048];


extern const unsigned short gwl_BOSSPal[256];
# 10 "game.c" 2
# 1 "assets/gwl_BOSSCM.h" 1
# 20 "assets/gwl_BOSSCM.h"
extern const unsigned short gwl_BOSSCMBitmap[131072];
# 11 "game.c" 2
# 1 "assets/gwl_WINBG1.h" 1
# 22 "assets/gwl_WINBG1.h"
extern const unsigned short gwl_WINBG1Tiles[1216];


extern const unsigned short gwl_WINBG1Map[1024];


extern const unsigned short gwl_WINBG1Pal[256];
# 12 "game.c" 2
# 1 "assets/gwl_SPRITES.h" 1
# 21 "assets/gwl_SPRITES.h"
extern const unsigned short gwl_SPRITESTiles[16384];


extern const unsigned short gwl_SPRITESPal[256];
# 13 "game.c" 2

int stage;
int bossDefeated;


SOUND soundA;
SOUND soundB;


PLAYER player;
BULLET bullets[70];

LEVEL stage1;
ENEMY s1Enemies[3];
LOOTBOX s1Loot[((3) + (1))];
int s1EnemySpawns[] = {200, 120, 480, 120, 616, 80};
int s1EnemyTypes[] = {BEEMON, BEEMON, BEEMON};
DOOR stage1Exit;

LEVEL boss;
ENEMY bossEnemies[10];
LOOTBOX bossLoot[10];
int bossEnemySpawns[] = {400, 50};
int bossEnemyTypes[] = {BOSS};

unsigned short hOff;
unsigned short vOff;
int playerHOff;

int screenBlock;

void initGame() {
    stage = STAGE1;
    screenBlock = 28;
    playerHOff = 0;

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    initLevels();
    initPlayer(stage1);
    initBullets();
    initEnemies(stage1, s1Enemies, s1EnemySpawns, s1EnemyTypes);
    initLootBoxes();

    hOff = 0;
    vOff = 0;
}

void initLevels() {

    stage1.enemies = 3;
    stage1.pickups = ((3) + (1));
    stage1.playerSpawnCol = 20;
    stage1.playerSpawnRow = (160 / 2);
    stage1.levelHeight = 256;
    stage1.levelWidth = 1024;

    stage1Exit.width = 40;
    stage1Exit.height = 80;
    stage1Exit.worldCol = 712;
    stage1Exit.worldRow = 24;
    stage1Exit.dst = BOSS;


    boss.levelHeight = 256;
    boss.levelWidth = 512;
    boss.pickups = 10;
    boss.enemies = 10;
    boss.playerSpawnCol = 20;
    boss.playerSpawnRow = 16;
}

void initPlayer(LEVEL level) {
    player.worldCol = level.playerSpawnCol;
    player.worldRow = ((level.playerSpawnRow) << 8);
    player.width = 16;
    player.height = 16;
    player.gunType = PISTOL;
    player.fireRate = 20;
    player.health = 9;
    player.numFrames = 4;
    player.hspd = 2;
    player.dash = 0;
    player.dashTime = 0;
    player.vspd = 0;
    player.jumping = 1;


    player.curFrame = 0;
    player.state = GUNRIGHT;
    player.frameCounter = 12;
    player.fireTimer = 0;
}

void initBullets() {
    for (int i = 0; i < 70; i++) {
        initBullet(&bullets[i]);
    }
}

void initBullet(BULLET *b) {
    b->active = 0;
    b->width = 8;
    b->height = 8;
}

void initEnemies(LEVEL level, ENEMY enemies[], int enemySpawns[], int enemyTypes[]) {
    for (int i = 0; i < level.enemies; i++) {
        enemies[i].enemyType = enemyTypes[i];
        enemies[i].worldCol = enemySpawns[i * 2];
        enemies[i].worldRow = enemySpawns[i * 2 + 1];
        initEnemy(&enemies[i], level);
    }

}

void initEnemy(ENEMY *e, LEVEL level) {
    if (e->enemyType == BEEMON) {
        e->alive = 1;
        e->height = 16;
        e->width = 16;
        e->health = 3;
        e->numFrames = 4;
        e->curFrame = 0;
        e->state = BEEMONLEFT;
        e->frameCounter = 12;
        e->hspd = 1;
        e->damage = 1;
        e->timer = 0;
        e->ammoDrop = 3;
    }
    if (e->enemyType == BOSS) {
        e->alive = 1;
        e->height = 64;
        e->width = 64;
        e->health = 4;
        e->numFrames = 4;
        e->curFrame = 0;
        e->state = BOSSIDLE;
        e->frameCounter = 12;
        e->vspd = 1;
        e->damage = 1;
        e->timer = 0;
    }
}

void initLootBoxes() {

    for (int i = 0; i < ((3) + (1)); i++) {
        s1Loot[i].active = 0;
        s1Loot[i].height = 8;
        s1Loot[i].width = 8;
    }
    for (int i = 0; i < 10; i++) {
        bossLoot[i].active = 0;
        bossLoot[i].height = 8;
        bossLoot[i].width = 8;
    }
}

void dropLoot(ENEMY *e, LEVEL level, LOOTBOX pickups[]) {

    for (int i = 0; i < level.pickups; i++) {
        if (!(pickups[i].active)) {

            pickups[i].ammocount = e->ammoDrop;
            pickups[i].worldCol = e->worldCol;
            pickups[i].worldRow = e->worldRow;
            pickups[i].active = 1;
        }
    }

}

void updateGame() {

    switch (stage) {
        case STAGE1:
            updatePlayer(gwl_STAGE1CMBitmap, stage1.levelHeight, stage1.levelWidth);
            updateBullets();
            updateEnemies(s1Enemies, stage1);
            updateLootBox(s1Loot, stage1);
            break;
        case BOSS:
            updatePlayer(gwl_BOSSCMBitmap, boss.levelHeight, boss.levelWidth);
            updateBullets();
            updateEnemies(bossEnemies, boss);
            break;
    }



}

void updatePlayer(unsigned short collisionMap[], int MAPHEIGHT, int MAPWIDTH) {
    if (MAPWIDTH > 512) {
        if (hOff > 256 && screenBlock < 31) {
            screenBlock++;
            hOff -= 256;
            (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((screenBlock)<<8) | (1<<7) | (1<<14);
        }

        if (playerHOff > 512) {
            playerHOff -= 512;
        }
    }


    if (player.iFrameCounter > 0) {
        player.iFrameCounter--;
    }




    switch (stage) {
        case STAGE1:
            if (collision(stage1Exit.worldCol, stage1Exit.worldRow, stage1Exit.width, stage1Exit.height, player.worldCol, ((player.worldRow) >> 8), player.width, player.height)) {
                stage = stage1Exit.dst;
                changeLevel();
            }
            break;
    }

    player.vspd += 100;

    if (((player.worldRow) >> 8) > MAPHEIGHT - 20) {
        player.health = 0;
    }

    if (((player.worldRow + player.vspd) >> 8) <= MAPHEIGHT - player.height
        && collisionMap[((((player.worldRow + player.vspd) >> 8) + player.height - 1)*(MAPWIDTH)+(player.worldCol))]
        && collisionMap[((((player.worldRow + player.vspd) >> 8) + player.height - 1)*(MAPWIDTH)+(player.worldCol + player.width - 1))]
        && collisionMap[((((player.worldRow + player.vspd) >> 8))*(MAPWIDTH)+(player.worldCol))]
        && collisionMap[((((player.worldRow + player.vspd) >> 8))*(MAPWIDTH)+(player.worldCol + player.width - 1))])
    {
        player.worldRow += player.vspd;

        if (player.vspd < 0) {
            if (vOff + ((player.vspd) >> 8) >= 0 && player.screenRow < 30) {
                vOff += ((player.vspd) >> 8);
            }
        } else {
            if (vOff < MAPHEIGHT - 160 && player.screenRow + player.height > 160 - 20) {
                vOff += ((player.vspd) >> 8);
            }
        }
    } else {
        player.jumping = 0;
        player.vspd = 0;
    }

    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && !(player.jumping)) {
        player.vspd -= 1700;
        player.jumping = 1;

    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (player.worldCol - player.hspd >= (screenBlock - 28) * 256
        && collisionMap[((((player.worldRow) >> 8))*(MAPWIDTH)+(player.worldCol - player.hspd))]
        && collisionMap[((((player.worldRow + player.height) >> 8))*(MAPWIDTH)+(player.worldCol - player.hspd))]) {

            player.worldCol -= player.hspd;
        }

        if (hOff - player.hspd >= 0 && player.screenCol < 240 / 3) {
            hOff -= player.hspd;
            playerHOff -= player.hspd;
        }
    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if ((player.worldCol + player.width) < (MAPWIDTH - player.width)
        && collisionMap[((((player.worldRow) >> 8))*(MAPWIDTH)+(player.worldCol + player.width + player.hspd - 1))]
        && collisionMap[((((player.worldRow + player.height) >> 8))*(MAPWIDTH)+(player.worldCol + player.width + player.hspd - 1))]) {

            player.worldCol += player.hspd;


            if (hOff < (MAPWIDTH - 240 - 1) && player.screenCol > 240 / 2 && screenBlock < 31) {
                hOff += player.hspd;
                playerHOff += player.hspd;
            }
        }

    }



    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))) && player.fireTimer > player.fireRate && player.health > 0) {
        player.fireTimer = 0;
        player.health--;
        fire();
    }
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && !player.dash) {
        player.hspd = player.hspd * 4;
        player.dashTime = 0;
        player.dash = 1;
    } else if (player.dashTime >= 10 && player.dash) {
        player.hspd = 2;
        player.dashTime = 0;
        player.dash = 0;
    }

    if (player.dash) {
        player.dashTime++;
    }
    player.fireTimer++;


    player.screenRow = ((player.worldRow) >> 8) - vOff;
    player.screenCol = player.worldCol - playerHOff;

    animatePlayer();
}

void updateBullets() {
    for (int i = 0; i < 70; i++) {
        if (bullets[i].active) {
            updateBullet(&bullets[i]);
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

    b->screenCol = b->worldCol - playerHOff;
    b->screenRow = b->worldRow - vOff;

}

void updateEnemies(ENEMY enemies[], LEVEL level) {
    for (int i = 0; i < level.enemies; i++) {
        if (enemies[i].alive) {
            updateEnemy(&enemies[i], level);
        }
    }
}
void updateEnemy(ENEMY *e, LEVEL level) {
    switch (e->enemyType)
    {
    case BEEMON:
        updateBeemon(e, level);
        animateBeemon(e);
        break;

    case BOSS:
        updateBoss(e, level);
        animateBoss(e);
        break;
    }



}

void updateLootBox(LOOTBOX pickups[], LEVEL level) {
    for (int i = 0; i < level.pickups; i++) {
        if (pickups[i].active) {
            if (collision(player.worldCol, ((player.worldRow) >> 8), player.width, player.height, pickups[i].worldCol, pickups[i].worldRow, pickups[i].width, pickups[i].height)) {
                pickups[i].active = 0;
                player.health += pickups[i].ammocount;
            }
        }

        pickups[i].screenCol = pickups[i].worldCol - playerHOff;
        pickups[i].screenRow = pickups[i].worldRow - vOff;
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



    switch (e->enemyType)
    {
    case BEEMON:
        animateBeemon(e);
        break;

    case BOSS:
        animateBoss(e);
        break;
    }

}

void drawGame() {
    switch (stage) {
        case STAGE1:
            drawPlayer();
            drawBullets();
            drawEnemies(stage1, s1Enemies);
            drawLootBox(s1Loot, stage1);
            break;
        case BOSS:
            drawPlayer();
            drawBullets();
            drawEnemies(boss, bossEnemies);
            drawLootBox(bossLoot, boss);
    }

    waitForVBlank();

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}

void drawPlayer() {
    shadowOAM[0].attr0 = (0xFF & player.screenRow) | (0<<14);
    shadowOAM[0].attr1 = (0x1FF & player.screenCol) | (1<<14);
    shadowOAM[0].attr2 = ((player.curFrame * 2)*32+(player.state * 2));
}

void fire() {
    for (int i = 0; i < 70; i++) {
        if (!(bullets[i].active)) {
            if (player.state == GUNRIGHT || player.state == GUNJUMPR) {
                bullets[i].worldCol = player.worldCol + player.width - 1;
                bullets[i].worldRow = ((player.worldRow) >> 8);
                bullets[i].active = 1;
                bullets[i].bulletType = player.gunType;
                bullets[i].state = GUNRIGHT;
                bullets[i].spd = 4;
                break;
            }
            if (player.state == GUNLEFT || player.state == GUNJUMPL) {
                bullets[i].worldCol = player.worldCol + 1;
                bullets[i].worldRow = ((player.worldRow) >> 8);
                bullets[i].active = 1;
                bullets[i].state = GUNLEFT;
                bullets[i].bulletType = player.gunType;
                bullets[i].spd = -4;
                break;
            }
        }
    }
}

void drawBullets() {
    for (int i = 0; i < 70; i++) {
        if (bullets[i].active) {
            shadowOAM[i + 1].attr0 = (0xFF & bullets[i].screenRow) | (0<<14);
            shadowOAM[i + 1].attr1 = (0x1FF & bullets[i].screenCol) | (0<<14);
            shadowOAM[i + 1].attr2 = ((6)*32+(0));
        } else {
            shadowOAM[i + 1].attr0 |= (2<<8);
        }
    }
}

void drawEnemies(LEVEL level, ENEMY enemies[]) {
    for (int i = 0; i < level.enemies; i++) {
        if (enemies[i].alive && enemies[i].screenCol > 0 && enemies[i].screenCol < 240) {
            switch (enemies[i].enemyType)
            {
            case BEEMON:
                drawBeemon(&enemies[i], i);
                break;

            case BOSS:
                drawBoss(&enemies[i], i);
                break;
            }
        } else {
            shadowOAM[i + 70 + 1].attr0 |= (2<<8);
        }
    }
}

void drawLootBox(LOOTBOX pickups[], LEVEL level) {
    for (int i = 0; i < level.pickups; i++) {
        if (pickups[i].active) {
            shadowOAM[i + 70 + level.enemies + 1].attr0 = (0xFF & pickups[i].screenRow) | (0<<14);
            shadowOAM[i + 70 + level.enemies + 1].attr1 = (0x1FF & pickups[i].screenCol) | (1<<14);
            shadowOAM[i + 70 + level.enemies + 1].attr2 = ((4)*32+(0));
        } else {
            shadowOAM[i + 70 + level.enemies + 1].attr0 |= (2<<8);
        }
    }

}

void changeLevel() {
    switch (stage) {
    case BOSS:
        (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (1<<14);

        DMANow(3, gwl_BOSSPal, ((unsigned short *)0x5000000), 512 / 2);
        DMANow(3, gwl_BOSSTiles, &((charblock *)0x6000000)[0], 6688 / 2);
        DMANow(3, gwl_BOSSMap, &((screenblock *)0x6000000)[28], 4096 / 2);

        initPlayer(boss);
        initEnemies(boss, bossEnemies, bossEnemySpawns, bossEnemyTypes);

        hOff = 0;
        playerHOff = 0;
        vOff = 0;
        screenBlock = 28;
        break;
    }
}
