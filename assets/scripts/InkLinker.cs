using Godot;

public class InkLinker : Node {

	/*
		Ink to C#/Godot switchboard. 
		Binds external functions.
		Sets narrative variables from NarrativeData. 
	*/

	//where do we load narrative data? 
	//where is the narrative data object stored?
	//should narrative data be an autoload?
	//should the functions go in a different thing?
	//how does it get serialized 

	public static void LinkLoadedStory(InkPlayer player) {

		//TODO load from narrative data 

		//"Cannot assign to a variable that hasn't been declared in the story"
		//ok so need some kind of var header for all stories
		//and look at it here or something 
		//player.SetVariable("testVarName", "varValue");

		//cannot observe variable either, if not in the story
		//player.ObserveVariable("testVarName");

		LoadRelevantVariables(player);

		BindExternalFunctions(player);
	}



	//think we just have to call player.ObserveVariable(string name)
	//which returns the signal for when it's changed ?


	//so another way to do this can be, 
	//update all the variables when we load a file 
	//and on close a file, get all the variables, and save them 
	//and have other game logic.... get the ink variable itself? 
		//or when it asks the dictionary, it checks if an ink is running, and if it is, gets the variable value in that moment 
	
	




	//get the var names from plaintext.
	private static string[] PullScriptVariables(InkPlayer player) {


	}

	private static void LoadRelevantVariables(InkPlayer player) {

		//Look at the beginning of the file for the variables used here.
		//Load their stored values.

		


	}

	//Bind external ink functions, when present in a story, to their game counterparts. 
	private static void BindExternalFunctions(InkPlayer player) {

		//can't do this: 
		//player.BindExternalFunction("partyLeaderDouble", Party.CurrentCharacter().InkName);
		//TODO is it because of the chained call, or because CurrentCharacter could be null or change at runtime? 
		//best to avoid. 

		//can't seem to do functions that don't return string 
		//says wrong return type for int and bool 

		//final param is isLookaheadSafe 


		//THIS ONE WORKED
		//player.BindExternalFunction("partyLeader", Party.LeaderInkName, true);
		//just need to figure out how to call godot funcs instead
		
		//player.BindExternalFunction("partyLeader", Party.LeaderInkName, true);
		//player.BindExternalFunction("TestExternal", TestExternalFunc);
		//player.BindExternalFunction("TestExternal", InkLinker.TestExternalFunc, true);
		//player.BindExternalFunction("nickIsLeader", (Boolean)Party.LeaderIsNick, true);
		//player.BindExternalFunction("nourIsLeader", Party.LeaderIsNour, true);
		//player.BindExternalFunction("suwanIsLeader", Party.LeaderIsSuwan, true);
		
		//player.BindExternalFunction("partyLeader", Party.CurrentCharacter().InkName);

		/*story.BindExternalFunction("<ink_func_name>",self,"<godot_func_name>",bool)
	#player.BindExternalFunction("getPartyLeader","Party.CurrentCharacter().GetInkName();")
	#player.BindExternalFunction("partyLeader", (string name) => { Party.CurrentCharacter().GetInkName();})
	#player.BindExternalFunction("isNickLeader","Party.LeaderIsNick")
	#TODO*/
	}

	//From the values stored in NarrativeData, set any vars for this story file to the correct values.
	public static void SetVariableValues(InkPlayer player) {


		//TODO 

		//NarrativeData.InitStory(player);



	}

		//might need to return a string? says wrong return type 
	public static void TestExternalFunc() {
		GD.Print("external function called");
	}
	
}
