#include "game.h"
#include "myLib.h"
#include "assets/gwl_STARTBG1.h"
#include "assets/gwl_GUIDEBG1.h"
#include "assets/gwl_PAUSEBG.h"
#include "assets/gwl_GAMEBG1.h"
#include "assets/gwl_STAGE1CM.h"
#include "assets/gwl_WINBG1.h"
#include "assets/gwl_SPRITES.h"

int stage;
int oldVDisp;
int vDisp; // this is the variable that stores the player's vertical displacement
int timer;

PLAYER player;
ENEMY s1Enemies[ENEMYCOUNT_STAGE1];
BULLET minigunMag[MINIGUN_MAX];
LOOTBOX s1Loot[LOOTCOUNT_STAGE1];

unsigned short hOff;
unsigned short vOff;
int playerHOff;

int screenBlock;

void initGame() {
    stage = STAGE1;
    screenBlock = 28;
    playerHOff = 0;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
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
    player.fireRate = PISTOL_FIRERATE;
    player.health = PISTOL_MAX;
    player.numFrames = 4;
    player.hspd = 2;
    player.vspd = 0;
    player.curFrame = 0;
    player.state = GUNRIGHT;
    player.frameCounter = FPS;
    player.jumping = 1;
    player.airTime = 0;
    player.fireTimer = 0;
}

void initBullets() {
    for (int i = 0; i < MINIGUN_MAX; i++) {
        initBullet(&minigunMag[i]);
    }
}

void initBullet(BULLET *b) {
    b->active = 0;
    b->width = 8;
    b->height = 8;
}

void initEnemies() {
    for (int i = 0; i < ENEMYCOUNT_STAGE1; i++) {
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
        e->frameCounter = FPS;
        e->hspd = 1;
        e->damage = 1;
        e->timer = 0;
        e->ammoDrop = 3;
    }
}

void initLootBoxes() {
    for (int i = 0; i < LOOTCOUNT_STAGE1; i++) {
        initLootBox(&s1Loot[i]);
    }
}

void initLootBox(LOOTBOX *l) {
    l->active = 0;
    l->height = 8;
    l->width = 8;
}

void spawnEnemyLoot(ENEMY *e) {
    for (int i = 0; i < LOOTCOUNT_STAGE1; i++) {
        if (!(s1Loot[i].active)) {
            //spawn the enemy loot drop
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
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE | BG_8BPP;
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

    //======================UPDATE MOVEMENT================================

    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (player.worldCol - player.hspd >= (screenBlock - 28) * 256
        && gwl_STAGE1CMBitmap[OFFSET(player.worldCol - player.hspd - 1, player.worldRow, STAGE1_MAPWIDTH)]
        && gwl_STAGE1CMBitmap[OFFSET(player.worldCol - player.hspd - 1, player.worldRow + player.height - 1, STAGE1_MAPWIDTH)]) {
            //update player world position
            player.worldCol -= player.hspd;
        }
        //update background offset
        if (hOff - player.hspd >= 0 && player.screenCol < SCREENWIDTH / 2) {
            hOff -= player.hspd;
            playerHOff -= player.hspd;
        }
    }

    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if ((player.worldCol + player.width) < (STAGE1_MAPWIDTH - player.width)
        && gwl_STAGE1CMBitmap[OFFSET(player.worldCol + player.width + player.hspd - 1, player.worldRow, STAGE1_MAPWIDTH)]
        && gwl_STAGE1CMBitmap[OFFSET(player.worldCol + player.width + player.hspd - 1, player.worldRow + player.height - 1, STAGE1_MAPWIDTH)]) {
            //update player world position
            player.worldCol += player.hspd;

            //update background offset
            
        }
        if (hOff < (STAGE1_MAPWIDTH - SCREENWIDTH - 1) && player.screenCol > SCREENWIDTH / 2 && screenBlock < 31) {
            hOff += player.hspd;
            playerHOff += player.hspd;
        }
    }

    //======================UPDATE ABILITIES================================
    
    if ((BUTTON_PRESSED(BUTTON_B) || BUTTON_HELD(BUTTON_B)) && player.fireTimer >= player.fireRate && player.health > 0) {
        player.fireTimer = 0;
        player.health--;
        fire();
    }

    player.fireTimer++;

    //update the screen row and screen col for player
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - playerHOff;

    animatePlayer();
}

void updateBullets() {
    for (int i = 0; i < MINIGUN_MAX; i++) {
        if (minigunMag[i].active) {
            updateBullet(&minigunMag[i]);
        }
    }
}

void updateBullet(BULLET *b) {
    if (b->state == GUNRIGHT) {
        if (b->screenCol + b->width + b->spd > SCREENWIDTH) {
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
    for (int i = 0; i < ENEMYCOUNT_STAGE1; i++) {
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
        player.iFrameCounter = IFRAMES;
    }

    for (int b = 0; b < MINIGUN_MAX; b++) {
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
    for (int i = 0; i < LOOTCOUNT_STAGE1; i++) {
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
    //setting previous state to current state
    player.prevState = player.state;
    player.state = GUNIDLE;

    //change the animation frame per x number of frames as specified in the FPS macro
    if (player.frameCounter % FPS == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    //changing the sprite state
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.state = GUNLEFT;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
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
    //same stuff as player pmuch

    if (e->frameCounter % FPS == 0) {
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

    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

void drawPlayer() {
    shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_TILEID((player.state + 1) * 2, player.curFrame * 2);
}

void fire() {
    for (int i = 0; i < MINIGUN_MAX; i++) {
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
    for (int i = 0; i < MINIGUN_MAX; i++) {
        if (minigunMag[i].active) {
            shadowOAM[i + 1].attr0 = (ROWMASK & minigunMag[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i + 1].attr1 = (COLMASK & minigunMag[i].screenCol) | ATTR1_TINY;
            shadowOAM[i + 1].attr2 = ATTR2_TILEID(2, 8);
        } else {
            shadowOAM[i + 1].attr0 |= ATTR0_HIDE;
        }
    }
}

void drawEnemies() {
    for (int i = 0; i < ENEMYCOUNT_STAGE1; i++) {
        if (s1Enemies[i].alive) {
            shadowOAM[i + MINIGUN_MAX + 1].attr0 = (ROWMASK & s1Enemies[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i + MINIGUN_MAX + 1].attr1 = (COLMASK & s1Enemies[i].screenCol) | ATTR1_SMALL;
            shadowOAM[i + MINIGUN_MAX + 1].attr2 = ATTR2_TILEID((s1Enemies[i].state) * 2, s1Enemies[i].curFrame * 2);
        } else {
            shadowOAM[i + MINIGUN_MAX + 1].attr0 |= ATTR0_HIDE;
        }
    }
}

void drawLootBox() {
    for (int i = 0; i < LOOTCOUNT_STAGE1; i++)
    {
        if (s1Loot[i].active) {
            shadowOAM[i + MINIGUN_MAX + ENEMYCOUNT_STAGE1 + 1].attr0 = (ROWMASK & s1Loot[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i + MINIGUN_MAX + ENEMYCOUNT_STAGE1 + 1].attr1 = (COLMASK & s1Loot[i].screenCol) | ATTR1_TINY;
            shadowOAM[i + MINIGUN_MAX + ENEMYCOUNT_STAGE1 + 1].attr2 = ATTR2_TILEID(2, 8);
        } else {
            shadowOAM[i + MINIGUN_MAX + ENEMYCOUNT_STAGE1 + 1].attr0 |= ATTR0_HIDE;
        }
    }
    
}