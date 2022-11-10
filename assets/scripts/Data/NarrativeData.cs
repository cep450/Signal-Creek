using Godot;
using System.Collections.Generic;

public class NarrativeData : Resource {
	
	/*

		Data object where variables live so they can persist across ink files.

		Updated and read by the VariableObserver.
		Saved and loaded by the SaveManager.

	*/

	static Dictionary<string, Ink.Runtime.Object> inkVars;

	public void LoadVariableValues() {

	}

	public void BeginObserving() {
		
	}

	//start listening to this file (when file opens)
	//TODO do this via an event 
	/*
	public void StartListening(InkPlayer player) {
		//tell the story to call this when a var changes
		player.variablesState.variableChangedEvent += VariableChanged;
	}

	//stop listening to this file (when file closes)
	//TODO do via an event 
	public void StopListening(InkPlayer player) {
		player.variablesState.variableChangedEvent -= VariableChanged;
	}

	//Called when a var gets changed in ink 
	private void VariableChanged(string varName, Ink.Runtime.Object value) {

	}
	*/


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

}
