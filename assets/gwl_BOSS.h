
//{{BLOCK(gwl_BOSS)

//======================================================================
//
//	gwl_BOSS, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 243 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 7776 + 4096 = 12384
//
//	Time-stamp: 2020-04-22, 17:49:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GWL_BOSS_H
#define GRIT_GWL_BOSS_H

#define gwl_BOSSTilesLen 7776
extern const unsigned short gwl_BOSSTiles[3888];

#define gwl_BOSSMapLen 4096
extern const unsigned short gwl_BOSSMap[2048];

#define gwl_BOSSPalLen 512
extern const unsigned short gwl_BOSSPal[256];

#endif // GRIT_GWL_BOSS_H

//}}BLOCK(gwl_BOSS)
