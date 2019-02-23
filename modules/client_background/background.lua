-- private variables
local background
local clientVersionLabel

-- public functions
function init()
  background = g_ui.displayUI('background')
  background:lower()
  
math.randomseed(os.time())
  -- images named background-1, background-2, ..., background-10...
  -- background:setImageSource('/images/background-' .. math.random(6) .. '.png')
  background:setImageSource('/images/background.png')
  
  
  clientVersionLabel = background:getChildById('clientVersionLabel')
  clientVersionLabel:setText(g_app.getName() .. ' Pokemon Horus ' .. g_app.getVersion(1) .. '\n' ..
                             '  ' .. g_app.getBuildRevision() .. ' ('.. g_app.getBuildCommit() .. ' | Edited by Seth... ' ..
                             'Compilado ' .. g_app.getBuildDate())

  if not g_game.isOnline() then
    addEvent(function() g_effects.fadeIn(clientVersionLabel, 1100) end)
  end

  connect(g_game, { onGameStart = hide })
  connect(g_game, { onGameEnd = show })
  
end

function terminate()
  disconnect(g_game, { onGameStart = hide })
  disconnect(g_game, { onGameEnd = show })

  g_effects.cancelFade(background:getChildById('clientVersionLabel'))
  background:destroy()

  Background = nil
end

function hide()
  background:hide()
end

function show()
  background:show()
end

function hideVersionLabel()
  background:getChildById('clientVersionLabel'):hide()
end

function setVersionText(text)
  clientVersionLabel:setText(text)
end
