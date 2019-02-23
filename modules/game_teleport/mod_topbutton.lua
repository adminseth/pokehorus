local config = {
	id = 'modTopButton',
	name = 'Teletransportes',
	img = 'button',
	options = {
		['House'] = '!h House',
		['Saffron'] = '!h Saffron',
		['Cerulean'] = '!h Cerulean',
		['Lavender'] = '!h Lavender',
		['Fuchsia'] = '!h Fuchsia',
		['Celadon'] = '!h Celadon',
		['Viridian'] = '!h Viridian',
		['Vermilion'] = '!h Vermilion',
		['Pewter'] = '!h Pewter',
		['Pallet'] = '!h Pallet',
		['Cinnabar'] = '!h Cinnabar',	
		['Phenac'] = '!h Phenac',	
		
	}
}

function init()  
   connect(g_game, { onGameStart = reload, onGameEnd = reload})
   TopButton = modules.client_topmenu.addRightGameToggleButton(config.id, tr(config.name), config.img, toggle, true)
   TopButton:setOn(true)
   reload()
end

function toggle()
  local menu = g_ui.createWidget('PopupMenu')
  for _name, _command in pairs(config.options) do
	menu:addOption(_name, function() g_game.talk(_command) end)
  end
  menu:display()
end

function reload()
	TopButton:setVisible(g_game.isOnline())
end