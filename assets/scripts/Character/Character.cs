using Godot;
using System;

public class Character : Node2D
{
	/*
		One of the controllable characters.
		Can be moved by input or pathfinding and animates and updates sprites accordingly.
	*/
	
	final int moraleMax = 3;
	int morale = moraleMax;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }

	//TODO: could put Pathfind and Move___ functions on a class that can be inherited by other objects, but only the player characters need to move right now 
	public void Pathfind(Node target) {
		
		//call move____ functions 
	}

	//can be called both by player input and by pathfinding.
	//updates sprite animation as well. 
	public void MoveLeft() {
		
	}
	
	public void MoveRight() {
		
	}
	
	public void MoveUp() {
		
	}
	
	public void MoveDown() {
		
	}
	
	
	public int GetMorale() {
		return morale;
	}
	public void LowerMorale(int amount = 1) {
		morale -= amount;
		if(morale <= 0) {
			MoraleDepleted();
		}
	}
	public void RaiseMorale(int amount = 1) {
		morale = Math.Min(amount, moraleMax);
	}
	private void MoraleDepleted() {
		//TODO: what happens when morale runs out?
	}
