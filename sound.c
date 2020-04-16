#include "myLib.h"
#include "sound.h"

void setupSounds() {
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                    DSA_OUTPUT_RATIO_100 |
                    DSA_OUTPUT_TO_BOTH |
                    DSA_TIMER0 |
                    DSA_FIFO_RESET |
                    DSB_OUTPUT_RATIO_100 |
                    DSB_OUTPUT_TO_BOTH |
                    DSB_TIMER1 |
                    DSB_FIFO_RESET;

    REG_SOUNDCNT_L = 0;
}