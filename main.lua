-- Title: WhackAMole
-- Name: Ryoma Scott
-- Course: ICS2O/3C
-- This program places a random object on the screen. If the user clicks on it it in time,
-- the score increases by 1.

--hide the status bar.
display.setStatusBar(display.HiddenStatusBar)

Creating Background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight )

--set the background colour
display.setDefault("background", 100/255, 255/255, 100/255)

------------------------------------------------------------------
--LOCAL VARIABLES
------------------------------------------------------------------