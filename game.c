#include "game.h"
#include "myLib.h"
#include "sound.h"
#include "sounds/chaos.h"
#include "sounds/panic.h"
#include "sounds/gunShot.h"
#include "assets/gwl_STARTBG1.h"
#include "assets/gwl_GUIDEBG1.h"
#include "assets/gwl_PAUSEBG.h"
#include "assets/gwl_GAMEBG1.h"
#include "assets/gwl_STAGE1.h"
#include "assets/gwl_STAGE1CM.h"
#include "assets/gwl_BOSS.h"
#include "assets/gwl_BOSSCM.h"
#include "assets/gwl_WINBG1.h"
#include "assets/gwl_SPRITES.h"

int stage;
int bossDefeated;

//sounds
SOUND soundA;
SOUND soundB;


PLAYER player;
BULLET bullets[MAXBULLETS];
int gunslot;
int activeBullets; //dynamically counts the number of active bullets

LEVEL stage1;
ENEMY s1Enemies[ENEMYCOUNT_STAGE1];
LOOTBOX s1Loot[LOOTCOUNT_STAGE1];
int s1EnemySpawns[] = {200, 120, 480, 120, 616, 80, 112, 88, 592, 160};
int s1EnemyTypes[] = {BEEMON, BEEMON, BEEMON, CRATE, CRATE};
DOOR stage1Exit;

LEVEL boss;
ENEMY bossEnemies[ENEMYCOUNT_BOSS];
LOOTBOX bossLoot[LOOTCOUNT_BOSS];
int bossEnemySpawns[] = {440, 50, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0, 0, 0, 0, 176, 88, 200, 88, 240, 64};
int bossEnemyTypes[] = {HEADMAN, BEELLET, BEELLET, BEELLET, BEELLET, BEELLET, BEELLET, BEELLET, BEELLET, BEELLET, RATTANK, CRATE, CRATE};

unsigned short hOff;
unsigned short vOff;
int playerHOff;

int screenBlock;

void initGame() {
    stage = STAGE1;
    bossDefeated = 0;
    activeBullets = 0;
    playSoundA(chaos, CHAOSLEN, 1);
    screenBlock = 28;
    playerHOff = 0;
    gunslot = 0;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    initLevels();
    initPlayer(stage1);
    initBullets();
    initEnemies(stage1, s1Enemies, s1EnemySpawns, s1EnemyTypes);
    initLootBoxes();

    hOff = 0;
    vOff = 0;
}

void initLevels() {
    //initializing the information for level / stage 1
    stage1.enemies = ENEMYCOUNT_STAGE1;
    stage1.pickups = LOOTCOUNT_STAGE1;
    stage1.playerSpawnCol = STAGE1_SPAWNCOL;
    stage1.playerSpawnRow = STAGE1_SPAWNROW;
    stage1.levelHeight = STAGE1_MAPHEIGHT;
    stage1.levelWidth = STAGE1_MAPWIDTH;

    stage1Exit.width = 40;
    stage1Exit.height = 80;
    stage1Exit.worldCol = 712;
    stage1Exit.worldRow = 24;
    stage1Exit.dst = BOSS;

    //initializing the information for the boss level
    boss.levelHeight = BOSS_MAPHEIGHT;
    boss.levelWidth = BOSS_MAPWIDTH;
    boss.pickups = LOOTCOUNT_BOSS;
    boss.enemies = ENEMYCOUNT_BOSS;
    boss.playerSpawnCol = BOSS_SPAWNCOL;
    boss.playerSpawnRow = BOSS_SPAWNROW;
}

void initPlayer(LEVEL level) {
    player.worldCol = level.playerSpawnCol;
    player.worldRow = SHIFTUP(level.playerSpawnRow);
    player.width = 16;
    player.height = 16;
    player.gunType = PISTOL;
    player.fireRate = PISTOL_FIRERATE;
    player.pistolHealth = PISTOL_MAX;
    player.shotgunHealth = SHOTGUN_MAX;
    player.minigunHealth = MINIGUN_MAX;
    player.currentHealth = player.pistolHealth;
    player.numFrames = 4;
    player.hspd = 2; // player's current walking speed
    player.dash = 0;
    player.dashTime = 0;
    player.vspd = 0;
    player.jumping = 1;

    //animation stuff
    player.curFrame = 0;
    player.state = GUNRIGHT;
    player.frameCounter = FPS;
    player.fireTimer = 0;
}

