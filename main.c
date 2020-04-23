#include "myLib.h"
#include "game.h"
#include "sound.h"
#include "sounds/chaos.h"
#include "sounds/panic.h"
#include "assets/gwl_STARTBG1.h"
#include "assets/gwl_GUIDEBG1.h"
#include "assets/gwl_PAUSEBG.h"
#include "assets/gwl_GAMEBG1.h"
#include "assets/gwl_STAGE1.h"
#include "assets/gwl_BOSS.h"
#include "assets/gwl_WINBG1.h"
#include "assets/gwl_LOSEBG1.h"
#include "assets/gwl_SPRITES.h"

//function prototypes

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

//state stuff
int state;
enum {START, RULES, GAME, PAUSE, WIN, LOSE};

//button variables
unsigned short buttons;
unsigned short oldButtons;

//background offsets
extern unsigned short hOff;
extern unsigned short vOff;
extern int screenBlock;

//global variables
int seed;

/**
Completed: 
-The health / ammo system is complete.
-The basic enemy, the Beemon, is completed with a walking animation and hurt sprite. Walking pattern is done alongside dropping ammo upon their death.
-All player controls are in the game
-The first stage is done in terms of collision mapping and design (subject to minor changes and of course still rife with bugs)
-Music is completed. I don't know what compelled me to choose coconut mall and happy monkey circle but here we are. Arguably the easiest feature to add.
-Health Bar complete and fully functional. IMO it makes the game so much easier and really cancels out the misfire glitch/bug (where you press the button but no bullet fires)
 it's a very accurate depiction of your health too! There are actually two guns to play as: the pistol and the shotgun. Once both run out of ammo ur dead for good.
-Speaking of guns, the cheats are fully implemented! Minigun go brrrrrrrrrrrrrrrrrrrrrrrrrrrrrr. (It doesn't have a health bar because it has a lot of hp, not invincible tho)
 You lose by running out of ammo in both the pistol and the shotgun. THe minigun doesn't count.
-The boss is finished. He is known as H E A D M A N and he barfs up Beemons. You can kill the beemons for more ammo!
-The cheat is fully finished. The shotgun now has a spread pattern to make up for its low health and mobility.

Work in Progrss:

Bugs (friggin bugs):
-The XL backgorund can now be traversed freely back and forth, but a confusing bug happens when you jump dash and get displaced into screenblock 31 and die.
 This is a very confusing bug because idk what causes it to jump forward to SB 31 when this only happens when you jump dash backwards into a specific point on the map
-You can phase into collidable objects if you run into a wall and then jump
-Sometimes you fire invisible bullets that don't appear with their sprites


**/


int main() {

    initialize();

    while(1) {

        //update buttons
        oldButtons = buttons;
        buttons = BUTTONS;

        //State Machine
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
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    buttons = BUTTONS;
    oldButtons = 0;

    setupInterrupts();
    setupSounds();
    
    DMANow(3, gwl_SPRITESPal, SPRITEPALETTE, gwl_SPRITESPalLen / 2);
    DMANow(3, gwl_SPRITESTiles, &CHARBLOCK[4], gwl_SPRITESTilesLen / 2);

    hideSprites();

    REG_DISPCTL = MODE0 | BG0_ENABLE;

    goToStart();
}

void goToStart() {
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, gwl_STARTBG1Pal, PALETTE, gwl_STARTBG1PalLen / 2);
    DMANow(3, gwl_STARTBG1Tiles, &CHARBLOCK[0], gwl_STARTBG1TilesLen / 2);
    DMANow(3, gwl_STARTBG1Map, &SCREENBLOCK[28], gwl_STARTBG1MapLen / 2);
    seed = 0;
    state = START;
}

void start() {
    seed++;

    if (BUTTON_PRESSED(BUTTON_START)) {
        initGame();
        goToGame();
        srand(seed);
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToRules();
    }
}

void goToRules() {
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, gwl_GUIDEBG1Pal, PALETTE, gwl_GUIDEBG1PalLen / 2);
    DMANow(3, gwl_GUIDEBG1Tiles, &CHARBLOCK[0], gwl_GUIDEBG1TilesLen / 2);
    DMANow(3, gwl_GUIDEBG1Map, &SCREENBLOCK[28], gwl_GUIDEBG1MapLen / 2);
    state = RULES;
}

void rules() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToGame() {

    switch (stage) {
    case STAGE1:
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_8BPP | BG_SIZE_WIDE;

        DMANow(3, gwl_STAGE1Pal, PALETTE, gwl_STAGE1PalLen / 2);
        DMANow(3, gwl_STAGE1Tiles, &CHARBLOCK[0], gwl_STAGE1TilesLen / 2);
        DMANow(3, gwl_STAGE1Map, &SCREENBLOCK[28], gwl_STAGE1MapLen / 2);
        break;

    
    case BOSS:
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_4BPP | BG_SIZE_WIDE;

        DMANow(3, gwl_BOSSPal, PALETTE, gwl_BOSSPalLen / 2);
        DMANow(3, gwl_BOSSTiles, &CHARBLOCK[0], gwl_BOSSTilesLen / 2);
        DMANow(3, gwl_BOSSMap, &SCREENBLOCK[28], gwl_BOSSMapLen / 2);
    }


    state = GAME;
}

void game() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    }
    if (player.pistolHealth <= 0 && player.shotgunHealth <= 0) { // if both your pistol and shotgun run out of ammo, it's game over!
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
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, gwl_PAUSEBGPal, PALETTE, gwl_PAUSEBGPalLen / 2);
    DMANow(3, gwl_PAUSEBGTiles, &CHARBLOCK[0], gwl_PAUSEBGTilesLen / 2);
    DMANow(3, gwl_PAUSEBGMap, &SCREENBLOCK[28], gwl_PAUSEBGMapLen / 2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    state = PAUSE;
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSound();
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    hideSprites();

    waitForVBlank();

    DMANow(3, &shadowOAM, OAM, 512);
}

void goToWin() {

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, gwl_WINBG1Pal, PALETTE, gwl_WINBG1PalLen / 2);
    DMANow(3, gwl_WINBG1Tiles, &CHARBLOCK[0], gwl_WINBG1TilesLen / 2);
    DMANow(3, gwl_WINBG1Map, &SCREENBLOCK[28], gwl_WINBG1MapLen / 2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = WIN;
}

void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    hideSprites();

    waitForVBlank();

    DMANow(3, &shadowOAM, OAM, 512);
}

void goToLose() {
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, gwl_LOSEBG1Pal, PALETTE, gwl_LOSEBG1PalLen / 2);
    DMANow(3, gwl_LOSEBG1Tiles, &CHARBLOCK[0], gwl_LOSEBG1TilesLen / 2);
    DMANow(3, gwl_LOSEBG1Map, &SCREENBLOCK[28], gwl_LOSEBG1MapLen / 2);
    state = LOSE;
}

void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    hideSprites();
    waitForVBlank();
    DMANow(3, &shadowOAM, OAM, 512);
}

