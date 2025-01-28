Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Add-Type @"
using System;
using System.Runtime.InteropServices;

public class MouseControl {
    [DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, int cButtons, uint dwExtraInfo);

    public const int MOUSEEVENTF_WHEEL = 0x0800;
    public const int WHEEL_DELTA = 120;
}
"@

#CONSTANTS

#TODO - ADD WAY TO KILL BONEMEAL DUDES TO DAILIES

$global:MONITORXOFFSET = 1920
$global:MONITORYOFFSET = 1080
#Works horizontally atm
$global:MONITOR = 0

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
    "storage" = @(1111, 370)
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
    #THESE ARE ACTUAL ITEM INDECES STARTING AT THE 5TH ITEM IN EVERY SHOP
    "SHOP1DONTBUY" = @(8, 11, 12, 13, 14, 15, 16, 17, 18)
    "SHOP2DONTBUY" = @(2, 3, 6, 7)
    "SHOP3DONTBUY" = @(7, 8, 9, 10, 11, 13, 16)
    "SHOP4DONTBUY" = @()
    "SHOP5DONTBUY" = @(0, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18)
    "SHOP6DONTBUY" = @(0, 8, 9, 10, 11, 12)
    "SHOP7DONTBUY" = @(2, 3)
    "SHOP8DONTBUY" = @(4, 5, 6, 7)
}

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

