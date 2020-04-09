//macros

//logistical macros
#define FPS 12
#define GRAVITY 2
#define IFRAMES 50

//weapon constants
#define PISTOL_MAX 9
#define SHOTGUN_MAX 2
#define MINIGUN_MAX 50
#define PISTOL_FIRERATE 20
#define SHOTGUN_FIRERATE 400
#define MINIGUN_FIRERATE 10

//STAGE SPECIFIC MACROS

//stage 1
#define ENEMYCOUNT_STAGE1 1
#define LOOTCOUNT_STAGE1 1
#define STAGE1_MAPWIDTH 1024
#define STAGE1_MAPHEIGHT 256

//enums
enum {PISTOL, SHOTGUN, MINIGUN}; // GUN TYPES
enum {BEEMON}; // ENEMY TYPES
enum {GUNRIGHT, GUNLEFT, GUNJUMPR, GUNJUMPL, GUNIDLE};
enum {ENEMYRIGHT=(GUNIDLE+1), ENEMYLEFT, ENEMYIDLE}; // ENEMY STATES
enum {STAGE1, STAGE2, BOSS}; // STAGES

//structs
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
    int jumping; // 1 for currently jumping/falling, 0 for not
    int curFrame;
    int numFrames;
    int state;
    int prevState;
    int frameCounter;
    int airTime; // this is to track how many seconds the player is in the air for
    int dashTime; // tracks how long player is dashing for
    int fireTimer;
    int dash; // 1 for currently in a dash, 0 for not
    int fireRate; // how many frames till the gun can fire again
    int health; // HEALTH IS ALSO AMMO COUNT
    int iFrameCounter; //if hit, this will count down till 0, during this time the player cannot take additional damage
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
    int destroyed; // 1 if the bullet has hit a barrier or enemy and has been destroyed, or 0 if not
    int spd;
    int state;
} BULLET;

//function prototypes

//  init functions
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


//  update functions
void updateGame();
void updatePlayer();
void updateEnemies();
void updateEnemy(ENEMY *);
void updateBullets();
void updateBullet(BULLET *);
void updateLootBox();

//  drawing functions
void drawGame();
void drawPlayer();
void drawEnemies();
void drawBullets();
void drawLootBox();


//  animation functions
void animatePlayer();
void animateEnemy(ENEMY *);


//variables
extern PLAYER player;
extern BULLET pistolMag[PISTOL_MAX];
extern BULLET shotgunMag[SHOTGUN_MAX];
extern BULLET minigunMag[MINIGUN_MAX];
extern int playerHealth;
extern int stage;
extern ENEMY s1Enemies[];
extern LOOTBOX s1Loot[];
