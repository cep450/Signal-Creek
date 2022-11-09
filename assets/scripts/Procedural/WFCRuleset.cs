using Godot;
using System;

public class WFCRuleset : Resource
{
	
	/*
		Knows the relationships between tiles. 
		Used by WFC to generate. 
		Also knows what Objects might generate on what tiles.
	*/
	
	//Supports multiple tilesets operating under the same rules, for different characters' dreamworlds bleeding into each other and generated live.
	//If using 1 tileset, defaults to [0]
	//If using one for each character, indices are the same as character indices.
	//Additional tilesets go after the first 3 character indices. 
	TileSet [] tileSets;
	
}
