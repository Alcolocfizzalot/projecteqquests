--only get quest if faction <= indifferent
--1	Ally
--2	Warmly
--3	Kindly
--4	Amiably
--5	Indifferent
--6	Apprehensive
--7	Dubious
--8 Threateningly
--9	Scowls

--404 Dark Reign
--429 Norrath's Keepers

function event_say(e)
	if(e.message:findi("hail")) then
		local NKF=e.other:GetFactionLevel(e.other:GetID(), e.self:GetID(), e.other:GetBaseRace(), e.other:GetClass(), e.other:GetDeity(), 429, e.self);
		if (NKF >= 5) then
			e.self:Say("I'm not that interested in becoming a servant of those followers of Firiona Vie myself, but I don't mind the cash they pay me. I keep most for me and throw a little back to the Wayfarers crew. If you're looking to get on their good side, I can make some money and you can gain their audience.");
			-- so we get a random task here if we don't have one. Should we do like even/odd in game minute so everyone in the group can get the same?
			-- Blood of the Winged, Goblin Broth
			if (not e.other:IsTaskActive(273) and not e.other:IsTaskActive(274)) then
				eq.task_selector({273, 274});
			end
		else
			e.self:Say("I've gotten acquainted with Norrath's Keepers well enough to know they might be interested in speaking with you.");
			--e.self:Say("You can probably go try to speak to the Dark Reign for work. I've got nothing for you.");
		end
	end
end
