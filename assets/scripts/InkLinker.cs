using Godot;

public class InkLinker : Node {

	/*
		Ink to C#/Godot switchboard. 
		Binds external functions.
		Sets narrative variables from NarrativeData. 
	*/

	//Bind external ink functions, when present in a story, to their game counterparts. 
	public static void BindExternalFunctions(InkPlayer player) {
		GD.Print("read this too");
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
	//player.BindExternalFunction("TestExternal", player, "TestExternalFunc");
	}

	//From the values stored in NarrativeData, set any vars for this story file to the correct values.
	public static void SetVariableValues(InkPlayer player) {


		//TODO 

		NarrativeData.InitStory(player);



	}

		//might need to return a string? says wrong return type 
	public static void TestExternalFunc() {
		GD.Print("external function called");
	}
	
}
