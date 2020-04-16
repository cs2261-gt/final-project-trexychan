
//{{BLOCK(collmap)

//======================================================================
//
//	collmap, 1024x256@4, 
//	+ palette 256 entries, not compressed
//	+ 18 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x32 
//	Total size: 512 + 576 + 8192 = 9280
//
//	Time-stamp: 2020-04-13, 01:47:51
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_COLLMAP_H
#define GRIT_COLLMAP_H

#define collmapTilesLen 576
extern const unsigned short collmapTiles[288];

#define collmapMapLen 8192
extern const unsigned short collmapMap[4096];

#define collmapPalLen 512
extern const unsigned short collmapPal[256];

#endif // GRIT_COLLMAP_H

//}}BLOCK(collmap)
