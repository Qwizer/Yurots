
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function FocusModule:init(handler)
	FOCUS_GREETSWORDS = {'hi king', 'hello king', 'hail king', 'hail the king', 'hi'}
	FOCUS_FAREWELLSWORDS = {'bye', 'farewell'}
	self.npcHandler = handler
	for i, word in pairs(FOCUS_GREETSWORDS) do
		local obj = {}
		table.insert(obj, word)
		obj.callback = FOCUS_GREETSWORDS.callback or FocusModule.messageMatcher
		handler.keywordHandler:addKeyword(obj, FocusModule.onGreet, {module = self})
	end
		
	for i, word in pairs(FOCUS_FAREWELLSWORDS) do
		local obj = {}
		table.insert(obj, word)
		obj.callback = FOCUS_FAREWELLSWORDS.callback or FocusModule.messageMatcher
		handler.keywordHandler:addKeyword(obj, FocusModule.onFarewell, {module = self})
	end
		
	return true
end

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	return true
end

local node1 = keywordHandler:addKeyword({'promot'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to be promoted in your vocation for 20000 gold?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, promotions = {[1] = 5, [2] = 6, [3] = 7, [4] = 8}, cost = 20000, level = 20, text = 'Congratulations! You are now promoted.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then not.', reset = true})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())