--Global Screen Dimensions
--NOTE: THESE ARE FLIPPED BECAUSE OF LANDSCAPE ORIENTATION
screenWidth = 1136
screenHeight = 640

--Sets default anchor point to top left
display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)

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
        {x = 267, y = 82, width = 55, height = 70},  --12 Tail 2
        {x = 331, y = 89, width = 60, height = 56},  --13 Tail 3
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
    name = 'nose', start = 2, count = 3
}
local nose = display.newSprite(shark, sheet, noseSequence)

--Mouth of the shark
local mouthSequence =
{
    name = 'mouth', start = 5, count = 3
}
local mouth = display.newSprite(shark, sheet, mouthSequence)

--Pectoral Fin of the Shark
local pectoralSequence = 
{
    name = 'pectoral', start = 8, count = 3, time = 200, loopDirection = "bounce"
}
local pectoral = display.newSprite(shark, sheet, pectoralSequence)
pectoral:toBack()

--Tail of the Shark
local tailSequence = 
{
    name = 'tail', start = 11, count = 3, time = 200, loopDirection = "bounce"
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
--tail:play()
