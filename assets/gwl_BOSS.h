
//{{BLOCK(gwl_BOSS)

//======================================================================
//
//	gwl_BOSS, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 209 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 6688 + 4096 = 11296
//
//	Time-stamp: 2020-04-15, 13:02:22
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GWL_BOSS_H
#define GRIT_GWL_BOSS_H

#define gwl_BOSSTilesLen 6688
extern const unsigned short gwl_BOSSTiles[3344];

#define gwl_BOSSMapLen 4096
extern const unsigned short gwl_BOSSMap[2048];

#define gwl_BOSSPalLen 512
extern const unsigned short gwl_BOSSPal[256];

#endif // GRIT_GWL_BOSS_H

//}}BLOCK(gwl_BOSS)
