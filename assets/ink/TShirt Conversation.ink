VAR currentPartyChar = "THE PARTY"
VAR currentPlane = "REAL"

// 1-34 PERTAIN TO REAL WORLD SHIRT RACK INTERACTION

It's a clothing rack, full of bright, colorful t-shirts all pertaining to today's warmest trends.
{currentPartyChar == "NICK":
    -> NickTShirtRack
}
    -> END

=== NickTShirtRack ===
It's a clothing rack, full of bright, colorful t-shirts. 

They grab Nick's attention instantly, drawing him in, calling to some deep primal part of his heart.
* [Reach out for the shirt] -> TakeShirt
* [Pull Away] -> PullAwayNoShirt

=== TakeShirt ===
// boolean - has shirt is true
Tantalizing colors, soft fabrics he could never have, designs that all seem to vie for his attention; his hand passes through them all, reaching deep into the mass of clothing, as if guided by some otherworldly force.

He swears he can feel himself enveloped in the warm embrace.
& //shift plane

* [Pull Away] -> PullAwayShirt

=== PullAwayNoShirt ===
He cannot. It is calling for him. He won't ignore it's pitiful keen, will he? How cruel of him to.
-> TakeShirt

=== PullAwayShirt ===
The world feels different now, the shirt in his hands heavy, a comfortable weight that proves it exists, that he has it, that it is his. 

He steps away from the clothing rack, triumphant. 
-> END 

// 36-NUMBER HERE PERTAIN TO DREAM WORLD RACK INTERACTION
// if controlling Nick
-> NickTShirtDreamRack
// if controlling Noir and Ms.Suwan
-> NoirSuwanTShirtDreamRack

=== NickTShirtDreamRack ===
They still call to him, his vision swimming with the patterns of their designs. 
* [ Reach out for another shirt ] -> TakeShirtDream
* [ Pull Away ] -> PullAwaySuccessful

=== TakeShirtDream ===
// boolean - hasshirt is false
He takes another shirt, grabbing for its incoporeal form, but his hand seems to pass through it. He can't get a hold of it, none of the shirts want to be his. He has the one and only.
& //shift plane
-> END

=== PullAwaySuccessful
He ignores them, stepping away from the shirt rack with his prize still in hand. 
-> END

=== NoirSuwanTShirtDreamRack ===
It's a clothing rack, full of bright, colorful t-shirts. Their colors seem to swim in front of everyone's eyes as they look at them.  
-> END