void initBullets() {
    for (int i = 0; i < MAXBULLETS; i++) {
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
        e->frameCounter = FPS;
        e->hspd = 1;
        e->damage = 1;
        e->timer = 0;
        e->ammoDrop = 3;
    }
    if (e->enemyType == HEADMAN) {
        e->alive = 1;
        e->height = 64;
        e->width = 64;
        e->health = 40;
        e->numFrames = 4;
        e->curFrame = 0;
        e->state = BOSSIDLE;
        e->frameCounter = FPS;
        e->vspd = 1;
        e->damage = 1;
        e->timer = 0;
    }
    if (e->enemyType == BEELLET) {
        e->alive = 0;
        e->height = 16;
        e->width = 16;
        e->health = 1;
        e->numFrames = 4;
        e->curFrame = 0;
        e->frameCounter = FPS;
        e->damage = 1;
        e->timer = 0;
        e->ammoDrop = 2;
    }
    if (e->enemyType == RATTANK) {
        e->alive = 1;
        e->height = 16;
        e->width = 32;
        e->health = 6;
        e->numFrames = 3;
        e->curFrame = 0;
        e->frameCounter = FPS;
        e->damage = 1;
        e->timer = 0;
        e->ammoDrop = 10;
        e->state = TANKIDLE;
    }
    if (e->enemyType == CRATE) {
        e->alive = 1;
        e->height = 16;
        e->width = 16;
        e->state = CRATEFULL;
        e->ammoDrop = 5;
        e->health = 2;
    }
}

void initLootBoxes() {
    // initialize the loot boxes in each stage
    for (int i = 0; i < stage1.pickups; i++) {
        s1Loot[i].active = 0;
        s1Loot[i].height = 8;
        s1Loot[i].width = 8;
    }
    for (int i = 0; i < boss.pickups; i++) {
        bossLoot[i].active = 0;
        bossLoot[i].height = 8;
        bossLoot[i].width = 8;
    }
}

