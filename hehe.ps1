Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Add-Type @"
using System;
using System.Runtime.InteropServices;

public class MouseController {
    [DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, int cButtons, uint dwExtraInfo);

    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int X, int Y);

    public const int MOUSEEVENTF_WHEEL = 0x0800;
    public const int WHEEL_DELTA = 120;
    public const int MOUSEEVENTF_LEFTDOWN = 0x0002;
    public const int MOUSEEVENTF_LEFTUP = 0x0004;
}
"@

#CONSTANTS

#TODO - ADD WAY TO KILL BONEMEAL DUDES TO DAILIES

$global:TESSERACTPATH = "E:\Tesseract\tesseract.exe"

$global:MONITORXOFFSET = 1920
$global:MONITORYOFFSET = 1080
#Works horizontally atm
$global:MONITOR = 0

$global:DEFAULTCONFIG = @(
    @{
        daily = @{
            buyShops = 1;
            claimKeys = 1;

        } 
    }
)

$global:WORLDONE = @{
    'size' = 27
    1 = 'Blunder Hills'
    2 = 'Spore Meadows'
    3 = 'Froggy Fields'
    4 = 'Valley Of The Beans'
    5 = 'Jungle Perimeter'
    6 = 'Winding Willows'
    7 = 'Vegetable Patch'
    8 = 'Forest Outskirts'
    9 = 'Encroaching Forest Villas'
    10 = 'Tucked Away'
    11 = 'Grandfrog''s Backyard'
    12 = 'Birch Enclave'
    13 = 'Grand Owl Perch'
    14 = 'Spike Surprise'
    15 = 'The Base Of The Bark'
    16 = 'Hollowed Trunk'
    17 = 'Where the Branches End'
    18 = 'The Roots'
    19 = 'Poopy Sewers'
    20 = 'Rats Nest'
    21 = 'The Office'
    22 = 'Tunnels Entrance'
    23 = 'Freefall Caverns'
    24 = 'The Ol'' Straightaway'
    25 = 'Echoing Egress'
    26 = 'Slip Slidy Ledges'
    27 = 'Motherlode Pit'
}

$global:WORLDTWO = @{
    'size' = 18
    1 = 'Yum Yum Grotto'
    2 = 'Jar Bridge'
    3 = 'The Mimic Hole'
    4 = 'Dessert Dunes'
    5 = 'The Grandioso Canyon'
    6 = 'Shifty Sandbox'
    7 = 'Pincer Plateau'
    8 = 'Slamabam Straightaway'
    9 = 'The Ring'
    10 = 'Up Up Down Down'
    11 = 'Sands of Time'
    12 = 'Djonnuttown'
    13 = 'The Oasis'
    14 = 'Heaty Hole'
    15 = 'Bandit Bob''s Hideout'
    16 = 'Salty Shores'
    17 = 'Faraway Piers'
    18 = 'Deepwater Docks'
}

$global:WORLDTHREE = @{
    'size' = 18
    1 = 'Frostbite Towndra'
    2 = 'Steep Sheep Ledge'
    3 = 'Snowfield Outskirts'
    4 = 'The Stache Split'
    5 = 'Wam Wonderland'
    6 = 'Refrigeration Station'
    7 = 'Mamooooth Mountains'
    8 = 'Rollin'' Tundra'
    9 = 'Signature Slopes'
    10 = 'Thermonuclear Climb'
    11 = 'Waterlogged Entrance'
    12 = 'Cryo Catacombs'
    13 = 'Overpass of Sound'
    14 = 'Crystal Basecamp'
    15 = 'Hell Hath Frozen Over'
    16 = 'Equinox Valley'
    17 = 'Trappers Folley'
    18 = 'Inside the Igloo'
}

$global:WORLDFOUR = @{
    'size' = 15
    1 = 'Outer World Town'
    2 = 'Spaceway Raceway'
    3 = 'TV Outpost'
    4 = 'Donut Drive-In'
    5 = 'Outskirts of Fallstar Isle'
    6 = 'Mountainous Deugh'
    7 = 'Wurm Highway'
    8 = 'Jelly Cube Bridge'
    9 = 'Cocoa Tunnel'
    10 = 'Standstill Plains'
    11 = 'Shelled Shores'
    12 = 'The Untraveled Octopath'
    13 = 'Flamboyant Bayou'
    14 = 'Enclave of Eyes'
    15 = 'The Rift'
}

$global:WORLDFIVE = @{
    'size' = 15
    1 = 'Magma Rivertown'
    2 = 'Naut Sake Perimeter'
    3 = 'Niagrilled Falls'
    4 = 'The Killer Roundabout'
    5 = 'Cracker Jack Lake'
    6 = 'The Great Molehill'
    7 = 'Erruption River'
    8 = 'Mount Doomish'
    9 = 'OJ Bay'
    10 = 'Lampar Lake'
    11 = 'Spitfire River'
    12 = 'Miner Mole Outskirts'
    13 = 'Crawly Catacombs'
    14 = 'The Worm Nest'
    15 = 'The Hole'
}

$global:WORLDSIX = @{
    'size' = 15
    1 = 'Spirit Village'
    2 = 'Gooble Goop Creek'
    3 = 'Picnic Bridgeways'
    4 = 'Irrigation Stations'
    5 = 'Troll Playground'
    6 = 'Edge of the Valley'
    7 = 'Bamboo Laboredge'
    8 = 'Lightway Path'
    9 = 'Troll Broodnest'
    10 = 'Above the Clouds'
    11 = 'Sleepy Skyline'
    12 = 'Dozey Dogpark'
    13 = 'Yolkrock Basin'
    14 = 'Chieftain Stairway'
    15 = 'Emperor''s Castle Doorstep'
}

