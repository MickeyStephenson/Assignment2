--Global Screen Dimensions
--NOTE: THESE ARE FLIPPED BECAUSE OF LANDSCAPE ORIENTATION
screenWidth = 1136
screenHeight = 640

-- Create the frames for the sprite
local options = 
{
    frames =
    {
        {x = 22, y = 8, width = 167, height = 50},   --Body
        {x = 207, y = 27, width = 16, height = 9},   --Nose 1
        {x = 228, y = 27, width = 16, height = 9},   --Nose 2
        {x = 249, y = 27, width = 16, height = 9},   --Nose 3
        {x = 281, y = 20, width = 56, height = 26},  --Mouth 1
        {x = 344, y = 20, width = 56, height = 26},  --Mouth 2
        {x = 407, y = 20, width = 56, height = 26},  --Mouth 3
        {x = 22, y = 93, width = 52, height = 37},   --Pectoral Fin 1
        {x = 80, y = 99, width = 53, height = 31},   --Pectoral Fin 2
        {x = 140, y = 102, width = 54, height = 28}, --Pectoral Fin 3
        {x = 210, y = 70, width = 48, height = 92},  --Tail 1
        {x = 267, y = 82, width = 55, height = 70},  --Tail 2
        {x = 331, y = 89, width = 60, height = 56},  --Tail 3
        {x = 405, y = 93, width = 60, height = 46},  --Dorsal Fin
    }
}
--Create the Image Sheet
local sheet = graphics.newImageSheet("KingBayonet.png", options)
