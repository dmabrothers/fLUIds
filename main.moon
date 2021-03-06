require "imgui"
require "moonscript"
io.stdout\setvbuf('no')

fluids = require "fluids"

love.load = () ->
  image = love.graphics.newImage("image.png")
  window_func = () ->
    imgui.TextWrapped("Qui magna sint anim id sint enim in laborum non sed irure quis id eu culpa occaecat in culpa fugiat quis pariatur quis aliqua ex in fugiat deserunt labore cillum nisi adipisicing sed cillum veniam reprehenderit in dolore minim nisi mollit incididunt ut reprehenderit ut eu culpa reprehenderit irure aliquip laborum anim in sed pariatur eu dolor in esse pariatur aliquip consectetur velit consequat qui dolore minim voluptate qui sit magna et ex laborum veniam sunt do amet non dolore adipisicing in deserunt nostrud elit ullamco ex incididunt elit aliqua labore occaecat excepteur labore consectetur sed velit cupidatat anim sint consectetur aliquip exercitation dolor irure ullamco sunt mollit dolor pariatur sunt duis dolore minim aute proident mollit dolor quis occaecat sunt consequat dolor esse consectetur non in consectetur eiusmod laboris officia exercitation pariatur sed tempor amet esse cillum dolore laborum do do est sed nisi sed irure ullamco proident eu ex culpa et reprehenderit aliqua in ut dolor eiusmod commodo consequat irure velit occaecat id in aliqua dolor laborum proident consectetur enim dolor in non tempor ut laboris non laborum nostrud ut enim aute ea proident nisi dolore magna in esse duis elit aliqua cupidatat ullamco nisi est sit aliqua aute est eu consectetur aliquip ullamco eu sint ad consectetur sed cillum minim cillum consectetur dolor ut aliquip dolore sit ad aliqua aliquip consequat non id esse.")
  window_func2 = () ->
    imgui.Text("self.x: " .. math.floor(window_2.x))
    imgui.Text("self.y: " .. math.floor(window_2.y))
    imgui.Text("FPS: " .. love.timer.getFPS())
  window_func3 = () ->
    imgui.Image(image, image\getWidth()/4, image\getHeight()/4)

  theme = {{"WindowRounding", 0}}
  fluids.ApplyTheme(theme)

  export window_1 = fluids.Window("Window 1", window_func, {200, 200, 300, 300})
  export window_2 = fluids.Window("Window 2", window_func2 )
  export window_3 = fluids.Window("Window 3", window_func3, {0, 0, 150, 150})

  window_2\setAlign({"right of", "bottom"}, window_1)
  window_3\setAlign({"above of", "right"}, window_2)

  fluids.Window("No name", window_func, {10, 10, 300, 100})

love.update = (dt) ->
  -- window_1.x-=1
  fluids.Update()
  if love.filesystem.exists("lovebird.lua")
    require("lovebird").update()

love.draw = () ->
  love.graphics.setBackgroundColor(100,100,100)
  fluids.Draw()

love.textinput = (t) ->
  fluids.textinput(t)

love.keypressed = (key) ->
  fluids.keypressed(key)
  switch key
    when "w"
      fluids.ToggleVisibliity(window_2)
    when "d"
      window_2\detach()
    when "f"
      window_1\destroy()
    when "q"
      fluids.Quit()
      love.event.quit()

love.keyreleased = (key) ->
  fluids.keyreleased(key)

love.mousemoved = (x, y) ->
  fluids.mousemoved(x, y)

love.mousepressed = (x, y, button) ->
  fluids.mousepressed(button)

love.mousereleased = (x, y, button) ->
  fluids.mousereleased(button)

love.wheelmoved = (x, y) ->
  fluids.wheelmoved(x, y)
