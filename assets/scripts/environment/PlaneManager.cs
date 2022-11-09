using Godot;
using System;

public class PlaneManager : Node
{
	
	/*
		Porting the plane manager to C# for performance.
		Based on Max's original prototype.
		Will handle different types of transitions.
	*/
	
	bool isDream = false;
	
	// Declare member variables here. Examples:
	// private int a = 2;
	// private string b = "text";

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}
	
	
	//Being told to switch to a specific plane.
	//Safeguards for already being in that plane.
	public void ShiftDream() {
		if(isDream) {
			//TODO already in dream world
		} else {
			TransitionDream();
		}
	}
	public void ShiftReal() {
		if(!isDream) {
			//TODO already in real world
		} else {
			TransitionReal();
		}
	}
	public void ShiftToggle() {
		if(isDream) {
			ShiftReal();
		} else {
			ShiftDream();
		}
	}
	
	//actually switch worlds. 
	void TransitionDream() {
		//TODO for now, falling back to gdscript prototype original
		
	}
	void TransitionReal() {
		//TODO ditto
		
	}

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
}
