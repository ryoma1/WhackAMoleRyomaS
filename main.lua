
----------------------------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: Ryoma Scott
-- Course: ICS2O/3C
-- This program makes an object appear on the screen for an amount of time.
-- The object disappears if the user clicks on it. When clicked, the users score increases by 1
----------------------------------------------------------------------------------------------------------

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--Creating background
local bkg = display.setDefault("background", 50/255, 100/255, 50/255)

--create mole

local mole = display.newImage("Images/mole.png", 0, 0)

	--setting position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	--make mole one third of original size
	mole:scale(0.3, 0.3)

	--make the mole invisible
	mole.isVisible = false

local Score = 0
local ScoreText
local textObject

------------------------------------------------------------------------
-- FUNCTIONS 
------------------------------------------------------------------------

-- this function makes a mole appear in a random (x,y) position on the,
-- screen before calling the Hide function 
function PopUp()

	-- choosing random Position on the screen between 0 and the size of,
	--the screen 
	mole.x = math.random(0, display.contentWidth )
	mole.y = math.random(0, display.contentHeight)

	-- make the mole visible 
	mole.isVisible = true 
	timer.performWithDelay(500, Hide)
end

-- this function calls the PopUp function after 3 seconds 
function PopUpDelay()
	timer.performWithDelay(3000, PopUp)
end

-- This function makes the mole invisible and then calls the PopUpdelay function
function Hide()

	-- changing Visiblity
	mole.isVisible = false  
	PopUpDelay()
end 

-- this function starts the game 
function GameStart ()
	PopUpDelay()
end

-- this function increments the score only if the mole is clicked. it then,
-- displays the new score.
function Whacked( event )

	-- if touch phase just started
	if (event.phase == "began") then
		Score = Score + 1
		ScoreText.text = Score .. ""
	end
end

ScoreText = display.newText( "0", display.contentWidth/2, 50, nil, 50 )
ScoreText:setTextColor(255/255, 0/255, 100/255)
textObject = display.newText( "Score:", display.contentWidth/2.5, 50, nil, 50 )
textObject:setTextColor(0/255, 0/255, 255/255)
------------------------------------------------------------------------------
-- EVENT LISTENERS 
-----------------------------------------------------------------------------
-- added the event listener to the moles so that if the mole is touched, 
-- the whacked function is called 
mole:addEventListener("touch", Whacked )

-----------------------------------------------------------------------------
-- START THE GAME
-----------------------------------------------------------------------------
GameStart () 
