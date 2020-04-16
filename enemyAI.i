# 1 "enemyAI.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "enemyAI.c"

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
# 3 "enemyAI.c" 2
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
# 4 "enemyAI.c" 2


extern unsigned short vOff;
extern unsigned short hOff;
extern int playerHOff;

void animateBeemon(ENEMY *e) {
    if (e->state == BEEMONLEFT || e->state == BEEMONRIGHT) {
        if (e->frameCounter % 12 == 0) {
            e->curFrame = (e->curFrame + 1) % e->numFrames;
        }


        if (e->timer >= 40 && e->state == BEEMONRIGHT) {
            e->timer = 0;
            e->state = BEEMONLEFT;
        } else if (e->timer >= 40 && e->state == BEEMONLEFT) {
            e->timer = 0;
            e->state = BEEMONRIGHT;
        }

        e->frameCounter++;
        e->timer++;
    } else if (e->state == BEEMONHITL || e->state == BEEMONHITR) {
        if (e->hitStun < 0) {
            e->state = e->prevState;
        }
        e->hitStun--;
    }
}

void animateBoss(ENEMY *e) {
    if (e->state == BOSSIDLE) {
        if (e->frameCounter % 12 == 0) {
            e->curFrame = (e->curFrame + 1) % e->numFrames;
        }

        if (e->timer >= 200) {
            e->timer = 0;
            e->curFrame = 0;
            e->state = BOSSATTACK;
        }

        e->frameCounter++;
        e->timer++;
    } else if (e->state == BOSSATTACK) {
        if (e->frameCounter % 12 == 0) {
            e->curFrame = (e->curFrame + 1) % e->numFrames;
        }
        if (e->timer >= 50) {
            e->timer = 0;
            e->state = BOSSIDLE;
        }
        e->timer++;
        e->frameCounter++;
    }
}

void drawBeemon(ENEMY *e, int i) {
    shadowOAM[i + 70 + 1].attr0 = e->screenRow | (0<<14);
    shadowOAM[i + 70 + 1].attr1 = e->screenCol | (1<<14);
    shadowOAM[i + 70 + 1].attr2 = (((e->curFrame + 4) * 2)*32+((e->state) * 2));

}

void drawBoss(ENEMY *e, int i) {
    shadowOAM[i + 70 + 1].attr0 = e->screenRow | (0<<14);
    shadowOAM[i + 70 + 1].attr1 = e->screenCol | (3<<14);
    shadowOAM[i + 70 + 1].attr2 = ((e->curFrame * 8)*32+((e->state + 2) * 8));
}

void updateBeemon(ENEMY *e, LEVEL level) {
    if (e->state == BEEMONRIGHT) {
        e->worldCol += e->hspd;
    }
    if (e->state == BEEMONLEFT) {
        e->worldCol -= e->hspd;
    }

    if (collision(e->worldCol, e->worldRow, e->width, e->height, player.worldCol, ((player.worldRow) >> 8), player.width, player.height) && player.iFrameCounter == 0) {
        player.health -= e->damage;
        player.iFrameCounter = 50;
    }

    for (int b = 0; b < 70; b++) {
        if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - 1 <= 0) {


            e->alive = 0;
            bullets[b].active = 0;
            switch (stage)
            {
            case STAGE1:
                dropLoot(e, level, s1Loot);
                break;

            case BOSS:
                dropLoot(e, level, bossLoot);
                break;
            }
        } else if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health > 0) {

            if (e->state == BEEMONLEFT) {
                e->prevState = e->state;
                e->state = BEEMONHITL;
            }

            if (e->state == BEEMONRIGHT) {
                e->prevState = e->state;
                e->state = BEEMONHITR;
            }

            e->hitStun = 20;
            e->curFrame = 0;
            e->health -= bullets[b].bulletType;
            bullets[b].active = 0;
        }
    }

    e->screenRow = e->worldRow - vOff;
    e->screenCol = e->worldCol - playerHOff;
}

void updateBoss(ENEMY *e, LEVEL level) {
    for (int b = 0; b < 70; b++) {
        if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - 1 <= 0) {

            bossDefeated = 1;
            e->alive = 0;
            bullets[b].active = 0;
        } else if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health > 0) {

            e->health -= bullets[b].bulletType;
            bullets[b].active = 0;
        }
    }
    e->screenRow = e->worldRow - vOff;
    e->screenCol = e->worldCol - playerHOff;
}
