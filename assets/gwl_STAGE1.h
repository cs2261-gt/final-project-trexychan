
//{{BLOCK(gwl_STAGE1)

//======================================================================
//
//	gwl_STAGE1, 1024x256@8, 
//	+ palette 256 entries, not compressed
//	+ 507 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x32 
//	Total size: 512 + 32448 + 8192 = 41152
//
//	Time-stamp: 2020-04-14, 17:54:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GWL_STAGE1_H
#define GRIT_GWL_STAGE1_H

#define gwl_STAGE1TilesLen 32448
extern const unsigned short gwl_STAGE1Tiles[16224];

#define gwl_STAGE1MapLen 8192
extern const unsigned short gwl_STAGE1Map[4096];

#define gwl_STAGE1PalLen 512
extern const unsigned short gwl_STAGE1Pal[256];

#endif // GRIT_GWL_STAGE1_H

//}}BLOCK(gwl_STAGE1)
