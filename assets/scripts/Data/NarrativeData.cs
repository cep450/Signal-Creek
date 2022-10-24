using Godot;
using System.Collections.Generic;

public class NarrativeData : Resource {
	
	/*

		Where variables live so they can persist across ink files.

		Will be saved by the SaveManager. 

	*/

	static Dictionary<string, string> inkVars;
	//TODO data: strings, what? can it be multiple? what does a normal hashmap use 
	//is there a vers of this in godot 

	//TODO could also store names here if we use that.


	//TODO THIS WILL NEED A VARIABLE LISTENER!!!!! 


	//TODO let it automatically read vars from files? or pull from some kind of ink reference file. 
	//def do the ink reference file. 

	//When starting up the game, regardless of if a save file exists, create the dictionary from the variable names in the base ink functions/vars file.
	public static void InitFromFile() {




	}

	//When starting up the game, set variables from what SaveManager gives us 
	public static void LoadSaveData(/* save info passed from save manager */) {




	}

	//When we open a story file, set its variables to their actual values. 
	//Also, link the variable listener.
	public static void InitStory(InkPlayer player) {




	}




	//TODO how and where to store this name stuff?
	//TODO cap sensitive or not? 
	/*
	public void SetName(string charName) {
		
	}
	public void SetName(string speaker, string charName) {
		
	}
	public void Name(string character) {
		
	}
	public void Name(string speaker, string character) {
		
	}*/

}
