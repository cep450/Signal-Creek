// EXTERNAL TestExternal()
// EXTERNAL partyLeader()
// EXTERNAL getName()

VAR currentPartyChar = "PARTY"
VAR currentPlane = "DREAM"
VAR timesVisited = 0

INCLUDE bandn\priceofsalt_dream.ink
INCLUDE bandn\priceofsalt_real.ink
INCLUDE bandn\bookstack_dream.ink
INCLUDE bandn\bookstack_real.ink
INCLUDE bandn\dragonplush_dream.ink
INCLUDE bandn\dragonplush_real.ink
INCLUDE bandn\hotwheels_dream.ink
INCLUDE bandn\hotwheels_real.ink
INCLUDE bandn\npc_rina_dream.ink
INCLUDE bandn\npc_rina_real.ink
INCLUDE bandn\oldnovel_dream.ink
INCLUDE bandn\oldnovel_real.ink
INCLUDE bandn\pens_dream.ink
INCLUDE bandn\pens_real.ink
INCLUDE bandn\polaroid_dream.ink
INCLUDE bandn\polaroid_real.ink
INCLUDE bandn\priceofsalt_dream.ink
INCLUDE bandn\priceofsalt_real.ink

INCLUDE topicspot\consoles_dream.ink
INCLUDE topicspot\consoles_real.ink
INCLUDE topicspot\coolshirt_dream.ink
INCLUDE topicspot\coolshirt_real.ink
INCLUDE topicspot\graphictees_dream.ink
INCLUDE topicspot\graphictees_real.ink
INCLUDE topicspot\makeup_dream.ink
INCLUDE topicspot\makeup_real.ink
INCLUDE topicspot\npc_manager_dream.ink
INCLUDE topicspot\npc_manager_real.ink
INCLUDE topicspot\phonecases_dream.ink
INCLUDE topicspot\phonecases_real.ink
INCLUDE topicspot\pinbuttons_dream.ink
INCLUDE topicspot\pinbuttons_real.ink
INCLUDE topicspot\sailormoonposters_dream.ink
INCLUDE topicspot\sailormoonposters_real.ink

INCLUDE hallway\bobatea_dream.ink
INCLUDE hallway\bobatea_real.ink
INCLUDE hallway\cafetables_dream.ink
INCLUDE hallway\cafetables_real.ink
INCLUDE hallway\litter_dream.ink
INCLUDE hallway\litter_real.ink
INCLUDE hallway\npc_chadbrodykristy_dream.ink
INCLUDE hallway\npc_chadbrodykristy_real.ink
INCLUDE hallway\olddoll_dream.ink
INCLUDE hallway\olddoll_real.ink
INCLUDE hallway\partyposter_dream.ink
INCLUDE hallway\partyposter_real.ink
INCLUDE hallway\pretzelstand_dream.ink
INCLUDE hallway\pretzelstand_real.ink
INCLUDE hallway\victorias_dream.ink
INCLUDE hallway\victorias_real.ink
INCLUDE hallway\womensclothing_dream.ink
INCLUDE hallway\womensclothing_real.ink

== default ==

    thing
    {addVisit()}
    
    ->DONE
	
== function addVisit() ==
    ~timesVisited += 1
=== function getPartyLeader() ===
	~ return "ERR: UNKNOWN FROM INSIDE INK"
	
=== function testInternal() ===
	~ return "hello from inkside"

=== function TestExternalFunc() ===
	~ return "hello from inkside"


