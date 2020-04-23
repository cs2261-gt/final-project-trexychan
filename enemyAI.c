
#include "game.h"
#include "myLib.h"
#include "sound.h"

//This is where all enemy update / animation logic is stored to prevent game.c from bein three miles long
extern unsigned short vOff;
extern unsigned short hOff;
extern int playerHOff;
extern int activeBullets;

int headManFireRate = 19;

void animateBeemon(ENEMY *e) {
    if (e->state == BEEMONLEFT || e->state == BEEMONRIGHT) {
        if (e->frameCounter % FPS == 0) {
            e->curFrame = (e->curFrame + 1) % e->numFrames;
        }

        //switch movement direction after a time
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

void animateHeadMan(ENEMY *e) {
    if (e->state == BOSSIDLE) {
        if (e->frameCounter % FPS == 0) {
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
        if (e->frameCounter % FPS == 0) {
            e->curFrame = (e->curFrame + 1) % e->numFrames;
        }
        if (e->timer >= 60) {
            e->timer = 0;
            e->state = BOSSIDLE;
        }
        e->timer++;
        e->frameCounter++;
    }
}

void animateBeellet(ENEMY *e) {
    if (e->frameCounter % FPS == 0) {
        e->curFrame = (e->curFrame + 1) % e->numFrames;
    }
    e->frameCounter++;
}

void animateRatTank(ENEMY *e) {
    if (e->frameCounter % FPS == 0) {
        e->curFrame = (e->curFrame + 1) % e->numFrames;
    }
    e->frameCounter++;
}

void drawBeemon(ENEMY *e, int i) {
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr0 = (ROWMASK & e->screenRow) | ATTR0_SQUARE;
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr1 = (COLMASK & e->screenCol) | ATTR1_SMALL;
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr2 = ATTR2_TILEID((e->state) * 2, (e->curFrame + 4) * 2);

}

void drawHeadMan(ENEMY *e, int i) {
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr0 = (ROWMASK & e->screenRow) | ATTR0_SQUARE;
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr1 = (COLMASK & e->screenCol) | ATTR1_LARGE;
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr2 = ATTR2_TILEID((e->state + 2) * 8, e->curFrame * 8);
}

void drawBeellet(ENEMY *e, int i) {
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr0 = (ROWMASK & e->screenRow) | ATTR0_SQUARE;
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr1 = (COLMASK & e->screenCol) | ATTR1_SMALL;
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr2 = ATTR2_TILEID((e->state) * 2, (e->curFrame + 4) * 2);
}

void drawRatTank(ENEMY *e, int i) {
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr0 = (ROWMASK & e->screenRow) | ATTR0_WIDE;
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr1 = (COLMASK & e->screenCol) | ATTR1_MEDIUM;
    shadowOAM[i + player.pistolHealth + activeBullets + 1].attr2 = ATTR2_TILEID(e->state * 4, (e->curFrame + 8) * 2);
}

void drawCrate(ENEMY *e, int i) {
    if (e->state == CRATEFULL) {
        shadowOAM[i + player.pistolHealth + activeBullets + 1].attr0 = (ROWMASK & e->screenRow) | ATTR0_SQUARE;
        shadowOAM[i + player.pistolHealth + activeBullets + 1].attr1 = (COLMASK & e->screenCol) | ATTR1_SMALL;
        shadowOAM[i + player.pistolHealth + activeBullets + 1].attr2 = ATTR2_TILEID(0, 7);
    } else if (e->state == CRATEDMG) {
        shadowOAM[i + player.pistolHealth + activeBullets + 1].attr0 = (ROWMASK & e->screenRow) | ATTR0_SQUARE;
        shadowOAM[i + player.pistolHealth + activeBullets + 1].attr1 = (COLMASK & e->screenCol) | ATTR1_SMALL;
        shadowOAM[i + player.pistolHealth + activeBullets + 1].attr2 = ATTR2_TILEID(0, 9);
    }
}

void updateBeemon(ENEMY *e, LEVEL level) {
    if (e->state == BEEMONRIGHT) {
        e->worldCol += e->hspd;
    }
    if (e->state == BEEMONLEFT) {
        e->worldCol -= e->hspd;
    }

    if (collision(e->worldCol, e->worldRow, e->width, e->height, player.worldCol, SHIFTDOWN(player.worldRow), player.width, player.height) && player.iFrameCounter == 0) {
        if (player.gunType == PISTOL) {
            player.pistolHealth -= e->damage;
        } else if (player.gunType == SHOTGUN) {
            player.shotgunHealth--;
        } else if (player.gunType == MINIGUN) {
            player.minigunHealth -= e->damage;
        }
        player.iFrameCounter = IFRAMES;
    }

    for (int b = 0; b < MAXBULLETS; b++) {
        if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - bullets[b].bulletType <= 0) {
            //death logic
            
            e->alive = 0;
            bullets[b].active = 0;
            if (bullets[b].bulletType == SHOTGUN) {
                player.shotgunHealth = SHOTGUN_MAX;
            }

            switch (stage)
            {
            case STAGE1:
                dropLoot(e, level, s1Loot);
                break;
            
            case BOSS:
                dropLoot(e, level, bossLoot);
                break;
            }
        } else if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - bullets[b].bulletType > 0) {
            //onhit logic
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
}

void updateHeadMan(ENEMY *e, LEVEL level) {

    for (int b = 0; b < MAXBULLETS; b++) {
        if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - bullets[b].bulletType <= 0) {
            //death logic
            bossDefeated = 1;
            e->alive = 0;
            bullets[b].active = 0;
        } else if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - bullets[b].bulletType > 0) {
            //onhit logic
            e->health -= bullets[b].bulletType;
            bullets[b].active = 0;
        }
    }

    if (e->hitStun >= 57 ) {
        e->vspd = -(e->vspd);
        e->hitStun = 0;
    }

    if (e->state == BOSSIDLE) {
        e->hitStun++;
        e->worldRow += e->vspd;
    } else if (e->state == BOSSATTACK &&  e->timer % headManFireRate == 0) {
        spawnBeellet(bossEnemies, level, &bossEnemies[0]);
    }
}

void updateBeellet(ENEMY *e, LEVEL level) {

    if (e->worldCol < 0) {
        e->alive = 0;
    }
    if (collision(e->worldCol, e->worldRow, e->width, e->height, player.worldCol, SHIFTDOWN(player.worldRow), player.width, player.height) && player.iFrameCounter == 0) {
        if (player.gunType == PISTOL) {
            player.pistolHealth -= e->damage;
        } else if (player.gunType == SHOTGUN) {
            player.shotgunHealth--;
        } else if (player.gunType == MINIGUN) {
            player.minigunHealth -= e->damage;
        }
        player.iFrameCounter = IFRAMES;
    }

    for (int b = 0; b < MAXBULLETS; b++) {
        if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - bullets[b].bulletType <= 0) {
            //death logic
            e->alive = 0;
            bullets[b].active = 0;
            if (bullets[b].bulletType == SHOTGUN) {
                player.shotgunHealth = SHOTGUN_MAX;
            }
            switch (stage)
            {
            case STAGE1:
                dropLoot(e, level, s1Loot);
                break;
            
            case BOSS:
                dropLoot(e, level, bossLoot);
                break;
            }
        }
    }

    e->worldCol += e->hspd;
}

