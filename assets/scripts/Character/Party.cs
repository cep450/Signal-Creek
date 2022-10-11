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
	public enum CharacterIndex {
		NICK = 0,
		NOIR = 1,
		SUWAN = 2,
	}
	
	Character NICK, NOIR, SUWAN;
	Character [] Characters = {NICK, NOIR, SUWAN};
	int currentCharIndex = CharacterIndex.NICK;
	
	//if we ever want the character being controlled to move on their own or not be able to move- just remember to turn it back on afterwards
	public bool acceptMovementInput = true; 

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
		currentCharIndex = CharacterIndex.NICK;
		//TODO
	}
	public void SwitchCharNoir() {
		currentCharIndex = CharacterIndex.NOIR;
		//TODO
	}
	public void SwitchCharSuwan() {
		currentCharIndex = CharacterIndex.SUWAN;
		//TODO
	}
	

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
