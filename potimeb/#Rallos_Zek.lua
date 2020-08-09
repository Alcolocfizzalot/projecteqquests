function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,6); -- NPC: zone_status
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 8
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,8)),7,"H13");
end

function event_combat(e)
	if (e.joined == false) then
		e.self:SetHP(e.self:GetMaxHP());
		e.self:SetSpecialAbility(SpecialAbility.flurry,0);
		e.self:SetSpecialAbility(SpecialAbility.area_rampage,0);
		e.self:SetSpecialAbility(SpecialAbility.rampage,1); --turn rampage back on
		e.self:SetSpecialAbilityParam(SpecialAbility.rampage,0,5);--5 percent chance to rampage
		eq.set_next_hp_event(91);
		eq.depop_all(223229); -- a summoned minion
		eq.depop_all(223230); -- a summoned boar
	end
end

function event_spawn(e)
	eq.set_next_hp_event(91);
end

function event_hp(e)
	e.self:Emote("Rallos Zek roars a mighty war cry and swings his axe in vengeance.");
	if (e.hp_event == 91) then
		-- spawn a_summoned_boar and a_summoned_minion
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.set_next_hp_event(76);
	elseif (e.hp_event == 76) then
		-- spawn a_summoned_boar and a_summoned_minion
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		e.self:SetSpecialAbility(SpecialAbility.area_rampage,1);--enable AE Rampage
		e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage,0,5);--5 percent chance to ae rampage
		e.self:SetSpecialAbility(SpecialAbility.rampage,0); --turn rampage off
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		-- spawn a_summoned_boar and a_summoned_minion
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		e.self:SetSpecialAbility(SpecialAbility.flurry,1);--enable flurry
		e.self:SetSpecialAbilityParam(SpecialAbility.flurry,0,5);--5 percent chance to flurry
		eq.set_next_hp_event(26);
	elseif (e.hp_event == 26) then
		-- spawn a_summoned_boar and a_summoned_minion
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,262,-280,5,449); -- NPC(s): a_summoned_minion_ (223229), a_summoned_boar_ (223230)
	end
end
