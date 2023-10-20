--Global Screen Dimensions
--NOTE: THESE ARE FLIPPED BECAUSE OF LANDSCAPE ORIENTATION
screenWidth = display.contentWidth
screenHeight = display.contentHeight

--Sets default anchor point to top left
display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

--Create Widget
local widget = require("widget")

-- Create the frames for the sprite
local options = 
{
    frames =
    {
        {x = 22, y = 8, width = 167, height = 50},   --1 Body
        {x = 207, y = 27, width = 16, height = 9},   --2 Nose 1
        {x = 228, y = 27, width = 16, height = 9},   --3 Nose 2
        {x = 249, y = 27, width = 16, height = 9},   --4 Nose 3
        {x = 281, y = 20, width = 56, height = 26},  --5 Mouth 1
        {x = 344, y = 20, width = 56, height = 26},  --6 Mouth 2
        {x = 407, y = 20, width = 56, height = 26},  --7 Mouth 3
        {x = 22, y = 93, width = 52, height = 37},   --8 Pectoral Fin 1
        {x = 80, y = 99, width = 53, height = 31},   --9 Pectoral Fin 2
        {x = 140, y = 102, width = 54, height = 28}, --10 Pectoral Fin 3
        {x = 210, y = 70, width = 48, height = 92},  --11 Tail 1
        {x = 267, y = 70, width = 55, height = 92},  --12 Tail 2  if need to change for animation 267, 69, 55, 92
        {x = 331, y = 70, width = 60, height = 92},  --13 Tail 3  if need to change for animation 331, 69, 60, 92
        {x = 405, y = 93, width = 60, height = 46},  --14 Dorsal Fin
    }
}
--Create the Image Sheet
local sheet = graphics.newImageSheet("KingBayonet.png", options)

--Shark Group
local shark = display.newGroup()
shark.anchorX = -83.5
shark.anchorY = -25

--Body of the shark
local body = display.newImage(shark, sheet, 1)

--Nose of the shark
local noseSequence = 
{
    {name = 'forward', start = 2, count = 3, time = 500, loopCount = 1},
    {name = 'backward', start = 4, count = -3, time = 500, loopCount = 1}
}
local nose = display.newSprite(shark, sheet, noseSequence)

--Mouth of the shark
local mouthSequence =
{
    {name = 'forward', start = 5, count = 3, time = 500, loopCount = 1},
    {name = 'backward', start = 7, count = -3, time = 500, loopCount = 1}
}
local mouth = display.newSprite(shark, sheet, mouthSequence)

--Pectoral Fin of the Shark
local pectoralSequence = 
{
    {name = 'forward', start = 8, count = 3, time = 500, loopCount = 1},
    {name = 'backward', start = 10, count = -3, time = 500, loopCount = 1}
}
local pectoral = display.newSprite(shark, sheet, pectoralSequence)
pectoral:toBack()

--Tail of the Shark
local tailSequence = 
{
    {name = 'forward', start = 11, count = 3, time = 500, loopCount = 1},
    {name = 'backward', start = 13, count = -3, time = 500, loopCount = 1}
}
local tail = display.newSprite(shark, sheet, tailSequence)

local dorsal = display.newImage(shark, sheet, 14)
dorsal:toBack()

--Position the parts of the shark
nose.x = -15.5
nose.y = 24
mouth.x = 16
mouth.y = 19
pectoral.x = 85
pectoral.y = 37
tail.x = 159.5
tail.y = -24
dorsal.x = 68
dorsal.y = -37
shark.x = 350
shark.y = 300
shark.xScale = 4
shark.yScale = 4
shark.deltaX = 3
shark.deltaY = 3

-- Function to handle slider events
local function sliderListener(event)
    local scale = event.value / 100
    if (scale == 0) then
        scale = 0.01
    end
    shark.xScale = 4 * scale
    shark.yScale = 4 * scale
end

-- Create a slider for adjusting the scale of Keen Bayonet
local slider = widget.newSlider({
    top = 30,
    left = (screenWidth / 2) - 200,
    width = 400,
    value = 50, -- 100% scale by default
    listener = sliderListener
})

-- Create an On-Off switch
local onOffSwitch = widget.newSwitch
{
    left = 0,
    top = 0,
    style = "onOff",
    initialSwitchState = false, -- You can set it to false if you want to start in "off" mode
}

--This is for the continus movement
local function update()
    if onOffSwitch.isOn == true then
        if shark.x + shark.deltaX > display.contentWidth - 200 or
        shark.x + shark.deltaX < - 100 then
            shark.deltaX = -shark.deltaX
            end
        if shark.y + shark.deltaY > display.actualContentHeight - 80
        or shark.y + shark.deltaY < 80 then
        shark.deltaY = -shark.deltaY
        end
        shark.x = shark.x + shark.deltaX
        shark.y = shark.y + shark.deltaY
        end
    end

timer.performWithDelay(20, update, 0)

-- Function to handle drag-and-drop
local function handleDrag(event)
    if onOffSwitch.isOn == true then
        return true
    end

    local target = event.target
    local phase = event.phase

    if phase == "began" then
        display.getCurrentStage():setFocus(target)
        target.isFocus = true
        target.offsetX = event.x - target.x
        target.offsetY = event.y - target.y
    elseif target.isFocus then
        if phase == "moved" then
            target.x = event.x - target.offsetX
            target.y = event.y - target.offsetY
        elseif phase == "ended" or phase == "cancelled" then
            display.getCurrentStage():setFocus(nil)
            target.isFocus = false
        end
    end

    return true
end

-- Attach the drag-and-drop handler to the shark group
shark:addEventListener("touch", handleDrag)

--Event Handler for body part being touched
local function touchedBodyPart(event)
    local bodyPart = event.target
    if bodyPart.sequence == "forward" then
        bodyPart:play()
        bodyPart:setSequence("backward")
    elseif bodyPart.sequence == "backward" then
        bodyPart:play()
        bodyPart:setSequence("forward")
    end
end

nose:addEventListener("tap", touchedBodyPart)
mouth:addEventListener("tap", touchedBodyPart)
pectoral:addEventListener("tap", touchedBodyPart)
tail:addEventListener("tap", touchedBodyPart)
