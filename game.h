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
#define MINIGUN_MAX 70
#define PISTOL_FIRERATE 20
#define SHOTGUN_FIRERATE 400
#define MINIGUN_FIRERATE 10

//STAGE SPECIFIC MACROS

//stage 1
#define ENEMYCOUNT_STAGE1 3
#define LOOTCOUNT_STAGE1 ((ENEMYCOUNT_STAGE1) + (1))
#define STAGE1_MAPWIDTH 1024
#define STAGE1_MAPHEIGHT 256
#define STAGE1_SPAWNCOL 20
#define STAGE1_SPAWNROW (SCREENHEIGHT / 2)

//boss
#define ENEMYCOUNT_BOSS 10
#define LOOTCOUNT_BOSS 10
#define BOSS_MAPWIDTH 512
#define BOSS_MAPHEIGHT 256
#define BOSS_SPAWNCOL 20
#define BOSS_SPAWNROW 16

//enums
enum {PISTOL=2, SHOTGUN=2*6, MINIGUN=5}; // GUN TYPES
enum {BEEMON}; // ENEMY TYPES
enum {GUNRIGHT=1, GUNLEFT, GUNJUMPR, GUNJUMPL, GUNIDLE};
enum {BEEMONRIGHT=1, BEEMONLEFT, BEEMONHITR, BEEMONHITL}; // ENEMY STATES
enum {BOSSIDLE, BOSSATTACK}; // BOSS
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
    int health; // HEALTH IS ALSO AMMO COUNT
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
    int spd;
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
void fire();
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


//  animation functions
void animatePlayer();
void animateEnemy(ENEMY *);


//variables
extern PLAYER player;
extern BULLET bullets[MINIGUN_MAX];
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


//enemyAI.c stuff
void animateBeemon(ENEMY *);
void animateBoss(ENEMY *);

void drawBeemon(ENEMY *, int index);
void drawBoss(ENEMY *, int index);

void updateBeemon(ENEMY *, LEVEL level);
void updateBoss(ENEMY *, LEVEL level);