$global:CHARACTERSELECTION = @{
    "back" = @(1600, 980)
    "forward" = @(1780, 980)
    "start" = @(1755, 740)
    1 = @(190, 740)
    2 = @(420, 740)
    3 = @(650, 740)
    4 = @(880, 740)
    5 = @(1120, 740)
    6 = @(1350, 740)
    7 = @(190, 740)
    8 = @(420, 740)
    9 = @(650, 740)
    10 = @(880, 740)
}

$global:GUIELEMENTS = @{
    "players" = @(1660, 980)
    "cloudsave" = @(640, 170)
    "menu" = @(1750, 980)
    "map" = @(1520, 980)
    "claim" = @(1140, 560)
    "codex" = @(1400, 980)
    "quickref" = @(1180, 232)
    "storage" = @(1111, 370)
    "construction" = @(1518, 558)
    "cogs" = @(308, 105)
    "gaming" = @(1703, 538)
    "constructionEXP" = @(771, 72) #247 250 255
    "cogShelf" = @(682, 110) #230 165 107
    "ultimateCog" = @(606, 756)
    "cogLeftArrow" = @(98, 623)
    "cogRightArrow" = @(293, 623)
    "deleteCog" = @(1317, 107)
    "depositall" = @(228, 385)
}

$global:WORLDS = @{
    1 = @(125, 425)
    2 = @(125, 375)
    3 = @(125, 325)
    4 = @(125, 275)
    5 = @(125, 225)
    6 = @(125, 175)
}

$global:WORLDONEMAP = @{
    1 = @(1142, 375)
    2 = @(1216, 414)
    3 = @(1060, 450)
    4 = @(1283, 470)
    5 = @(1413, 500)
    6 = @(1500, 540)
    7 = @(1344, 564)
    8 = @(1273, 614)
    9 = @(1111, 683)
    10 = @(1083, 770)
    11 = @(1003, 425)
    12 = @(1345, 378)
    13 = @(1328, 338)
    14 = @(1306, 514)
    15 = @(1498, 443)
    16 = @(1521, 386)
    17 = @(1517, 301)
    18 = @(1552, 465)
    19 = @(1094, 323)
    20 = @(1044, 322)
    21 = @(1001, 302)
    22 = @(826, 350)
    23 = @(639, 369)
    24 = @(716, 392)
    25 = @(759, 448)
    26 = @(568, 476)
    27 = @(687, 491)
}

$global:WORLDTWOMAP = @{
    1 = @()
    2 = @()
    3 = @()
    4 = @()
    5 = @()
    6 = @()
    7 = @()
    8 = @()
    9 = @()
    10 = @()
    11 = @()
    12 = @()
    13 = @()
    14 = @()
    15 = @()
    16 = @()
    17 = @()
    18 = @()
}

$global:WORLDTHREEMAP = @{
    1 = @()
    2 = @()
    3 = @()
    4 = @()
    5 = @()
    6 = @()
    7 = @()
    8 = @()
    9 = @()
    10 = @()
    11 = @()
    12 = @()
    13 = @()
    14 = @()
    15 = @()
    16 = @()
    17 = @()
    18 = @()
}

$global:WORLDFOURMAP = @{
    1 = @()
    2 = @()
    3 = @()
    4 = @()
    5 = @()
    6 = @()
    7 = @()
    8 = @()
    9 = @()
    10 = @()
    11 = @()
    12 = @()
    13 = @()
    14 = @()
    15 = @()
}

$global:WORLDFIVEMAP = @{
    1 = @()
    2 = @()
    3 = @()
    4 = @()
    5 = @()
    6 = @()
    7 = @()
    8 = @()
    9 = @()
    10 = @()
    11 = @()
    12 = @()
    13 = @()
    14 = @()
    15 = @()
}

$global:WORLDSIXMAP = @{
    1 = @()
    2 = @()
    3 = @()
    4 = @()
    5 = @()
    6 = @()
    7 = @()
    8 = @()
    9 = @()
    10 = @()
    11 = @()
    12 = @()
    13 = @()
    14 = @()
    15 = @()
}

$global:SHOPINTERACTION = @{
    "EZACCESS" = @(900, 860)
    "EZACCESSCHECK" = @(600, 600)
    "QUICKBUY" = @(635, 871)
    "QUICKBUYCHECK" = @(662, 860)
    "ITEMONE" = @(675, 400)
    "ITEMTWO" = @(675, 520)
    "ITEMTHREE" = @(675, 650)
    "ITEMFOUR" = @(675, 792)
    "PLUSONE" = @(1040, 342)
    "PLUSTWO" = @(1040, 473)
    "PLUSTHREE" = @(1040, 610)
    "PLUSFOUR" = @(1040, 743)
    "SHOPS" = @(
        @(497, 774),
        @(565, 774),
        @(646, 774),
        @(718, 774),
        @(497, 850),
        @(565, 850),
        @(646, 850),
        @(718, 850)
    )
    "SHOPSSIZES" = @(25, 14, 21, 13, 23, 17, 8, 12)
    #THESE ARE ACTUAL ITEM INDECES IN EACH SHOP
    "SHOPDONTBUY" = @(
        @(12, 15, 16, 17, 18, 19, 20, 21, 22),
        @(6, 7, 10, 11),
        @(11, 12, 13, 14, 15, 17, 20),
        @(0, 1, 2, 3, 4, 5, 6, 9, 10, 11),
        @(3, 4, 11, 12, 13, 14, 15, 16, 17, 20, 21, 22),
        @(0, 1, 4, 12, 13, 14, 15, 16),
        @(6, 7),
        @(8, 9, 10, 11)
    )
    # "SHOP1DONTBUY" = @(8, 11, 12, 13, 14, 15, 16, 17, 18)
    # "SHOP2DONTBUY" = @(2, 3, 6, 7)
    # "SHOP3DONTBUY" = @(7, 8, 9, 10, 11, 13, 16)
    # "SHOP4DONTBUY" = @()
    # "SHOP5DONTBUY" = @(0, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18)
    # "SHOP6DONTBUY" = @(0, 8, 9, 10, 11, 12)
    # "SHOP7DONTBUY" = @(2, 3)
    # "SHOP8DONTBUY" = @(4, 5, 6, 7)
}

