//macros

//logistical macros
#define FPS 12
#define GRAVITY 100
#define JUMPPOWER 1700
#define SHIFTUP(num) ((num) << 8)
#define SHIFTDOWN(num) ((num) >> 8)
#define IFRAMES 50

//weapon constants
#define PISTOL_MAX 9
#define SHOTGUN_MAX 2
#define SHOTGUN_PELLETS 3
#define MINIGUN_MAX 50
#define MAXBULLETS 30
#define PISTOL_FIRERATE 20
#define SHOTGUN_FIRERATE 50
#define MINIGUN_FIRERATE 2

//STAGE SPECIFIC MACROS

//stage 1
#define ENEMYCOUNT_STAGE1 5
#define LOOTCOUNT_STAGE1 5
#define STAGE1_MAPWIDTH 1024
#define STAGE1_MAPHEIGHT 256
#define STAGE1_SPAWNCOL 20
#define STAGE1_SPAWNROW ((SCREENHEIGHT) / (2))

//boss
#define ENEMYCOUNT_BOSS 13
#define LOOTCOUNT_BOSS 13
#define BOSS_MAPWIDTH 512
#define BOSS_MAPHEIGHT 256
#define BOSS_SPAWNCOL 20
#define BOSS_SPAWNROW 16

//enums
enum {PISTOL=2, SHOTGUN=4, MINIGUN=5}; // GUN TYPES
enum {gun0, gun1, gun2}; // guns in the scroll wheel
enum {BEEMON, HEADMAN, BEELLET, RATTANK, CRATE, TANKBULLET}; // ENEMY TYPES
enum {GUNRIGHT=1, GUNLEFT, GUNJUMPR, GUNJUMPL, GUNIDLE};
enum {BEEMONRIGHT=1, BEEMONLEFT, BEEMONHITR, BEEMONHITL}; // ENEMY STATES
enum {BOSSIDLE, BOSSATTACK}; // BOSS
enum {TANKLEFT, TANKRIGHT, TANKATTACK, TANKIDLE};
enum {CRATEFULL=1, CRATEDMG};
enum {STAGE1, BOSS}; // STAGES

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
    int jumping;
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
    int pistolHealth; // HEALTH IS ALSO AMMO COUNT
    int shotgunHealth;
    int minigunHealth;
    int currentHealth; //the health of the gun you are currently using
    int iFrameCounter; //if hit, this will count down till 0, during this time the player cannot take additional damage
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
    int hitStun; //separate timer to track how long the enemy is stunned for after being hit
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
    int destroyed; // 1 if the bullet has hit a barrier or enemy and has been destroyed, or 0 if not
    int hspd;
    int vspd;
    int state;
} BULLET;

//function prototypes

//  init functions
void initGame();
void initLevels();
void initPlayer(LEVEL);
void initHealthBar();
void initEnemies(LEVEL, ENEMY enemies[], int enemySpawns[], int enemyTypes[]);
void initEnemy(ENEMY *, LEVEL);
void initBullets();
void initBullet(BULLET *);
void fire(int src, ENEMY *); // src is who is firing the bullet 1 for player 0 for enemy
void dropLoot(ENEMY *, LEVEL, LOOTBOX pickups[]);
void initLootBoxes();


//  update functions
void updateGame();
void updatePlayer(unsigned short collisionMap[], int levelHeight, int levelWidth);
void updateEnemies(ENEMY enemies[], LEVEL);
void updateEnemy(ENEMY *, LEVEL);
void updateBullets();
void updateBullet(BULLET *);
void updateLootBox(LOOTBOX pickups[], LEVEL);
void changeLevel();

//  drawing functions
void drawGame();
void drawPlayer();
void drawEnemies(LEVEL, ENEMY enemies[]);
void drawBullets();
void drawLootBox(LOOTBOX pickups[], LEVEL);
void drawHealthBar();


//  animation functions
void animatePlayer();
void animateEnemy(ENEMY *);


//variables
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


//enemyAI.c stuff
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