void dropLoot(ENEMY *e, LEVEL level, LOOTBOX pickups[]) {
    //using the dead enemy's last location, look for an inactive LOOTBOX to initialize
    for (int i = 0; i < level.pickups; i++) {
        if (!(pickups[i].active)) {
            //spawn the enemy loot drop
            pickups[i].ammocount = e->ammoDrop;
            pickups[i].worldCol = e->worldCol;
            pickups[i].worldRow = e->worldRow;
            pickups[i].active = 1;
            break;
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
            updateLootBox(bossLoot, boss);
            break;
    }



}

void updatePlayer(unsigned short collisionMap[], int MAPHEIGHT, int MAPWIDTH) {
    if (MAPWIDTH > 512) {
        if (hOff > 256 && screenBlock < 31) {
            screenBlock++;
            hOff -= 256;
            REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_8BPP | BG_SIZE_WIDE;
        } else if (hOff <= 0 && screenBlock > 28) {
            screenBlock--;
            hOff += 256;
            REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_8BPP | BG_SIZE_WIDE;
        }
    }


    if (player.iFrameCounter > 0) { //incrementing iframes upon a hit
        player.iFrameCounter--;
    }

    //======================UPDATE MOVEMENT================================

    //check the stage to see if the player has reached the end goal
    switch (stage) {
        case STAGE1:
            if (collision(stage1Exit.worldCol, stage1Exit.worldRow, stage1Exit.width, stage1Exit.height, player.worldCol, SHIFTDOWN(player.worldRow), player.width, player.height)) {
                stage = stage1Exit.dst;
                changeLevel();
            }
            break;
    }

    player.vspd += GRAVITY; // gravity always acting on the player

    if (SHIFTDOWN(player.worldRow) > MAPHEIGHT - 20) {
        player.pistolHealth = 0;
        player.shotgunHealth = 0;
    }

    if (SHIFTDOWN(player.worldRow + player.vspd) <= MAPHEIGHT - player.height
        && collisionMap[OFFSET(player.worldCol, SHIFTDOWN(player.worldRow + player.vspd) + player.height - 1, MAPWIDTH)]
        && collisionMap[OFFSET(player.worldCol + player.width - 1, SHIFTDOWN(player.worldRow + player.vspd) + player.height - 1, MAPWIDTH)]
        && collisionMap[OFFSET(player.worldCol, SHIFTDOWN(player.worldRow + player.vspd), MAPWIDTH)]
        && collisionMap[OFFSET(player.worldCol + player.width - 1, SHIFTDOWN(player.worldRow + player.vspd), MAPWIDTH)]) 
    {
        player.worldRow += player.vspd;
        
        if (player.vspd < 0) { // going up
            if (vOff + SHIFTDOWN(player.vspd) >= 0 && player.screenRow < 30) {
                vOff += SHIFTDOWN(player.vspd);
            }
        } else { // going down
            if (vOff < MAPHEIGHT - SCREENHEIGHT && player.screenRow + player.height > SCREENHEIGHT - 20) {
                vOff += SHIFTDOWN(player.vspd);
            }
        }
    } else {
        player.jumping = 0;
        player.vspd = 0; // if player is on the ground vertical speed is 0
    }
    if (BUTTON_PRESSED(BUTTON_UP) && !(player.jumping) && player.gunType != MINIGUN) {
        player.vspd -= JUMPPOWER;
        player.jumping = 1;

    }


    if (BUTTON_HELD(BUTTON_LEFT) && !player.dash) {
        if (player.worldCol - player.hspd >= (screenBlock - 28) * 256
        && collisionMap[OFFSET(player.worldCol - player.hspd, SHIFTDOWN(player.worldRow), MAPWIDTH)]
        && collisionMap[OFFSET(player.worldCol - player.hspd, SHIFTDOWN(player.worldRow + player.height), MAPWIDTH)]) {
            //update player world position
            player.worldCol -= player.hspd;
        }
        //update background offset
        if (hOff > 0 && player.screenCol < SCREENWIDTH / 2) {
            hOff -= player.hspd;
            playerHOff -= player.hspd;
        }
    } else if (BUTTON_HELD(BUTTON_RIGHT) && !player.dash) {
        if ((player.worldCol + player.width) < (MAPWIDTH - player.width)
        && collisionMap[OFFSET(player.worldCol + player.width + player.hspd - 1, SHIFTDOWN(player.worldRow), MAPWIDTH)]
        && collisionMap[OFFSET(player.worldCol + player.width + player.hspd - 1, SHIFTDOWN(player.worldRow + player.height), MAPWIDTH)]) {
            //update player world position
            player.worldCol += player.hspd;

            //update background offset
            if (hOff < (MAPWIDTH - SCREENWIDTH - 1) && player.screenCol > SCREENWIDTH / 2) {
                hOff += player.hspd;
                playerHOff += player.hspd;
            }
        }
    }

    //======================UPDATE ABILITIES================================
    
    if ((BUTTON_PRESSED(BUTTON_B) || BUTTON_HELD(BUTTON_B)) && player.fireTimer > player.fireRate && player.currentHealth > 0) {
        player.fireTimer = 0;
        switch (player.gunType)
        {
        case PISTOL:
            player.pistolHealth--;
            break;
        case SHOTGUN:
            player.shotgunHealth--;
            break;
        case MINIGUN:
            player.minigunHealth--;
            break;
        }
        fire(1, 0);
        playSoundB(gunShot, GUNSHOTLEN, 0);
    }
    if (BUTTON_PRESSED(BUTTON_A) && !player.dash && player.gunType == PISTOL) {
        if (player.jumping) {
            player.vspd = 0;
        }
        player.hspd = player.hspd * 2;
        player.dashTime = 0;
        player.dash = 1;
    } else  if (player.dashTime >= 10 && player.dash && player.gunType == PISTOL) {
        player.hspd = player.hspd / 2;
        player.dashTime = 0;
        player.dash = 0;
    }

    //CHEAT ACTIVATION
    if (BUTTON_PRESSED(BUTTON_DOWN) || player.currentHealth <= 0) {
        gunslot++;
        if (gunslot % 3 == 0) {
            player.gunType = PISTOL;
            player.fireRate = PISTOL_FIRERATE;
            player.hspd = 2;
            player.currentHealth = player.pistolHealth;
        }
        if (gunslot % 3 == 1) {
            player.gunType = SHOTGUN;
            player.fireRate = SHOTGUN_FIRERATE;
            player.hspd = 2;
            player.currentHealth = player.shotgunHealth;
        }
        if (gunslot % 3 == 2) {
            player.gunType = MINIGUN;
            player.fireRate = MINIGUN_FIRERATE;
            player.hspd = 1;
            player.currentHealth = player.minigunHealth;
        }
    }

    if (player.dash) {
        if (player.state == GUNLEFT) {
            if (player.worldCol - player.hspd >= (screenBlock - 28) * 256
            && collisionMap[OFFSET(player.worldCol - player.hspd, SHIFTDOWN(player.worldRow), MAPWIDTH)]
            && collisionMap[OFFSET(player.worldCol - player.hspd, SHIFTDOWN(player.worldRow + player.height), MAPWIDTH)]) {
                player.worldCol -= player.hspd;
            }
            if (hOff > 0 && player.screenCol < SCREENWIDTH / 2) {
                hOff -= player.hspd;
                playerHOff -= player.hspd;
            }
        }
        if (player.state == GUNRIGHT) {
            if ((player.worldCol + player.width) < (MAPWIDTH - player.width)
            && collisionMap[OFFSET(player.worldCol + player.width + player.hspd - 1, SHIFTDOWN(player.worldRow), MAPWIDTH)]
            && collisionMap[OFFSET(player.worldCol + player.width + player.hspd - 1, SHIFTDOWN(player.worldRow + player.height), MAPWIDTH)]) {
                player.worldCol += player.hspd;

                if (hOff < (MAPWIDTH - SCREENWIDTH - 1) && player.screenCol > SCREENWIDTH / 2) {
                    hOff += player.hspd;
                    playerHOff += player.hspd;
                }
            }
        }
        player.dashTime++;
        player.vspd = 0;
    }
    player.fireTimer++;
    
    switch (player.gunType)
    {
    case PISTOL:
        player.currentHealth = player.pistolHealth;
        break;
    
    case SHOTGUN:
        player.currentHealth = player.shotgunHealth;
        break;
    }

    //update the screen row and screen col for player
    player.screenRow = SHIFTDOWN(player.worldRow) - vOff;
    player.screenCol = player.worldCol - playerHOff;

    animatePlayer();
}

void updateBullets() {
    for (int i = 0; i < MAXBULLETS; i++) {
        if (bullets[i].active) {
            updateBullet(&bullets[i]);
        }
    }
}

void updateBullet(BULLET *b) {

    b->worldCol += b->hspd;
    b->worldRow += b->vspd;

    b->screenCol = b->worldCol - playerHOff;
    b->screenRow = b->worldRow - vOff;

    if (b->state == GUNRIGHT) {
        if (b->screenCol > SCREENWIDTH) {
            b->active = 0;
            activeBullets--;
        }
    }
    if (b->state == GUNLEFT) {
        if (b->screenCol < 0) {
            b->active = 0;
            activeBullets--;
        }
    }

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
    
    case HEADMAN:
        updateHeadMan(e, level);
        animateHeadMan(e);
        break;
    
    case BEELLET:
        updateBeellet(e, level);
        animateBeellet(e);
        break;

    case RATTANK:
        updateRatTank(e, level);
        animateRatTank(e);
        break;
    
    case CRATE:
        updateCrate(e, level);
        break;
    }
    

    e->screenCol = e->worldCol - playerHOff;
    e->screenRow = e->worldRow - vOff;
}

