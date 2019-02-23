function init()
  connect(g_game, { onGameEnd = onGameEnd })
  ProtocolGame.registerExtendedOpcode(103, function(protocol, opcode, buffer) onBuyFailed(protocol, opcode, buffer) end)

  shopWindow = g_ui.displayUI('shop')
  shopWindow:hide()
  playerEmeralds = shopWindow:getChildById('emeralds')

  shopTabBar = shopWindow:getChildById('shopTabBar')
  shopTabBar:setContentWidget(shopWindow:getChildById('shopTabContent'))

  itensPanel = g_ui.loadUI('itens')
  shopTabBar:addTab(tr('Items'), itensPanel, '/modules/game_shop/images/shoptabs/itens')

  acessoriosPanel = g_ui.loadUI('acessorios')
  shopTabBar:addTab(tr('Acessorios'), acessoriosPanel, '/modules/game_shop/images/shoptabs/acessorios')

  skinsPanel = g_ui.loadUI('skins')
  shopTabBar:addTab(tr('Clans'), skinsPanel, '/modules/game_shop/images/shoptabs/skins')
  
  addonsPanel = g_ui.loadUI('pokeshop')
  shopTabBar:addTab(tr('PokeShop'), addonsPanel, '/modules/game_shop/images/shoptabs/pokeshop')

  premiumPanel = g_ui.loadUI('premium')
  shopTabBar:addTab(tr('Premium'), premiumPanel, '/modules/game_shop/images/shoptabs/premium')
  
  pacotesPanel = g_ui.loadUI('pacotes')
  shopTabBar:addTab(tr('Pacotes'), pacotesPanel, '/modules/game_shop/images/shoptabs/pacote')

 shopButton = modules.client_topmenu.addRightGameButton('shopButton', tr('Diamond Shop'), '/images/topbuttons/emerald_shop', toggle)
  shopButton:setWidth(36)
end

function terminate()
  disconnect(g_game, { onGameEnd = onGameEnd })
  ProtocolGame.unregisterExtendedOpcode(103)

  shopWindow:destroy()
  shopButton:destroy()
end

function onGameEnd()
  if shopWindow:isVisible() then
    shopWindow:hide()
  end
end

function show()
  shopWindow:show()
  shopWindow:raise()
  shopWindow:focus()
  addEvent(function() g_effects.fadeIn(shopWindow, 250) end)
  playerEmeralds:setText(g_game.getLocalPlayer():getItemsCount(3032))
end

function hide()
  addEvent(function() g_effects.fadeOut(shopWindow, 250) end)
  scheduleEvent(function() shopWindow:hide() end, 250)
end

function toggle()
  if shopWindow:isVisible() then
    hide()
  else
    show()
  end
end

function show()
  shopWindow:show()
  shopWindow:raise()
  shopWindow:focus()
end

function hide()
  shopWindow:hide()
  if acceptWindow then
    acceptWindow:destroy()
    acceptWindow = nil
  end
end

function addTab(name, panel, icon)
  shopTabBar:addTab(name, panel, icon)
end

function addButton(name, func, icon)
  shopTabBar:addButton(name, func, icon)
end

-- Buy functions:
function carbos()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!shopbuy carbos')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function hpup()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!shopbuy hpup')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function iron()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!shopbuy iron')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function protein()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!shopbuy protein')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function calcium()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!shopbuy calcium')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function premium1()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyvip#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end



-- Addons
function tm03reflect()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#vault1#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm06toxic()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buynditto#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm11bubblebeam()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#boost#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm07zapcannon()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buymegabox#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm12watergun()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('!shopbuy watergun')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm13icebeam()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyditto#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm14blizzard()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#bless#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm15hyperbeam()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buydevice#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm18raindance()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyhelds#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm031()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('/clan gardestrike ,5')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm062()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('/clan ironhard ,5')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm073()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('/clan malefic ,5')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm114()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('/clan naturia ,5')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm125()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('/clan orebound ,5')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm136()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('/clan psycraft ,5')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm147()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('/clan raibolt ,5')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm158()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('/clan seavel ,5')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm189()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('/clan volcanic ,5')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm1810()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('/clan wingeon ,5')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm0311()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buybrozong#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm0622()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buydragonite#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm0733()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyelectivire#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm1144()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyflygon#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm1255()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyheracross#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm1366()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyinfernape#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm1477()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buymagmortar#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm1588()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buysceptile#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm1899()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyswampert#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm1810()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyursaring#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm1819()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyrobonormal#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm1820()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyrobomagmar#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end

function tm1821()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyrobotoise#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end


function tm1822()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyrobotrop#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end
function tm1823()
  if acceptWindow then
    return true
  end

  local acceptFunc = function()
    g_game.talk('#buyrobogengar#')
	acceptWindow:destroy()
	acceptWindow = nil
  end
  
  local cancelFunc = function() acceptWindow:destroy() acceptWindow = nil end

  acceptWindow = displayGeneralBox(tr('Accept transaction'), tr("Do you really want to buy this item?"),
  { { text=tr('Yes'), callback=acceptFunc },
    { text=tr('No'), callback=cancelFunc },
    anchor=AnchorHorizontalCenter }, acceptFunc, cancelFunc)
  return true
end




