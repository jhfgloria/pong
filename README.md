# pong
Experimental game with Godot game engine

## Stuff I learned along the way

### Static VS Kinematic VS Rigid Bodies 2D

All bodies are nodes that expect collisions; so rule of thumb to use these are interaction between bodies colliding in the game.

* StaticBody2D: is not expected to move in the scene. Interaction with it is just via collisions. Use-cases are environmental objects, walls, etc.
* KinematicBody2D: this body is expect to move but always under programmatic movement. Environmental physics like gravity won't apply to those. Use-cases are objects, characters, etc that only move under programmatic behaviour like topdown game characters.
* RigidBody2D: environmental physics like gravity apply to these. Unless colliding with the floor these bodies are expect to keep falling on the scene. Use-cases are whenever wants to have full physics in the game like on a platformer where we intend the character to fall off clifs or return to the floor after jumping.


