// real world conversation
// if approaching with NOUR
He looks Noir up and down, seemingly bored, as if her presence neither surprises nor interests him. 

Sales Associate: "Can I help you?" 
-> SARealWorldConvStart

// if approaching with NICK
When Nick approaches, he visibly tries to hide a cringe, but does an awful job at it. Still, he addresses him politely, if in a slightly strained tone.

Sales Associate: "Can I help you?"
-> SARealWorldConvStart

// if approaching with SUWAN
When he glances up at Ms. Suwan, after a brief moment of almost practiced boredom, he does a double take, suddenly far more interested in the conversation.

Sales Associate: "C...Can I help you, Ma'am? Are you sure you're in the right store?"
-> SARealWorldConvStart

===SARealWorldConvStart===
* Nour: "Hey, have you been having weird... plane shifts recently?" -> PlaneShifts
* Nick: "Hey! Do you have any cool T-Shirts?" -> TShirts
* Ms.Suwan: "Yes, you can. Do you know anything about this mall and it's history?"-> MallHistory

// if there's no more options left 
// He doesn't seem interested in talking to anyone in the party anymore. It seems they've all used up their good favors with him. ->END

===PlaneShifts===
He turns to Nour with a skeptical look. 

Sales Associate: "Are you insinuating I'm on drugs? What are you, a Narc?" 

* Nour: "No, I didn't say that!" -> WhateverMan
* Ms. Suwan: "Well are you on drugs?" ->ReallyOnDrugs

===WhateverMan===
Sales Associate: "Whatever, man. I don't know what you're talking about, and if you want to go off telling on me to my manager, you'd have a problem doing it. I am the manager."
-> SARealWorldConvStart

===ReallyOnDrugs===
He looks incredulously at Ms.Suwan. 

Sales Associate: "And what if I am? What's that going to change? I can still do my job perfectly fine, get off my ass. You'd be smoking too if you were about to lose your job." 

-> MsSuwanSAPlaneShift

===MsSuwanSAPlaneShift===
His words seem to hit close to home for Ms.Suwan. The world starts to waver in front of her, the mall closing in, almost crashing down even though it's still in place. In the span of a few moments, she drags everyone else into the other world along with her.
// plane shift here?
-> END

===TShirts===
This seems to be a normal question for him, and there's almost an instant switch in his demeanor as he parrots off a practiced sentence. 

Sales Associate: "The T-Shirt rack is over there, you can browse through it and pick out what you want. DON'T, and I repeat DON'T steal anything. Upper management is more on my ass than usual because the mall is closing.

:Nick:
* [Thank him.] "Thank you!" ->NickThankSA
* [Walk away.] Nick walks away without saying thank you. ->SARealWorldConvStart

===NickThankSA===
Sales Associate: Yeah yeah... you're welcome, kid. (There's the faintest trace of a smile on his face.) 
->SARealWorldConvStart

=== MallHistory ===
He blinks a few times at Ms.Suwan before looking around Warm Subject. Then, after a brief moment, shrugs.

Sales Associate: "I just work here, Ma'am. For however longer that'll be. I don't know anything."
-> END

// dream world conversation - introduction doesn't change no matter who approaches
He seems to waver in and out of reality, but still notices the party arrive and offers them a friendly wave.

Sales Associate: "Hey there ya'll, can I help you?"
-> SADreamWorldConvStart

===SADreamWorldConvStart===
* Ms.Suwan: "..." ->MsSuwanNoComment
* Nour "Are you alright?" ->NourIsSAALright
* Nick: "I got a T-Shirt..." ->NickGotHisDreamTShirt
-> END

===MsSuwanNoComment===
He notices Ms.Suwan's lack of enthusiasm, cocking his head in an almost animal-like manner. 

Sales Associate: "Are you alright?"

:Ms.Suwan:
* [Say nothing.] Ms.Suwan doesn't say anything, pursing her lips ->SAShrugging
* ["I'm fine."] ->MsSuwanIsFine
->END

===SAShrugging===
He shrugs his shoulders at her lack of comment, looking over at the others, awaiting their questions.
->SADreamWorldConvStart

===MsSuwanIsFine===
He doesn't seem to believe her when she replies she's fine, but he doesn't pry, shrugging and turning to the others, awaiting their questions.
-> SADreamWorldConvStart

===NourIsSAALright===
He blinks, seemingly confused at the question. His form seems to waver briefly, but after a moment of thought he slowly nods.

Sales Associate: "Yes... I don't see why I wouldn't be? What's with the weird question?

:Nour:
* [Squint] Nour squints at the Sales Associate, suspicious. Something isn't right here. ->NourIsSuspicious
* ["No reason."] Despite her suspicion, she doesn't pry and steps away. ->SADreamWorldConvStart
->END

===NourIsSuspicious===
He seems uncomfortable underneath her prying gaze, form wavering. 

Sales Associate: "... is there a reason you're squinting at me? Do I have something stuck in my teeth?" 

:Nour:
* "How do you not realize you're... like this?" ->SAObliviousToDreamWorld
* "You're hiding something from me." ->IsSAHidingSomething
* "... You know what, yes. You do have something stuck in your teeth." -> SAFoodStuckInTeeth

===SAObliviousToDreamWorld===
Sales Associate: "Like... what? I'm like I've always been. Are you alright, do you need help?"

:Nour:
* [Continue prying.] He doesn't seem to realize anything is wrong, but Nour doesn't trust it. ->NourContinuesPrying
* [Stop prying.] With a frustrated exhale of breath, Nour lets it go. ->SADreamWorldConvStart

===IsSAHidingSomething===
Sales Associate: "Hiding... what are you talking about? I'm not hiding anything, all the deals here are as transparent as they've always been!"

:Nour:
* [Continue prying.] He doesn't seem to realize anything is wrong, but Nour doesn't trust it. ->NourContinuesPrying
* [Stop prying.] With a frustrated exhale of breath, Nour lets it go. ->SADreamWorldConvStart

===NourContinuesPrying===
Nour prepares to continue digging, feeling frustration well up within her. He's hiding something, she's sure of it, she can see it underneath the facade of his innocent face. Her mouth opens, and instead of the loud yell she was expecting, the entire world seems to envelop her, dragging her back into reality.
// plane shift
-> END

===SAFoodStuckInTeeth===
He blushes, entire body going hot. 

Sales Associate: "Ah... how embarassing of me. Give me a moment."
-> SADreamWorldConvStart

==NickGotHisDreamTShirt===
He frowns, looking Nick up and down. 

Sales Associate: "Are you alright? You seem sad."

:Nick:
* "No it's alright." ->NickPretendsToBeAlright
* "I... I don't have the money to buy this." ->NickDoesntHaveMoney

===NickPretendsToBeAlright===
Though the Sales Associate doesn't seem convinced, he gives a slow nod. 

Sales Associate: "Well, if you need anything else feel free to peruse or ask me."
-> SADreamWorldConvStart
===NickDoesntHaveMoney===
The Sales Associate frowns, before looking at the rest of the party. 

Sales Associate: "I'm sorry... as much as I'd like to give this to you for free, I can't. You'll have to put it back on the rack and come back later when you have the money for it." 

Nick's used to this, unfortunately. He feels a familiar, overwhelming sadness and embarassment, feeling the eyes of others both real and imaginary on him, the pity they shower him with. He wants to run away from it, retreat back into the real world, anything to escape this feeling.
// plane shift
-> END