void updateRatTank(ENEMY *e, LEVEL level) {
    for (int b = 0; b < MAXBULLETS; b++) {
        if (bullets[b].active && bullets[b].bulletType != TANKBULLET && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - bullets[b].bulletType <= 0) {
            //death logic
            e->alive = 0;
            bullets[b].active = 0;
            if (bullets[b].bulletType == SHOTGUN) {
                player.shotgunHealth = SHOTGUN_MAX;
            }
            switch (stage) {
            case STAGE1:
                dropLoot(e, level, s1Loot);
                break;
            
            case BOSS:
                dropLoot(e, level, bossLoot);
                break;
            }
        } else if (bullets[b].active && bullets[b].bulletType != TANKBULLET && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - bullets[b].bulletType > 0) {
            //onhit logic
            e->health -= bullets[b].bulletType;
            bullets[b].active = 0;
        }
    }

    if (player.worldCol > e->worldCol) {
        e->state = TANKRIGHT;
    } else if (player.worldCol <= e->worldCol) {
        e->state = TANKLEFT;
    }
    if (SHIFTDOWN(player.worldRow) == e->worldRow && e->timer >= 100) {
        e->timer = 0;
        fire(RATTANK, e);
    }

    e->timer++;
}

void updateCrate(ENEMY *e, LEVEL level) {
    for (int b= 0; b < MAXBULLETS; b++) {
        if (bullets[b].active && bullets[b].bulletType == SHOTGUN && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->state == CRATEDMG) {
            e->alive = 0;
            bullets[b].active = 0;
            if (bullets[b].bulletType == SHOTGUN) {
                player.shotgunHealth = SHOTGUN_MAX;
            }
            switch (stage) {
            case STAGE1:
                dropLoot(e, level, s1Loot);
                break;
            
            case BOSS:
                dropLoot(e, level, bossLoot);
                break;
            }
        } else if (bullets[b].active && bullets[b].bulletType == SHOTGUN && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->state == CRATEFULL) {
            e->state = CRATEDMG;
            bullets[b].active = 0;
        }
    }
}

void spawnBeellet(ENEMY enemies[], LEVEL level, ENEMY *boss) {
    for (int i = 1; i < level.enemies; i++) {
        if (!(enemies[i].alive)) {
            enemies[i].worldCol = boss->worldCol;
            enemies[i].worldRow = boss->worldRow + (boss->height / 2);
            enemies[i].damage = 2;
            enemies[i].state = BEEMONLEFT;
            enemies[i].hspd = -2;
            enemies[i].alive = 1;
            break;
        }
    }
}