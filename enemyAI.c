
#include "game.h"
#include "myLib.h"

//This is where all enemy update / animation logic is stored to prevent game.c from bein three miles long
extern unsigned short vOff;
extern unsigned short hOff;
extern int playerHOff;

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

void animateBoss(ENEMY *e) {
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
        if (e->timer >= 50) {
            e->timer = 0;
            e->state = BOSSIDLE;
        }
        e->timer++;
        e->frameCounter++;
    }
}

void drawBeemon(ENEMY *e, int i) {
    shadowOAM[i + MINIGUN_MAX + 1].attr0 = e->screenRow | ATTR0_SQUARE;
    shadowOAM[i + MINIGUN_MAX + 1].attr1 = e->screenCol | ATTR1_SMALL;
    shadowOAM[i + MINIGUN_MAX + 1].attr2 = ATTR2_TILEID((e->state) * 2, (e->curFrame + 4) * 2);

}

void drawBoss(ENEMY *e, int i) {
    shadowOAM[i + MINIGUN_MAX + 1].attr0 = e->screenRow | ATTR0_SQUARE;
    shadowOAM[i + MINIGUN_MAX + 1].attr1 = e->screenCol | ATTR1_LARGE;
    shadowOAM[i + MINIGUN_MAX + 1].attr2 = ATTR2_TILEID((e->state + 2) * 8, e->curFrame * 8);
}

void updateBeemon(ENEMY *e, LEVEL level) {
    if (e->state == BEEMONRIGHT) {
        e->worldCol += e->hspd;
    }
    if (e->state == BEEMONLEFT) {
        e->worldCol -= e->hspd;
    }

    if (collision(e->worldCol, e->worldRow, e->width, e->height, player.worldCol, SHIFTDOWN(player.worldRow), player.width, player.height) && player.iFrameCounter == 0) {
        player.health -= e->damage;
        player.iFrameCounter = IFRAMES;
    }

    for (int b = 0; b < MINIGUN_MAX; b++) {
        if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - 1 <= 0) {
            //death logic
            
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

    e->screenRow = e->worldRow - vOff;
    e->screenCol = e->worldCol - playerHOff;
}

void updateBoss(ENEMY *e, LEVEL level) {
    for (int b = 0; b < MINIGUN_MAX; b++) {
        if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health - 1 <= 0) {
            //death logic
            bossDefeated = 1;
            e->alive = 0;
            bullets[b].active = 0;
        } else if (bullets[b].active && collision(bullets[b].worldCol, bullets[b].worldRow, bullets[b].width, bullets[b].height, e->worldCol, e->worldRow, e->width, e->height) && e->health > 0) {
            //onhit logic
            e->health -= bullets[b].bulletType;
            bullets[b].active = 0;
        }
    }
    e->screenRow = e->worldRow - vOff;
    e->screenCol = e->worldCol - playerHOff;
}