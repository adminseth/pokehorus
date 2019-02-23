-- Local variables
local barWindow = nil
local barPanel = nil
local barButton = nil
local healthBar = nil
local invButton = nil
local pokeHealthTooltip = 'Your pokemon health is %d out of %d.'
local path = '/images/topbuttons/'

local InventorySlotStyles = {
  [InventorySlotLeg] = "LegSlot",
}
-- End local variables

-- Public functions
function init()
   connect(g_game, { onGameStart = reload, onGameEnd = reload})
   barWindow = g_ui.displayUI('pokeWindow', modules.game_interface.getRootPanel())

   barButton = modules.client_topmenu.addRightGameToggleButton('BarButton', tr('Pokemon Information'), 'pokeinfo.png', toggle)
   barButton:setVisible(true)

   healthBar = barWindow:recursiveGetChildById("healthBar")
   
   connect(LocalPlayer, { onInventoryChange = onInventoryChange})
   connect(g_game, {
    onGameStart = refresh,
    onGameEnd = hide
  })
   connect(g_game, 'onTextMessage', onPokeHealthChange)
   reload()
end

function onPokeHealthChange(mode, text)
if not g_game.isOnline() then return end
   if mode == MessageModes.Failure then 
      if string.find(text, '#ph#,') then
         local t = text:explode(',')
         local hp, maxHp = tonumber(t[2]), tonumber(t[3])
         pokeHealthBar:setText(hp .. ' / ' .. maxHp)
         barWindow:recursiveGetChildById("pokeHealthIcon"):setTooltip(tr(pokeHealthTooltip, hp, maxHp))
         pokeHealthBar:setValue(hp, 0, maxHp)
      end
   end
end 

function onInventoryChange(player, slot, item, oldItem)
  if slot >= InventorySlotPurse then return end
  local itemWidget = barWindow:getChildById('slot' .. slot)
  if itemWidget then
     if item then
        itemWidget:setStyle(InventorySlotStyles[slot])
        itemWidget:setItem(item)
     else
        itemWidget:setStyle(InventorySlotStyles[slot])
        itemWidget:setItem(nil)
     end
  end
end


--[[  End onChange  ]]--

function toggle()
   if barWindow:isVisible() then
      barButton:setIcon(path..'duel icon')
      barWindow:setVisible(false)
   else
      barButton:setIcon(path..'duel icon')
      barWindow:setVisible(true)
   end
end

function changeDir(dir, stop)

  if stop then
    --SendStopWalkAtAll
    local protocolGame = g_game.getProtocolGame() if protocolGame then protocolGame:sendExtendedOpcode(36, dir) end
  end
local protocolGame = g_game.getProtocolGame() if protocolGame then protocolGame:sendExtendedOpcode(35, dir) end
  --SendToChangeDirection
end

function startWalk(dir)
if g_keyboard.getModifiers() == KeyboardNoModifier then
  --SendToWalkAhead
  local protocolGame = g_game.getProtocolGame() if protocolGame then protocolGame:sendExtendedOpcode(37, dir) end
end
end

function refresh()
  if barWindow:isVisible() then
     barButton:setIcon(path..'duel icon')
  end
  online()
  local player = g_game.getLocalPlayer()
  for i=InventorySlotFirst,InventorySlotLast do
    if g_game.isOnline() then
      onInventoryChange(player, i, player:getInventoryItem(i))
    else
      onInventoryChange(player, i, nil)
    end
  end
end

function online()
  local player = g_game.getLocalPlayer()
  if g_game.isOnline() then
     barButton:setVisible(true)
  end
end

function hide()
   barButton:setVisible(false)
   barWindow:setVisible(false)
end

function reload()
    barWindow:setVisible(g_game.isOnline())
end

function onMiniWindowClose()
end
-- End public functions