$global:COGS = @(
    @(109, 215),
    @(195, 215),
    @(283, 215),
    @(109, 300),
    @(195, 300),
    @(283, 300),
    @(109, 385),
    @(195, 385),
    @(283, 385),
    @(109, 480),
    @(195, 480),
    @(283, 480),
    @(109, 564),
    @(195, 564),
    @(283, 564)
)

#GLOBALS

$global:activeCharacter = 0
$global:activeWorld = 0
$global:activeLevel = 0
$global:activeLevelName = ''
$global:asciiArt = @"
__/\\\\\\\\\\\___/\\\\\\\\\\\\______/\\\_______________/\\\\\\\\\\\\\\\________/\\\\\________/\\\\\_____/\\\_                                                            
 _\/////\\\///___\/\\\////////\\\___\/\\\______________\/\\\///////////_______/\\\///\\\_____\/\\\\\\___\/\\\_                                                           
  _____\/\\\______\/\\\______\//\\\__\/\\\______________\/\\\________________/\\\/__\///\\\___\/\\\/\\\__\/\\\_                                                          
   _____\/\\\______\/\\\_______\/\\\__\/\\\______________\/\\\\\\\\\\\_______/\\\______\//\\\__\/\\\//\\\_\/\\\_                                                         
    _____\/\\\______\/\\\_______\/\\\__\/\\\______________\/\\\///////_______\/\\\_______\/\\\__\/\\\\//\\\\/\\\_                                                        
     _____\/\\\______\/\\\_______\/\\\__\/\\\______________\/\\\______________\//\\\______/\\\___\/\\\_\//\\\/\\\_                                                       
      _____\/\\\______\/\\\_______/\\\___\/\\\______________\/\\\_______________\///\\\__/\\\_____\/\\\__\//\\\\\\_                                                      
       __/\\\\\\\\\\\__\/\\\\\\\\\\\\/____\/\\\\\\\\\\\\\\\__\/\\\\\\\\\\\\\\\_____\///\\\\\/______\/\\\___\//\\\\\_                                                     
        _\///////////___\////////////______\///////////////___\///////////////________\/////________\///_____\/////__


_______/\\\\\________/\\\\\\\\\\\\\\\________/\\\\\________/\\\\____________/\\\\______/\\\\\\\\\______/\\\\\\\\\\\\\\\___/\\\\\\\\\\\___/\\\________/\\\___/\\\_        
 _____/\\\///\\\_____\///////\\\/////_______/\\\///\\\_____\/\\\\\\________/\\\\\\____/\\\\\\\\\\\\\___\///////\\\/////___\/////\\\///___\/\\\_____/\\\//____/\\\_       
  ___/\\\/__\///\\\_________\/\\\__________/\\\/__\///\\\___\/\\\//\\\____/\\\//\\\___/\\\/////////\\\________\/\\\____________\/\\\______\/\\\__/\\\//_______/\\\_      
   __/\\\______\//\\\________\/\\\_________/\\\______\//\\\__\/\\\\///\\\/\\\/_\/\\\__\/\\\_______\/\\\________\/\\\____________\/\\\______\/\\\\\\//\\\_______/\\\_     
    _\/\\\_______\/\\\________\/\\\________\/\\\_______\/\\\__\/\\\__\///\\\/___\/\\\__\/\\\\\\\\\\\\\\\________\/\\\____________\/\\\______\/\\\//_\//\\\______/\\\_    
     _\//\\\______/\\\_________\/\\\________\//\\\______/\\\___\/\\\____\///_____\/\\\__\/\\\/////////\\\________\/\\\____________\/\\\______\/\\\____\//\\\_____///__   
      __\///\\\__/\\\___________\/\\\_________\///\\\__/\\\_____\/\\\_____________\/\\\__\/\\\_______\/\\\________\/\\\____________\/\\\______\/\\\_____\//\\\_________  
       ____\///\\\\\/____________\/\\\___________\///\\\\\/______\/\\\_____________\/\\\__\/\\\_______\/\\\________\/\\\_________/\\\\\\\\\\\__\/\\\______\//\\\___/\\\_ 
        ______\/////______________\///______________\/////________\///______________\///___\///________\///_________\///_________\///////////___\///________\///___\///__
"@

#ANIMATION ##################################################################################################################
function Show-StartupAnimation {
    # Rainbow colors
    $colors = @(
        "Red", "Yellow", "Green", "Cyan", "Blue", "Magenta"
    )

    # Split the ASCII art into lines
    $lines = $global:asciiArt -split "`n"

    # Loading animation: Displays the ASCII art in rainbow colors
    foreach ($line in $lines) {
        $color = $colors[(Get-Random -Minimum 0 -Maximum $colors.Count)]
        Write-Host $line -ForegroundColor $color
        Start-Sleep -Milliseconds 50  # Delay for loading effect
    }
    Start-Sleep -Milliseconds 300
}

#HELPERS ##################################################################################################################

function Reset-Screen {
    # Clear-Host

    # $colors = @(
    #     "Red", "Yellow", "Green", "Cyan", "Blue", "Magenta"
    # )

    # $lines = $global:asciiArt -split "`n"

    # foreach ($line in $lines) {
    #     $color = $colors[(Get-Random -Minimum 0 -Maximum $colors.Count)]
    #     Write-Host $line -ForegroundColor $color
    # }
}

