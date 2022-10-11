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

	//TODO: could put this on a component if we want any object able to pathfind, and NPCs walking around (put the move left, right, ect on this other component too)
	public void Pathfind(Node target) {
		
	}

	//can be called both by player input and by pathfinding.
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
		//TODO 	
	}
