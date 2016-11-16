# Create a background
new BackgroundLayer backgroundColor: "FF9800"

screen = new ScrollComponent
  backgroundColor: "white"
  width: 233
  height: 367
  borderRadius: 4
  shadowX:6
  shadowY: 8
  shadowBlur: 4

screen.center()

components = []

drawComponents = ->
  c = 0
  while c < 5
    components[c] = new Layer
      parent: screen.content
      width: (screen.width) - 10
      x:5
      borderRadius:4
      height: 200
      y: (c * 205) + 5
      backgroundColor: "#9575CD"
      shadowY:3
      shadowX:2
      shadowBlur:2
    components[c].draggable.enabled = true
    components[c].draggable.vertical = false
    remove = endAnimation = false
    c++
drawComponents()

screenContent2 = new Layer
  height:screen.height
  width:screen.width
  y: 0 -screen.height
  parent:screen
  backgroundColor: "#FFC400"
  shadowX: 4
  shadowY : 5
  shadowBlur: 4

navBar = new Layer
  width: screen.width
  height:40
  parent:screen
  y: screen.height-40
  backgroundColor:"#EC407A"

photo = new Layer
  parent: screenContent2
  y: 50
  width:screen.width - 10
  x: Align.center()
  height: 100
  borderRadius : 4
  image: "images/cat.jpg"
  shadowY:4
  shadowX:3
  shadowBlur:3
photo.pinchable.enabled = true
photo.pinchable.treshold = 20
photo.pinchable.rotate = false

success = new Layer
  y: 200
  x: Align.center()
  width: 50
  parent: screenContent2
  height: 20
  borderRadius:3
  backgroundColor:"#689F38"
  shadowY:4
  shadowX:3
  shadowBlur:3

success.states.add
  second:
    height:50
    borderRadius:25
    y:185
    backgroundColor: "#00BCD4"
    scale: 8.2


success.states.animationOptions =
  curve: "spring"
  time: 0.2

success.on Events.Click, ->
  success.states.next()

navBarTop = new Layer
  width: screen.width
  height:40
  parent:screen
  y: 0
  backgroundColor:"#EC407A"

back = new Layer
  image: "images/back.png"
  parent: navBarTop
  height:20
  width: 30
  y: Align.center()

back.states.add
  second:
    x: screen.width - 30
    rotation: 180

back.on Events.Click, ->
  c = 0
  while c < 5
    components[c].animate
      properties:
        x: 1000
      delay: c/10
    c++
  screenContent2.animate
    properties:
      y:0
    delay:0.2
  back.states.next()




screen.scrollHorizontal = false

screen.contentInset =
  bottom: 45
  top: 40


components[0].draggable.enabled = false

slider = new SliderComponent
    min: 0
    max: 255
    value: 127
    knobSize: 25
    width: components[0].width - 30
    parent: components[0]

slider.fill.backgroundColor = "#28affa"
slider.backgroundColor = "#28affa"


slider.fill.backgroundColor = "#28affa"
slider.backgroundColor = "#28affa"


slider.center()
slider.y = 125



for component in components
  component.draggable.constraints =
    x:5
  component.draggable.bounceOptions =
    friction: 20,
    tension: 500,
  cardNav = new Layer
    parent:component
    width:component.width
    height: 35
    y:component.height - 35
    x:Align.center()
    backgroundColor: "#4FC3F7"

btns = []
for i in [0...5]
  btn = new Layer
    parent: components[i]
    height:30
    width:30
    backgroundColor: "#388E3C"
    borderRadius:4
    x: components[i].width - 40
    y: 10
    shadowX: 3
    shadowY: 4
    shadowBlur: 3
  btns.push(btn)



knobInfo = new Layer
  parent: slider.knob
  width: slider.knob.width
  height: 20
  y: - 25
  backgroundColor: "#90A4AE"
  borderRadius: 3
  opacity: 0


slider.on "change:value", ->
  sliderRed = slider.value.toString()
  newColor = "rgb("+sliderRed+",133,98)"
  red = "rgb("+sliderRed+",255,255
  )"
  components[0].backgroundColor = newColor
  slider.knob.backgroundColor = red

# navPanel = new Layer
#   width: screen.width / 2 + 20
#   height: screen.height
#   parent:screen
#   x: -screen.width / 2 + 20
