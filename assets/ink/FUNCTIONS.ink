EXTERNAL TestExternal()
EXTERNAL partyLeader()



=== function partyLeader() ===
	~ return "ERR: UNKNOWN FROM INSIDE INK"
	
=== function testInternal() ===
	~ return "hello from inkside"

=== function TestExternalFunc() ===
	~ return "hello from inkside"


VAR someExternalString = "hello from another file"

VAR currentPartyChar = "PARTY"