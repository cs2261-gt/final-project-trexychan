SOUND soundA;
SOUND soundB;

#define SOUND_FREQ 11025

void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSound();
void unpauseSound();
void stopSound();

void setupInterrupts();
void interruptHandler();
