using Godot;
using System;

public class Party : Node2D
{
	/*
		The party of all 3 characters. 
		Keeps track of who's active.
		Processes input and delivers to the correct char
	*/
	
	//Use for readability. 
	static int indexNICK = 0;
	static int indexNOIR = 1;
	static int indexSUWAN = 2;
	
	static Character NICK, NOIR, SUWAN;
	static Character [] Characters = {NICK, NOIR, SUWAN};
	static int currentCharIndex = indexSUWAN;
	
	//if we ever want the character being controlled to move on their own or not be able to move- just remember to turn it back on afterwards
	public static bool acceptMovementInput = true; 

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}
	
	public Character CurrentCharacter() {
		return Characters[currentCharIndex];
	}
	
	public void SwitchCharLeft() {
		//TODO 
	}
	public void SwitchCharRight() {
		//TODO
	}
	public void SwitchCharNick() {
		currentCharIndex = indexNICK;
		//TODO
	}
	public void SwitchCharNoir() {
		currentCharIndex = indexNOIR;
		//TODO
	}
	public void SwitchCharSuwan() {
		currentCharIndex = indexSUWAN;
		//TODO
	}
	

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
