using Godot;
using System;

public class Party : Node2D
{
	/*
		The party of all 3 characters. 
		Keeps track of who's active.
		Processes input and delivers to the correct char.
	*/
	
	//Use for readability. 
	static int indexNICK = 0;
	static int indexNOUR = 1;
	static int indexSUWAN = 2;
	
	static Character NICK, NOUR, SUWAN;
	static Character [] Characters = {NICK, NOUR, SUWAN};
	static int currentCharIndex = indexSUWAN;
	
	//if we ever want the character being controlled to move on their own or not be able to move- just remember to turn it back on afterwards
	public static bool acceptMovementInput = true; 

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}
	
	public static Character CurrentCharacter() {
		return Characters[currentCharIndex];
	}

	
	public static void SwitchCharLeft() {
		//TODO 
	}
	public static void SwitchCharRight() {
		//TODO
	}
	public static void SwitchCharNick() {
		currentCharIndex = indexNICK;
		//TODO
	}
	public static void SwitchCharNoir() {
		currentCharIndex = indexNOUR;
		//TODO
	}
	public static void SwitchCharSuwan() {
		currentCharIndex = indexSUWAN;
		//TODO
	}


	
//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }

	//USEFUL FOR INK 
	public static bool LeaderIsNick() { return currentCharIndex == indexNICK; }
	public static bool LeaderIsNour() { return currentCharIndex == indexNOUR; }
	public static bool LeaderIsSuwan() { return currentCharIndex == indexSUWAN; }
	public static string LeaderInkName() { return CurrentCharacter().InkName(); }
}