function Generate-Config {
    
}

function Click-Screen {
    param (
        [int]$x,
        [int]$y,
        [int]$hold = 0
    )

    #TODO - Abstract to automatic monitor checking
    $x = $x + ($global:MONITORXOFFSET * $global:MONITOR)
    #y = $y + ($global:MONITORYOFFSET * $global:MONITOR)

    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)

    #click logic
    [MouseController]::mouse_event([MouseController]::MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
    Start-Sleep -Milliseconds $hold
    [MouseController]::mouse_event([MouseController]::MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)

}

function Click-Drag {
    param(
        [int]$c1,
        [int]$c2,
        [int]$c3,
        [int]$c4,
        [int]$step
    )

    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($global:GUIELEMENTS["menu"][0], $global:GUIELEMENTS["menu"][1])
    [MouseController]::mouse_event([MouseController]::MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
    Start-Sleep -Milliseconds 500
    for($x = $c1; $x -lt $c3; $x += $step) {
        for($y = $c2; $y -lt $c4; $y += $step) {
            [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
            Start-Sleep -Milliseconds 1
        }
    }
    [MouseController]::mouse_event([MouseController]::MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
    Start-Sleep -Milliseconds 50
}

function Check-Pixel {
    param (
        [int]$x,
        [int]$y,
        [int]$r,
        [int]$b,
        [int]$g
    )

    $bitmap = New-Object System.Drawing.Bitmap(1, 1)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen($x, $y, 0, 0, [System.Drawing.Size]::new(1,1))
    $color = $bitmap.GetPixel(0, 0)

    $graphics.Dispose()
    $bitmap.Dispose()
    Write-Host $color.R + $color.G + $color.B
    Write-Host $r + $g + $b
    Write-Host ""
    if($color.G -eq $g -and $color.R -eq $r -and $color.B -eq $b) {
        return $true
    }

}

function Reset-Menus {
    Click-Screen -x 1820 -y 980
    Start-Sleep -Milliseconds 150
    [System.Windows.Forms.SendKeys]::SendWait("{ESC}")
    Start-Sleep -Milliseconds 150
}

function Cloud-Save {
    Start-Sleep -Milliseconds 50
    Click-Screen -x $global:GUIELEMENTS["players"][0] -y $global:GUIELEMENTS["players"][1]
    Start-Sleep -Milliseconds 50
    Click-Screen -x $global:GUIELEMENTS["cloudsave"][0] -y $global:GUIELEMENTS["cloudsave"][1]
    Start-Sleep -Milliseconds 2500
}

function Restart-Game {

}

function Select-Character {
    Start-Sleep -Milliseconds 100
    if ($global:activeCharacter -lt 7) {
        Click-Screen -x $global:CHARACTERSELECTION["back"][0] -y $global:CHARACTERSELECTION["back"][1]
        Start-Sleep -Milliseconds 100
        Click-Screen -x $global:CHARACTERSELECTION[[int]$global:activeCharacter][0] -y $global:CHARACTERSELECTION[[int]$global:activeCharacter][1]
    } else {
        Click-Screen -x $global:CHARACTERSELECTION["forward"][0] -y $global:CHARACTERSELECTION["forward"][1]
        Start-Sleep -Milliseconds 100
        Click-Screen -x $global:CHARACTERSELECTION[[int]$global:activeCharacter][0] -y $global:CHARACTERSELECTION[[int]$global:activeCharacter][1]
    }
    Start-Sleep -Milliseconds 100
    Click-Screen -x $global:CHARACTERSELECTION["start"][0] -y $global:CHARACTERSELECTION["start"][1]
    Start-Sleep -Milliseconds 2500
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Milliseconds 500
}

function Reset-Chat {
    Start-Sleep -Milliseconds 100
    [System.Windows.Forms.SendKeys]::SendWait("{ESC}")
    Start-Sleep -Milliseconds 100
    Click-Screen -x $global:GUIELEMENTS["map"][0] -y $global:GUIELEMENTS["map"][1]
    Start-Sleep -Milliseconds 100
    Click-Screen -x $global:WORLDS[[int]1][0] -y $global:WORLDS[[int]1][1]
    Start-Sleep -Milliseconds 100
    Click-Screen -x $global:WORLDS[[int]1][0] -y $global:WORLDS[[int]1][1]
    Start-Sleep -Milliseconds 2500
    [System.Windows.Forms.SendKeys]::SendWait("{ESC}")
    Start-Sleep -Milliseconds 100
    Click-Screen -x $global:GUIELEMENTS["map"][0] -y $global:GUIELEMENTS["map"][1]
    Start-Sleep -Milliseconds 100
    Click-Screen -x $global:WORLDS[[int]2][0] -y $global:WORLDS[[int]2][1]
    Start-Sleep -Milliseconds 100
    Click-Screen -x $global:WORLDS[[int]2][0] -y $global:WORLDS[[int]2][1]
    Start-Sleep -Milliseconds 2500
    Click-Screen -x $global:GUIELEMENTS["map"][0] -y $global:GUIELEMENTS["map"][1]
    Start-Sleep -Milliseconds 100
    Click-Screen -x $global:WORLDS[[int]3][0] -y $global:WORLDS[[int]3][1]
    Start-Sleep -Milliseconds 100
    Click-Screen -x $global:WORLDS[[int]3][0] -y $global:WORLDS[[int]3][1]
}

function Collect-Items {
    Click-Drag -c1 75 -c2 142 -c3 1842 -c4 889 -step 50
}

function Deposit-Inventory {
    Reset-Menus
    Click-Screen -x $global:GUIELEMENTS["codex"][0] -y $global:GUIELEMENTS["codex"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:GUIELEMENTS["storage"][0] -y $global:GUIELEMENTS["storage"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:GUIELEMENTS["depositall"][0] -y $global:GUIELEMENTS["depositall"][1]
    Start-Sleep -Milliseconds 250
    Reset-Menus
}

#SETUP ##################################################################################################################
function Set-Character($character) {
    if ($character -gt 0 -and $character -lt 11) {
        Write-Host "Char $character Selected" -ForegroundColor Green
        $global:activeCharacter = [string]$character
        return $true
    } else {
        Write-Host "Invalid selection. Please try again." -ForegroundColor Red
        return $false
    }
}

function Choose-Character {
    do {
        $characterInput = Read-Host "`nEnter the character # you want to run the idleon scripts on (1-10)"
        if ($characterInput -match '^\d+$' -and [int]$characterInput -gt 0 -and [int]$characterInput -lt 11) {
            $characterChoice = [int]$characterInput
            Set-Character $characterChoice
            break
        } else {
            Write-Host "Invalid input. Please enter a number." -ForegroundColor Red
        }
    } while ($true)
}

function Set-World($world) {
    if ($world -gt 0 -and $world -lt 7) {
        Write-Host "World $world Selected" -ForegroundColor Green
        $global:activeWorld = [string]$world
        return $true
    } else {
        Write-Host "Invalid selection. Please try again." -ForegroundColor Red
        return $false
    }
}

function Choose-World {
    do {
        $worldInput = Read-Host "`nEnter the world # you want to run the idleon scripts on (1-6)"
        if ($worldInput -match '^\d+$' -and [int]$worldInput -gt 0 -and [int]$worldInput -lt 7) {
            $worldChoice = [int]$worldInput
            Set-World $worldChoice
            break
        } else {
            Write-Host "Invalid input. Please enter a number." -ForegroundColor Red
        }
    } while ($true)
}

function Set-Level ($level) {
    switch($global:activeWorld) {
        1 { 
            if ($level -gt 0 -and $level -lt 28) {
                $global:activeLevelName = $global:WORLDONE[$level]
                $global:activeLevel = [string]$level
                return $true
            } else {
                Write-Host "Invalid selection. Please try again." -ForegroundColor Red
                return $false
            }
        }
        2 {
            if ($level -gt 0 -and $level -lt 19) {
                $global:activeLevelName = $global:WORLDTWO[$level]
                $global:activeLevel = [string]$level
                return $true
            } else {
                Write-Host "Invalid selection. Please try again." -ForegroundColor Red
                return $false
            }
        }
        3 {
            if ($level -gt 0 -and $level -lt 19) {
                $global:activeLevelName = $global:WORLDTHREE[$level]
                $global:activeLevel = [string]$level
                return $true
            } else {
                Write-Host "Invalid selection. Please try again." -ForegroundColor Red
                return $false
            }
        }
        4 {
            if ($level -gt 0 -and $level -lt 16) {
                $global:activeLevelName = $global:WORLDFOUR[$level]
                $global:activeLevel = [string]$level
                return $true
            } else {
                Write-Host "Invalid selection. Please try again." -ForegroundColor Red
                return $false
            }
        }
        5 {
            if ($level -gt 0 -and $level -lt 16) {
                $global:activeLevelName = $global:WORLDFIVE[$level]
                $global:activeLevel = [string]$level
                return $true
            } else {
                Write-Host "Invalid selection. Please try again." -ForegroundColor Red
                return $false
            }
        }
        6 {
            if ($level -gt 0 -and $level -lt 16) {
                $global:activeLevelName = $global:WORLDSIX[$level]
                $global:activeLevel = [string]$level
                return $true
            } else {
                Write-Host "Invalid selection. Please try again." -ForegroundColor Red
                return $false
            }
        }
    }
}

function Choose-Level {
    $cp = $false
    do {
        $levelInput = Read-Host "`nEnter the level # you want to run the idleon scripts on (1-x)"
        if ($levelInput -match '^\d+$') {
            $levelChoice = [int]$levelInput
            $cp = Set-Level $levelChoice
        } else {
            Write-Host "Invalid input. Please enter a number." -ForegroundColor Red
        }
    } while ($cp -ne $true)

    return $cp
}

function Process-SubMenu($choice) {
    switch ($choice) {
        1 {
            Write-Host "System Information:" -ForegroundColor Yellow
            Get-ComputerInfo
        }
        2 {
            Write-Host "Running Processes:" -ForegroundColor Yellow
            Get-Process | Select-Object Name, ID, CPU, StartTime
        }
        3 {
            Write-Host "Returning to main menu..." -ForegroundColor Green
        }
        default {
            Write-Host "Invalid selection. Please try again." -ForegroundColor Red
        }
    }
}

function Show-SubMenu {
    do {
        $subMenuOptions = @(
            "Sub-option 1: View system information",
            "Sub-option 2: List running processes",
            "Return to main menu"
        )
        Reset-Screen
        Show-Menu $subMenuOptions "Sub-menu"
        $input = Read-Host "Enter your choice (1-$($subMenuOptions.Count))"
        if ($input -match '^\d+$') {
            $choice = [int]$input
            Process-SubMenu $choice
        } else {
            Write-Host "Invalid input. Please enter a number." -ForegroundColor Red
        }
    } while ($choice -ne $subMenuOptions.Count)  
}


#SHOP BUY ##################################################################################################################
function Iterate-Shops {
    Click-Screen -x $global:GUIELEMENTS["codex"][0] -y $global:GUIELEMENTS["codex"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:GUIELEMENTS["quickref"][0] -y $global:GUIELEMENTS["quickref"][1]
    Start-Sleep -Milliseconds 250
    if(-not (Check-Pixel -x $global:SHOPINTERACTION["EZACCESSCHECK"][0] -y $global:SHOPINTERACTION["EZACCESSCHECK"][1] -r 112 -b 112 -g 112)) {
        Click-Screen -x $global:SHOPINTERACTION["EZACCESS"][0] -y $global:SHOPINTERACTION["EZACCESS"][1]
    }
    Start-Sleep -Milliseconds 250
    for($shop = 0; $shop -lt $global:SHOPINTERACTION["SHOPS"].Length; $shop++) {
        Click-Screen -x $global:SHOPINTERACTION["SHOPS"][$shop][0] -y $global:SHOPINTERACTION["SHOPS"][$shop][1]
        Start-Sleep -Milliseconds 300
        #COMMENT THIS FOR TESTING THE SHOP PURCHASING
        if(Check-Pixel -x $global:SHOPINTERACTION["QUICKBUYCHECK"][0] -y $global:SHOPINTERACTION["QUICKBUYCHECK"][1] -r 169 -b 169 -g 169) {
            Click-Screen -x $global:SHOPINTERACTION["QUICKBUY"][0] -y $global:SHOPINTERACTION["QUICKBUY"][1]
            Start-Sleep -Milliseconds 250
        }
        Start-Sleep -Milliseconds 250
        for($item = 0; $item -lt $global:SHOPINTERACTION["SHOPSSIZES"][$shop]; $item++) {
            #Write-Host $shop + $item
            # #REALIZATION! -> SCROLLING ALWAYS EVEN IF SKIP IS IN FIRST FOUR, FIX!
            # if($item -in $global:SHOPINTERACTION["SHOPDONTBUY"][$shop]) {
            #     [MouseController]::mouse_event([MouseController]::MOUSEEVENTF_WHEEL, 0, 0, -[MouseController]::WHEEL_DELTA, 0)
            #     Write-Host "skipped"
            #     Start-Sleep -Milliseconds 250
            # }

            if($item -in $global:SHOPINTERACTION["SHOPDONTBUY"][$shop]) {
                if($item -gt 3) {
                    [MouseController]::mouse_event([MouseController]::MOUSEEVENTF_WHEEL, 0, 0, -[MouseController]::WHEEL_DELTA, 0)
                    Start-Sleep -Milliseconds 250
                }
                continue
            }
            elseif($item -lt 4) {
                switch($item) {
                    0 {
                        Click-Screen -x $global:SHOPINTERACTION["PLUSONE"][0] -y $global:SHOPINTERACTION["PLUSONE"][1]
                        Start-Sleep -Milliseconds 250
                        Click-Screen -x $global:SHOPINTERACTION["ITEMONE"][0] -y $global:SHOPINTERACTION["ITEMONE"][1]
                        Start-Sleep -Milliseconds 250
                    }
                    1 {
                        Click-Screen -x $global:SHOPINTERACTION["PLUSTWO"][0] -y $global:SHOPINTERACTION["PLUSTWO"][1]
                        Start-Sleep -Milliseconds 250
                        Click-Screen -x $global:SHOPINTERACTION["ITEMTWO"][0] -y $global:SHOPINTERACTION["ITEMTWO"][1]
                        Start-Sleep -Milliseconds 250
                    }
                    2 {
                        Click-Screen -x $global:SHOPINTERACTION["PLUSTHREE"][0] -y $global:SHOPINTERACTION["PLUSTHREE"][1]
                        Start-Sleep -Milliseconds 250
                        Click-Screen -x $global:SHOPINTERACTION["ITEMTHREE"][0] -y $global:SHOPINTERACTION["ITEMTHREE"][1]
                        Start-Sleep -Milliseconds 250
                    }
                    3 {
                        Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
                        Start-Sleep -Milliseconds 250
                        Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
                        Start-Sleep -Milliseconds 250
                    }
                }
            } else {
                [MouseController]::mouse_event([MouseController]::MOUSEEVENTF_WHEEL, 0, 0, -[MouseController]::WHEEL_DELTA, 0)
                Start-Sleep -Milliseconds 250
                if($shop -eq 1 -and $item -eq 9) {
                    Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
                    Start-Sleep -Milliseconds 250
                    Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
                    Start-Sleep -Milliseconds 250
                    Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
                    Start-Sleep -Milliseconds 250
                    continue
                }
                Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
                Start-Sleep -Milliseconds 250
                Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
                Start-Sleep -Milliseconds 250
            }
        }
        Deposit-Inventory
        Start-Sleep -Milliseconds 250
        Click-Screen -x $global:GUIELEMENTS["codex"][0] -y $global:GUIELEMENTS["codex"][1]
        Start-Sleep -Milliseconds 250
    }
    Reset-Menus
}

#GEM FARMING ######################################################################################################################
function Gem-Farming {
    Reset-Menus
    #First Teleport
    Click-Screen -x 155 -y 760
    Start-Sleep -Milliseconds 2500
    Click-Screen -x 860 -y 300
    Start-Sleep -Milliseconds 3250
    Click-Screen -x 1300 -y 550
    Start-Sleep -Milliseconds 11000
    Click-Screen -x 370 -y 777
    Start-Sleep -Milliseconds 2750
    for($i = 0; $i -lt 2500; $i++) {
        Write-Host $i
        Click-Screen -x 700 -y 500
        Start-Sleep -Milliseconds 750
        Click-Screen -x 860 -y 300
        Start-Sleep -Milliseconds 3250
        Click-Screen -x 1200 -y 550
        Start-Sleep -Milliseconds 11000
        Click-Screen -x 450 -y 800
        Start-Sleep -Milliseconds 2750
    }
}

#COG FARMING ######################################################################################################################
function Cog-Functionality($buffer) {

    $numTrue = 0

    Reset-Menus
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:GUIELEMENTS["codex"][0] -y $global:GUIELEMENTS["codex"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:GUIELEMENTS["quickref"][0] -y $global:GUIELEMENTS["quickref"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:GUIELEMENTS["construction"][0] -y $global:GUIELEMENTS["construction"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:GUIELEMENTS["cogs"][0] -y $global:GUIELEMENTS["cogs"][1]
    Start-Sleep -Milliseconds 250

    while(-not (Check-Pixel -x $global:GUIELEMENTS["constructionEXP"][0] -y $global:GUIELEMENTS["constructionEXP"][1] -r 247 -b 255 -g 250)) {
        Click-Screen -x $global:GUIELEMENTS["constructionEXP"][0] -y $global:GUIELEMENTS["constructionEXP"][1]
        Start-Sleep -Milliseconds 500
    }

    while(-not (Check-Pixel -x $global:GUIELEMENTS["cogShelf"][0] -y $global:GUIELEMENTS["cogShelf"][1] -r 230 -b 107 -g 165)) {
        Click-Screen -x $global:GUIELEMENTS["cogShelf"][0] -y $global:GUIELEMENTS["cogShelf"][1]
        Start-Sleep -Milliseconds 500
    }

    while(-not (Check-Pixel -x $global:GUIELEMENTS["deleteCog"][0] -y $global:GUIELEMENTS["deleteCog"][1] -r 230 -b 107 -g 165)) {
        Click-Screen -x $global:GUIELEMENTS["deleteCog"][0] -y $global:GUIELEMENTS["deleteCog"][1]
        Start-Sleep -Milliseconds 500
    }

    for($i = 0; $i -lt (120 - $numTrue); $i++) {
        Click-Screen -x $global:GUIELEMENTS["ultimateCog"][0] -y $global:GUIELEMENTS["ultimateCog"][1]
        Start-Sleep -Milliseconds 250
    }

    for($j = 0; $j -lt 9; $j++) {
        Click-Screen -x $global:GUIELEMENTS["cogLeftArrow"][0] -y $global:GUIELEMENTS["cogLeftArrow"][1]
        Start-Sleep -Milliseconds 250
    }

    for($k = 0; $k -lt 8; $k++) {
        $bitmap = New-Object System.Drawing.Bitmap 264, 448
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
        $graphics.CopyFromScreen(65, 173, 0, 0, $bitmap.Size)
        $bitmap.Save(".\ocr_image.png", [System.Drawing.Imaging.ImageFormat]::Png)
        $graphics.Dispose()
        $bitmap.Dispose()

        $ocrOutput = python ".\ocr.py" ".\ocr_image.png" | ConvertFrom-Json

        if($ocrOutput.error) {
            Write-Host "OCR ERROR"
            Click-Screen -x $global:GUIELEMENTS["cogRightArrow"][0] -y $global:GUIELEMENTS["cogRightArrow"][1]
            Start-Sleep -Milliseconds 250
        } else {
            $index = 0
            foreach($cog in $ocrOutput.digits) {
                Write-Host $cog
                if([int]$cog -lt $buffer) {
                    Click-Screen -x $global:COGS[$index][0] -y $global:COGS[$index][1]
                    Start-Sleep -Milliseconds 250
                } else {
                    $numTrue++;
                }
                $index++
            }
            Click-Screen -x $global:GUIELEMENTS["cogRightArrow"][0] -y $global:GUIELEMENTS["cogRightArrow"][1]
            Start-Sleep -Milliseconds 250
        }
    }

    if($numTrue -gt 50) {
        return $false
    } else {
        return $true
    }

}

function Cog-Farming {
    #Ask for Buffer
    #Reset Menus
    #Open Codex
    #Open Construction
    #Open Cogs
    #Check for white pixel in P for (EXP), if not, click the eye
    #Open Cog Shelf
    #do while goodCogs < len(buffer2)
        #Click Ultimate Cog Collect 120-len(buffer2) Times
        #Click Left Page Arrow 9 Times
        #For Each Cog Page (8)
            #Take ScreenShot of Cog Page
                #Iterate through each cog, do OCR
                    #if cog is already good -> skip
                    #else
                        #if Cog > Buffer -> Make note if it to skip (array of arrays or something)
                        #else -> delete cog

    do {
        Write-Host "Enter the buffer % you are desiring"
        $cogBuffer = Read-Host
        if ($cogBuffer -match '^\d+$') {
            $choice = [int]$cogBuffer
            $ret = $true
            do {
                Write-Host "Starting Cog Script..."
                Start-Sleep -Milliseconds 5000
                $ret = Cog-Functionality $choice
            } while($ret)
            break
        } else {
            Write-Host "Invalid input. Please enter a number." -ForegroundColor Red
        }
    } while($true)
}

function Post-Office {
    Click-Screen -x 316 -y 170
    Start-Sleep -Milliseconds 250
    for($i = 0; $i -lt 5550; $i++) {
        Click-Screen -x 158 -y 856
        Start-Sleep -Milliseconds 150
        Click-Screen -x 654 -y 776
        Start-Sleep -Milliseconds 50
        Click-Screen -x 654 -y 776
        Start-Sleep -Milliseconds 150
    }
    [System.Windows.Forms.SendKeys]::SendWait("{ESC}")
}

#CANDY TEST #################################################################################################################
function Candy-Testing {
    for($i = 0; $i -lt 10; $i++) {
        Reset-Menus
        Start-Sleep -Milliseconds 250
        [System.Windows.Forms.SendKeys]::SendWait("{I}")
        Click-Screen -x 1325 -y 470 -hold 300
        Start-Sleep -Milliseconds 250
        [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
        Start-Sleep -Milliseconds 250
        Reset-Menus
        Start-Sleep -Milliseconds 250
        [System.Windows.Forms.SendKeys]::SendWait("{C}")
        Start-Sleep -Milliseconds 250
        Click-Screen -x 905 -y 378
        Start-Sleep -Milliseconds 250
        Click-Screen -x 1015 -y 228
        Start-Sleep -Milliseconds 250
        Click-Screen -x 885 -y 226
        Start-Sleep -Milliseconds 250
        Reset-Menus
    }
}

#GAMING #########################################################################################################################
function Harvest-All($speed) {
    for ($i = 0; $i -lt 80; $i++) {
        Click-Screen -x 1347 -y 76
        Start-Sleep -Milliseconds $speed
    }
}

function Clear-Screen {
    for ($j = 0; $j -lt 14; $j++) {
        for ($k = 0; $k -lt 8; $k++) {
            if ((($j -eq 0) -or ($j -eq 1) -or ($j -eq 13)) -and ($k -eq 7)) {
                continue
            } else {
                Click-Screen -x (($j*75) + 300) -y (($k*90) + 100)
                Start-Sleep -Milliseconds 150
                if(-not(Check-Pixel -x 143 -y 121 -r 46 -b 46 -g 46)) {
                    Click-Screen -x 143 -y 121
                    Click-Screen -x 1318 -y 765
                    Start-Sleep -Milliseconds 6000
                }
                Click-Screen -x 143 -y 121
            }
        }
    }
}

function Gaming {
    Reset-Menus
    Start-Sleep -Milliseconds 250
    [System.Windows.Forms.SendKeys]::SendWait("{C}")
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:GUIELEMENTS["gaming"][0] -y $global:GUIELEMENTS["gaming"][1]
    Start-Sleep -Milliseconds 250
    Start-Sleep -Milliseconds 3000
    for ($a = 0; $a -lt 100; $a++) {
        Harvest-All(4000)
        Clear-Screen
    }
    Start-Sleep -Milliseconds 10000
}

#DEV CYCLE ##################################################################################################################

function Dev {
    Write-Host "Function Starting in 5000 ms`nPlease put Idleon (Steam) Full Window on your first monitor`nPlease put your terminal on your second monitor"
    Start-Sleep -Milliseconds 5000
    Reset-Menus
    Start-Sleep -Milliseconds 100
    Cloud-Save
    Start-Sleep -Milliseconds 100
    Select-Character
    Start-Sleep -Milliseconds 100
    Collect-Items
    Start-Sleep -Milliseconds 100
    Reset-Chat
    Start-Sleep -Milliseconds 100
}

#MAIN MENU########################################################################################################################

function Show-Menu($menuOptions, $menuName) {
    Write-Host "`n${menuName}:" -ForegroundColor Cyan
    for ($i = 0; $i -lt $menuOptions.Count; $i++) {
        Write-Host "$($i + 1). $($menuOptions[$i])"
    }
}

function Process-MainMenu($choice) {
    switch ($choice) {
        1 { Choose-Character }
        2 { 
            Choose-World 
            Choose-Level
        }
        3 {
            Choose-Level
        }
        4 {
            Show-SubMenu
        }
        5{
            Gaming
        }
        6 {
            Write-Host "This Function only implemented for gem farming W5 boss, more functionality soon TM"
            Gem-Farming
        }
        8 {
            Cog-Farming
        }
        9 {
            for($i = 0; $i -lt 20; $i++) {
                Click-Screen -x 1175 -y 820
                Start-Sleep -Milliseconds 50
                Click-Screen -x 1520 -y 855
                Start-Sleep -Milliseconds 50
            }
        }
        11 {
            Reset-Menus
            Iterate-Shops
        }
        13 {
            Candy-Testing
        }
        14 {
            Post-Office
        }
        15 {
            Dev
        }
        17 {
            Reset-Screen
            Write-Host "Exiting the script. Goodbye!" -ForegroundColor Green
            Start-Sleep -Milliseconds 400
            exit
        }
        default {
            Write-Host "Invalid selection. Please try again." -ForegroundColor Red
        }
    }
}


#MAIN LOOP########################################################################################################################

function MainLoop {

    Generate-Config

    do {
        Reset-Screen
        $checkPoint = Choose-Character
    } while($checkPoint -ne $true)

    do {
        Reset-Screen
        $checkPoint2 = Choose-World
    } while($checkPoint2 -ne $true)

    do {
        Reset-Screen
        $checkPoint3 = Choose-Level
    } while($checkPoint3 -ne $true)

    do {
        Reset-Screen
        $menuChoice = ""
        $mainMenuOptions = @(
            "Change Character | Current Character: '$global:activeCharacter'",
            "Change World | Current World: '$global:activeWorld'",
            "Change Level | Current Level: '$global:activeLevelName'",
            "Sub Menu Test",
            "Fast Gaming",
            "Boss Farming"
            "Bubo Farming",
            "Cog Farming",
            "Breeding Exp Farming",
            "Candying Bubbles",
            "Daily Claim (Buying Shops, etc)",
            "Two Minute Archer Claims"
            "Candy Test"
            "Post Office"
            "[Dev] Basic Farming"
            "Settings",
            "Exit"
        )
        Reset-Screen
        Show-Menu $mainMenuOptions "Main Menu"
        $menuChoice = Read-Host "Enter your choice (1-$($mainMenuOptions.Count))"
        if ($menuChoice -match '^\d+$') {
            $choice = [int]$menuChoice
            Process-MainMenu $choice
        } else {
            Write-Host "Invalid input. Please enter a number." -ForegroundColor Red
        }
    } while ($true)
}   

#Show-StartupAnimation
MainLoop