void updateLootBox(LOOTBOX pickups[], LEVEL level) {
    for (int i = 0; i < level.pickups; i++) {
        if (pickups[i].active) {
            if (collision(player.worldCol, SHIFTDOWN(player.worldRow), player.width, player.height, pickups[i].worldCol, pickups[i].worldRow, pickups[i].width, pickups[i].height)) {
                pickups[i].active = 0;
                //only pistols and shotguns refill their ammo, miniguns don't!
                player.pistolHealth += pickups[i].ammocount;
                player.shotgunHealth += pickups[i].ammocount;
                if (player.pistolHealth > PISTOL_MAX) {
                    player.pistolHealth = PISTOL_MAX;
                }
                if (player.shotgunHealth > SHOTGUN_MAX) {
                    player.shotgunHealth = SHOTGUN_MAX;
                }
            }
        }
        
        pickups[i].screenCol = pickups[i].worldCol - playerHOff;
        pickups[i].screenRow = pickups[i].worldRow - vOff;
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

    //changes frame as set by the FPS
    switch (e->enemyType)
    {
    case BEEMON:
        animateBeemon(e);
        break;
    
    case HEADMAN:
        animateHeadMan(e);
        break;

    case BEELLET:
        animateBeellet(e);
        break;

    case RATTANK:
        animateRatTank(e);
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
            break;
    }

    drawHealthBar();

    waitForVBlank();

    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}

void drawPlayer() {
    switch (player.gunType) {
        case PISTOL:
            shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE;
            shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_SMALL;
            shadowOAM[0].attr2 = ATTR2_TILEID(player.state * 2, player.curFrame * 2);
            break;
        
        case SHOTGUN:
            shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_WIDE;
            shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
            shadowOAM[0].attr2 = ATTR2_TILEID((player.state - 1) * 4, (player.curFrame + 12) * 2);
            break;
        
        case MINIGUN:
            shadowOAM[0].attr0 = (ROWMASK & (player.screenRow - player.height)) | ATTR0_SQUARE;
            shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
            shadowOAM[0].attr2 = ATTR2_TILEID((player.state + 1) * 4, (player.curFrame + 4) * 4);
            break;
    }
}

void fire(int src, ENEMY *e) {
    if (src == 1) {
        int shotgunPelletsFired = 0;
        switch (player.gunType) {
            case PISTOL:
                for (int i = 0; i < MAXBULLETS; i++) {
                    if (!(bullets[i].active)) { // if the current slot in the bullet array is not active (not on the map) initialize its position
                        if (player.state == GUNRIGHT) {
                            bullets[i].worldCol = player.worldCol + player.width - 1;;
                            bullets[i].state = GUNRIGHT;
                            bullets[i].hspd = 4;
                        } else if (player.state == GUNLEFT) {
                            bullets[i].worldCol = player.worldCol + 1;
                            bullets[i].state = GUNLEFT;
                            bullets[i].hspd = -4;

                        }
                        bullets[i].active = 1;
                        bullets[i].worldRow = SHIFTDOWN(player.worldRow);
                        bullets[i].bulletType = player.gunType;
                        bullets[i].vspd = 0;
                        activeBullets++;
                        break;
                    }
                }
                break;
            
            case SHOTGUN:
                for (int i = 0; i < MAXBULLETS; i++) {
                    if (!(bullets[i].active) && shotgunPelletsFired < SHOTGUN_PELLETS) {
                        activeBullets++;
                        shotgunPelletsFired++;
                        if (player.state == GUNRIGHT) {
                            bullets[i].worldCol = player.worldCol + player.width - 1;;
                            bullets[i].state = GUNRIGHT;
                            bullets[i].hspd = 4;
                        } else if (player.state == GUNLEFT) {
                            bullets[i].worldCol = player.worldCol + 1;
                            bullets[i].state = GUNLEFT;
                            bullets[i].hspd = -4;

                        }
                        bullets[i].active = 1;
                        bullets[i].worldRow = SHIFTDOWN(player.worldRow);
                        bullets[i].bulletType = player.gunType;
                        bullets[i].vspd = shotgunPelletsFired - (SHOTGUN_PELLETS - 1);
                    }
                }
                break;

            case MINIGUN:
                for (int i = 0; i < MAXBULLETS; i++) {
                    if (!(bullets[i].active)) { // if the current slot in the bullet array is not active (not on the map) initialize its position
                        if (player.state == GUNRIGHT) {
                            bullets[i].worldCol = player.worldCol + player.width - 1;;
                            bullets[i].state = GUNRIGHT;
                            bullets[i].hspd = 4;
                        } else if (player.state == GUNLEFT) {
                            bullets[i].worldCol = player.worldCol + 1;
                            bullets[i].state = GUNLEFT;
                            bullets[i].hspd = -4;

                        }
                        bullets[i].active = 1;
                        bullets[i].worldRow = SHIFTDOWN(player.worldRow);
                        bullets[i].bulletType = player.gunType;
                        bullets[i].vspd = 0;
                        activeBullets++;
                        break;
                    }
                }
                break;
        }
    }
    if (src == RATTANK) {
        for (int i = 0; i < MAXBULLETS; i++) {
            if (!(bullets[i].active)) { // if the current slot in the bullet array is not active (not on the map) initialize its position
                if (e->state == TANKRIGHT) {
                    bullets[i].worldCol = e->worldCol + e->width;
                    bullets[i].state = GUNRIGHT;
                    bullets[i].hspd = 3;
                } else if (player.state == TANKLEFT) {
                    bullets[i].worldCol = e->worldCol;
                    bullets[i].state = GUNLEFT;
                    bullets[i].hspd = -3;

                }
                bullets[i].active = 1;
                bullets[i].worldRow = e->worldRow;
                bullets[i].bulletType = TANKBULLET;
                bullets[i].vspd = 0;
                activeBullets++;
                break;
            }
        }
    }
    
    
}

void drawBullets() {
    for (int i = 0; i < MAXBULLETS; i++) {
        if (bullets[i].active && bullets[i].screenCol > 0 && bullets[i].screenCol < SCREENWIDTH) {
            shadowOAM[i + player.pistolHealth + 1].attr0 = (ROWMASK & bullets[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i + player.pistolHealth + 1].attr1 = (COLMASK & bullets[i].screenCol) | ATTR1_TINY;
            shadowOAM[i + player.pistolHealth + 1].attr2 = ATTR2_TILEID(0, 6);
        } else {
            shadowOAM[i + player.pistolHealth +  1].attr0 |= ATTR0_HIDE;
        }
    }
}

void drawEnemies(LEVEL level, ENEMY enemies[]) {
    for (int i = 0; i < level.enemies; i++) {
        if (enemies[i].alive && enemies[i].screenCol > 0 && enemies[i].screenCol < SCREENWIDTH) {
            switch (enemies[i].enemyType)
            {
            case BEEMON:
                drawBeemon(&enemies[i], i);
                break;
            
            case HEADMAN:
                drawHeadMan(&enemies[i], i);
                break;
            
            case BEELLET:
                drawBeellet(&enemies[i], i);
                break;
            
            case RATTANK:
                drawRatTank(&enemies[i], i);
                break;
                
            case CRATE:
                drawCrate(&enemies[i], i);
                break;
            }
        } else {
            shadowOAM[i + player.pistolHealth + activeBullets + 1].attr0 |= ATTR0_HIDE;
        }
    }
}

void drawLootBox(LOOTBOX pickups[], LEVEL level) {
    for (int i = 0; i < level.pickups; i++) {
        if (pickups[i].active) {
            shadowOAM[i + player.pistolHealth + activeBullets + level.enemies + 1].attr0 = (ROWMASK & pickups[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i + player.pistolHealth + activeBullets + level.enemies + 1].attr1 = (COLMASK & pickups[i].screenCol) | ATTR1_SMALL;
            shadowOAM[i + player.pistolHealth + activeBullets + level.enemies + 1].attr2 = ATTR2_TILEID(0, 4);
        } else {
            shadowOAM[i + player.pistolHealth + activeBullets + level.enemies + 1].attr0 |= ATTR0_HIDE;
        }
    }
    
}

void changeLevel() {
    switch (stage) {
    case BOSS:
        
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_WIDE;

        stopSound();
        playSoundA(panic, PANICLEN, 1);

        DMANow(3, gwl_BOSSPal, PALETTE, gwl_BOSSPalLen / 2);
        DMANow(3, gwl_BOSSTiles, &CHARBLOCK[0], gwl_BOSSTilesLen / 2);
        DMANow(3, gwl_BOSSMap, &SCREENBLOCK[28], gwl_BOSSMapLen / 2);

        initPlayer(boss);
        initEnemies(boss, bossEnemies, bossEnemySpawns, bossEnemyTypes);
        
        hOff = 0;
        playerHOff = 0;
        vOff = 0;
        screenBlock = 28;
        break;
    }
}

void drawHealthBar() {
    switch (player.gunType)
    {
    case PISTOL:
        for (int i = 0; i < player.pistolHealth; i++) {
            if (i < player.pistolHealth) {
                shadowOAM[i + 1].attr0 = (ROWMASK & 0) | ATTR0_SQUARE;
                shadowOAM[i + 1].attr1 = (COLMASK & (i * 8)) | ATTR1_TINY;
                shadowOAM[i + 1].attr2 = ATTR2_TILEID(1, 6);
            } else {
                shadowOAM[i + 1].attr0 |= ATTR0_HIDE;
            }
        }
        break;
    
    case SHOTGUN:
        for (int i = 0; i < player.pistolHealth; i++) {
            if (i < player.shotgunHealth) {
                shadowOAM[i + 1].attr0 = (ROWMASK & 0) | ATTR0_SQUARE;
                shadowOAM[i + 1].attr1 = (COLMASK & (i * 8)) | ATTR1_TINY;
                shadowOAM[i + 1].attr2 = ATTR2_TILEID(1, 6);
            } else {
                shadowOAM[i + 1].attr0 |= ATTR0_HIDE;
            }
        }
        break;
    
    case MINIGUN:
        for (int i = 0; i < player.pistolHealth; i++) {
            if (i < player.shotgunHealth) {
                shadowOAM[i + 1].attr0 = (ROWMASK & 0) | ATTR0_SQUARE;
                shadowOAM[i + 1].attr1 = (COLMASK & (i * 8)) | ATTR1_TINY;
                shadowOAM[i + 1].attr2 = ATTR2_TILEID(1, 6);
            } else {
                shadowOAM[i + 1].attr0 |= ATTR0_HIDE;
            }
        }
        break;
    }
}