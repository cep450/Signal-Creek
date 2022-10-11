using Godot;
using System;

public class Party : Node2D
{
	/*
		The party of all 3 characters. 
		Keeps track of who's active 
		Processes input and delivers to the correct char
	*/
	
	Character NICK, NOIR, SUWAN;
	Character [] = {NICK, NOIR, SUWAN};
	int currentCharIndex = 0;
	
	//if we ever want the character being controlled to move on their own or not be able to move- just remember to turn it back on afterwards
	public bool acceptMovementInput = true; 

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}
	
	public Character CurrentCharacter() {
		
	}
	
	public void SwitchCharLeft() {
		
	}
	public void SwitchCharRight() {
		
	}
	public void SwitchCharNick() {
		//TODO
	}
	public void SwitchCharNoir() {
		//TODO
	}
	public void SwitchCharSuwan() {
		//TODO
	}
	

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
