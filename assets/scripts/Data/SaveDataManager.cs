using Godot;
using System;

public class SaveDataManager
{

	static NarrativeData narrativeData;

	//use godot's resource loader https://docs.godotengine.org/en/stable/classes/class_resourceloader.html
	
	public SaveDataManager() {
		GD.Print("called constructor for save data manager");
	}

	//Called on globalvars init, so, when the game loads 
	public static void Load() {
		GD.Print("hello from Load()");
		narrativeData = new NarrativeData();
		//TODO load into narrative data. 
		//Give a reference to global var storage. 
		///////Globals.narrativeData = narrativeData;
		//TODO 
	}

	//Called when the game closes. Write save data to disk.
	public static void Save() {
		GD.Print("hello from Save()");
		//TODO 
	}

	//we should save 
	// narrative data 
	// globals 
	// the party


}
