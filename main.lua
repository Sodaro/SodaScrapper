local frame = CreateFrame("FRAME", "SodaScrapFrame", ScrappingMachineFrame);
frame:RegisterEvent("SCRAPPING_MACHINE_SHOW");
frame:RegisterEvent("SCRAPPING_MACHINE_CLOSE");

open = false;
local function eventHandler(self, event, ...)
  if (event == "SCRAPPING_MACHINE_SHOW") then
    print ("open")
    open = true;
    checkItems();
  else
    print ("closed")
    open = false;
  end
end


frame:SetScript("OnEvent", eventHandler);

SLASH_SCRAPPER1, SLASH_SCRAPPER2 = "/scrapper", "/scrap";

addedItems = 0;

function SlashCmdList.SCRAPPER(msg, editbox)
  if (open == true) then
  checkItems(self);
  end 
end 

function checkItems(self)
	OpenAllBags(self);
  for bag = 0,4 do
    addItemsFromBag(bag);
  end
end

function addItemsFromBag(bag)
    numberOfSlots = GetContainerNumSlots(bag);
    for slot = 1,numberOfSlots do
      texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(bag, slot);
      if(quality == 2) or (quality == 3) or (quality == 4) then
        addedItems = addedItems + 1;
        if (addedItems ~= 0 or addedItems ~= 9) then
          C_Timer.After(0.1, function() UseContainerItem(bag, slot) end)
        end
      end
    end
  end