function Click-Screen {
    param (
        [int]$x,
        [int]$y,
        [int[]]$box = @(),
        [int]$hold = 0
    )

    #TODO - Abstract to automatic monitor checking
    $x = $x + ($global:MONITORXOFFSET * $global:MONITOR)
    #y = $y + ($global:MONITORYOFFSET * $global:MONITOR)

    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)

    $signature = @'
    [DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
    public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
'@

    Add-Type -MemberDefinition $signature -Name 'MouseEvent' -Namespace 'Win32'
    $MOUSEEVENTF_MOVE = 0x01
    $MOUSEEVENTF_LEFTDOWN = 0x02
    $MOUSEEVENTF_LEFTUP = 0x04
    
    if($box.length -eq 4) {
        #drag logic
    } else {
        #click logic
        [Win32.MouseEvent]::mouse_event($MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
        Start-Sleep -Milliseconds $hold
        [Win32.MouseEvent]::mouse_event($MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
    }
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
function Shop-One {
    Click-Screen -x $global:SHOPINTERACTION["PLUSONE"][0] -y $global:SHOPINTERACTION["PLUSONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMONE"][0] -y $global:SHOPINTERACTION["ITEMONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTWO"][0] -y $global:SHOPINTERACTION["PLUSTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTWO"][0] -y $global:SHOPINTERACTION["ITEMTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTHREE"][0] -y $global:SHOPINTERACTION["PLUSTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTHREE"][0] -y $global:SHOPINTERACTION["ITEMTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
    Start-Sleep -Milliseconds 250
    for ($i = 0; $i -lt 21; $i++) {
        [MouseControl]::mouse_event([MouseControl]::MOUSEEVENTF_WHEEL, 0, 0, -[MouseControl]::WHEEL_DELTA, 0)
        Start-Sleep -Milliseconds 250
        if($i -in $global:SHOPINTERACTION["SHOP1DONTBUY"]) {
            continue
        }
        Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
        Start-Sleep -Milliseconds 250
        Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
        Start-Sleep -Milliseconds 250
    }
}

function Shop-Two {
    Click-Screen -x $global:SHOPINTERACTION["PLUSONE"][0] -y $global:SHOPINTERACTION["PLUSONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMONE"][0] -y $global:SHOPINTERACTION["ITEMONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTWO"][0] -y $global:SHOPINTERACTION["PLUSTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTWO"][0] -y $global:SHOPINTERACTION["ITEMTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTHREE"][0] -y $global:SHOPINTERACTION["PLUSTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTHREE"][0] -y $global:SHOPINTERACTION["ITEMTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
    Start-Sleep -Milliseconds 250
    for ($i = 0; $i -lt 9; $i++) {
        [MouseControl]::mouse_event([MouseControl]::MOUSEEVENTF_WHEEL, 0, 0, -[MouseControl]::WHEEL_DELTA, 0)
        Start-Sleep -Milliseconds 250
        if($i -in $global:SHOPINTERACTION["SHOP2DONTBUY"]) {
            continue
        }
        if($i -eq 5) {
            for($j = 0; $j -lt 3; $j++) {
                Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
                Start-Sleep -Milliseconds 250
                Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
                Start-Sleep -Milliseconds 250
            }
            continue
        }
        Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
        Start-Sleep -Milliseconds 250
        Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
        Start-Sleep -Milliseconds 250
    }
}

function Shop-Three {
    Click-Screen -x $global:SHOPINTERACTION["PLUSONE"][0] -y $global:SHOPINTERACTION["PLUSONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMONE"][0] -y $global:SHOPINTERACTION["ITEMONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTWO"][0] -y $global:SHOPINTERACTION["PLUSTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTWO"][0] -y $global:SHOPINTERACTION["ITEMTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTHREE"][0] -y $global:SHOPINTERACTION["PLUSTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTHREE"][0] -y $global:SHOPINTERACTION["ITEMTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
    Start-Sleep -Milliseconds 250
    for ($i = 0; $i -lt 16; $i++) {
        [MouseControl]::mouse_event([MouseControl]::MOUSEEVENTF_WHEEL, 0, 0, -[MouseControl]::WHEEL_DELTA, 0)
        Start-Sleep -Milliseconds 250
        if($i -in $global:SHOPINTERACTION["SHOP3DONTBUY"]) {
            continue
        }
        Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
        Start-Sleep -Milliseconds 250
        Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
        Start-Sleep -Milliseconds 250
    }
}

function Shop-Four {
    
}

function Shop-Five {
    Click-Screen -x $global:SHOPINTERACTION["PLUSONE"][0] -y $global:SHOPINTERACTION["PLUSONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMONE"][0] -y $global:SHOPINTERACTION["ITEMONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTWO"][0] -y $global:SHOPINTERACTION["PLUSTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTWO"][0] -y $global:SHOPINTERACTION["ITEMTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTHREE"][0] -y $global:SHOPINTERACTION["PLUSTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTHREE"][0] -y $global:SHOPINTERACTION["ITEMTHREE"][1]
    Start-Sleep -Milliseconds 250
    for ($i = 0; $i -lt 19; $i++) {
        [MouseControl]::mouse_event([MouseControl]::MOUSEEVENTF_WHEEL, 0, 0, -[MouseControl]::WHEEL_DELTA, 0)
        Start-Sleep -Milliseconds 250
        if($i -in $global:SHOPINTERACTION["SHOP5DONTBUY"]) {
            continue
        }
        Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
        Start-Sleep -Milliseconds 250
        Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
        Start-Sleep -Milliseconds 250
    }
}

function Shop-Six {
    Click-Screen -x $global:SHOPINTERACTION["PLUSTHREE"][0] -y $global:SHOPINTERACTION["PLUSTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTHREE"][0] -y $global:SHOPINTERACTION["ITEMTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
    Start-Sleep -Milliseconds 250
    for ($i = 0; $i -lt 13; $i++) {
        [MouseControl]::mouse_event([MouseControl]::MOUSEEVENTF_WHEEL, 0, 0, -[MouseControl]::WHEEL_DELTA, 0)
        Start-Sleep -Milliseconds 250
        if($i -in $global:SHOPINTERACTION["SHOP6DONTBUY"]) {
            continue
        }
        Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
        Start-Sleep -Milliseconds 250
        Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
        Start-Sleep -Milliseconds 250
    }
}

function Shop-Seven {
    Click-Screen -x $global:SHOPINTERACTION["PLUSONE"][0] -y $global:SHOPINTERACTION["PLUSONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMONE"][0] -y $global:SHOPINTERACTION["ITEMONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTWO"][0] -y $global:SHOPINTERACTION["PLUSTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTWO"][0] -y $global:SHOPINTERACTION["ITEMTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTHREE"][0] -y $global:SHOPINTERACTION["PLUSTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTHREE"][0] -y $global:SHOPINTERACTION["ITEMTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
    Start-Sleep -Milliseconds 250
    for ($i = 0; $i -lt 4; $i++) {
        [MouseControl]::mouse_event([MouseControl]::MOUSEEVENTF_WHEEL, 0, 0, -[MouseControl]::WHEEL_DELTA, 0)
        Start-Sleep -Milliseconds 250
        if($i -in $global:SHOPINTERACTION["SHOP7DONTBUY"]) {
            continue
        }
        Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
        Start-Sleep -Milliseconds 250
        Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
        Start-Sleep -Milliseconds 250
    }
}

function Shop-Eight {
    Click-Screen -x $global:SHOPINTERACTION["PLUSONE"][0] -y $global:SHOPINTERACTION["PLUSONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMONE"][0] -y $global:SHOPINTERACTION["ITEMONE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTWO"][0] -y $global:SHOPINTERACTION["PLUSTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTWO"][0] -y $global:SHOPINTERACTION["ITEMTWO"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSTHREE"][0] -y $global:SHOPINTERACTION["PLUSTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMTHREE"][0] -y $global:SHOPINTERACTION["ITEMTHREE"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
    Start-Sleep -Milliseconds 250
    Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
    Start-Sleep -Milliseconds 250
    for ($i = 0; $i -lt 8; $i++) {
        [MouseControl]::mouse_event([MouseControl]::MOUSEEVENTF_WHEEL, 0, 0, -[MouseControl]::WHEEL_DELTA, 0)
        Start-Sleep -Milliseconds 250
        if($i -in $global:SHOPINTERACTION["SHOP8DONTBUY"]) {
            continue
        }
        Click-Screen -x $global:SHOPINTERACTION["PLUSFOUR"][0] -y $global:SHOPINTERACTION["PLUSFOUR"][1]
        Start-Sleep -Milliseconds 250
        Click-Screen -x $global:SHOPINTERACTION["ITEMFOUR"][0] -y $global:SHOPINTERACTION["ITEMFOUR"][1]
        Start-Sleep -Milliseconds 250
    }
}


function Iterate-Shops {
    Click-Screen -x $global:GUIELEMENTS["codex"][0] -y $global:GUIELEMENTS["codex"][1]
    Start-Sleep -Milliseconds 250
    if(-not (Check-Pixel -x $global:SHOPINTERACTION["EZACCESSCHECK"][0] -y $global:SHOPINTERACTION["EZACCESSCHECK"][1] -r 112 -b 112 -g 112)) {
        Click-Screen -x $global:SHOPINTERACTION["EZACCESS"][0] -y $global:SHOPINTERACTION["EZACCESS"][1]
    }
    Start-Sleep -Milliseconds 250
    for($i = 0; $i -lt $global:SHOPINTERACTION["SHOPS"].Length; $i++) {
        Click-Screen -x $global:SHOPINTERACTION["SHOPS"][$i][0] -y $global:SHOPINTERACTION["SHOPS"][$i][1]
        Start-Sleep -Milliseconds 300
        #COMMENT THIS FOR TESTING THE SHOP PURCHASING
        if(Check-Pixel -x $global:SHOPINTERACTION["QUICKBUYCHECK"][0] -y $global:SHOPINTERACTION["QUICKBUYCHECK"][1] -r 169 -b 169 -g 169) {
            Click-Screen -x $global:SHOPINTERACTION["QUICKBUY"][0] -y $global:SHOPINTERACTION["QUICKBUY"][1]
            Start-Sleep -Milliseconds 250
        }
        Start-Sleep -Milliseconds 250
        switch($i) {
            0 {
                Shop-One
            }
            1 {
                Shop-Two
            }
            2 {
                Shop-Three
            }
            3{
                Shop-Four
            }
            4 {
                Shop-Five
            }
            5 {
                Shop-Six
            }
            6 {
                Shop-Seven
            }
            7 {
                Shop-Eight
            }
        }
        Deposit-Inventory
        Start-Sleep -Milliseconds 250
        Click-Screen -x $global:GUIELEMENTS["codex"][0] -y $global:GUIELEMENTS["codex"][1]
        Start-Sleep -Milliseconds 250
    }
    Reset-Menus
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
    Reset-Chat
    Start-Sleep -Milliseconds 100
    Collect-Items
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
        5 {
            do {
                Reset-Screen
                Write-Host "Press Ctrl+C in the terminal to stop at any time"
                Write-Host "omg hiii"
                Start-Sleep -Milliseconds 75
            } while ($true)
        }
        8 {
            for($i = 0; $i -lt 20; $i++) {
                Click-Screen -x 1175 -y 820
                Start-Sleep -Milliseconds 50
                Click-Screen -x 1520 -y 855
                Start-Sleep -Milliseconds 50
            }
        }
        10 {
            Reset-Menus
            Iterate-Shops
        }
        12 {
            Dev
        }
        13 {
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
            "Gaming",
            "Boss Farming"
            "Bubo Farming",
            "Cog Farming",
            "Breeding Exp Farming",
            "Candying Bubbles",
            "Daily Claim (Buying Shops, etc)",
            "Two Minute Archer Claims"
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