
//{{BLOCK(gwl_PAUSEBG)

//======================================================================
//
//	gwl_PAUSEBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 228 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7296 + 2048 = 9856
//
//	Time-stamp: 2020-04-07, 16:04:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GWL_PAUSEBG_H
#define GRIT_GWL_PAUSEBG_H

#define gwl_PAUSEBGTilesLen 7296
extern const unsigned short gwl_PAUSEBGTiles[3648];

#define gwl_PAUSEBGMapLen 2048
extern const unsigned short gwl_PAUSEBGMap[1024];

#define gwl_PAUSEBGPalLen 512
extern const unsigned short gwl_PAUSEBGPal[256];

#endif // GRIT_GWL_PAUSEBG_H

//}}BLOCK(gwl_PAUSEBG)
