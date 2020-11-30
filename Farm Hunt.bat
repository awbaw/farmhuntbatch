@echo off
Title Farm Hunt

:sets
set pistolbullets=3
set sniperbullets=2
set grenadebullets=1
set cash=5
set equip=1
set pistol_have=1
set huntingrifle_have=0
set bazooka_have=0
set pistol=1
set huntingrifle=3
set bazooka=5
set duckhp=3
set horsehp=9
set cowhp=15

:titlescreen
cls
echo ~FARM HUNT~
echo.
echo V1.1
echo.
echo 1. Start
echo 2. How to Play
echo 3. Credits
echo 4. Changelog
echo 5. Known Bugs/Bug Report
echo 6. Extra Modes (COMING SOON)
echo 7. Exit
set /p answer1=
if %answer1% == 1 goto start
if %answer1% == 2 goto howtoplay
if %answer1% == 3 goto credits
if %answer1% == 4 goto changelog
if %answer1% == 5 goto bugs
if %answer1% == 6 goto modes
if %answer1% == 7 exit
goto titlescreen

:modes
cls
echo These are extra gamemodes to play! (COMING SOON, BROKEN AS OF V1.1)
echo.
echo 1. Start with $50
echo 2. Need $500 to win
echo 3. Enemies have more health
echo 4. Go back
set /p answer8=
if %answer8% == 1 (
set cash=50
goto start
)
if %answer8% == 2 goto 500start
if %answer8% == 3 goto bigenemystart
:bugs
cls
echo Bug 1. You can buy multiple of the same gun from the store
echo Bug 2. Possible softlock if you run out of money and ammo, might make this a lose condition
echo Bug 3. Can only hunt the animals with specific guns
echo.
echo Report bugs to davybubby4321@gmail.com
echo.
pause
goto titlescreen

:credits
cls
echo CREDITS:
echo.
echo Game Design: David Quart
echo Programming: David Quart
echo.
pause
goto titlescreen

:changelog
cls
echo V0.1
echo Game Created 7/2/2020
echo.
echo V1.0
echo Added working store, inventory, 3 animals to hunt, 3 guns to use, credits, known bugs/bug report sections, and most importantly a win condition! 7/4/2020
echo.
echo V1.1
echo Started dev on extra gamemodes, bug fixes, player starts with $5 now,  8/5/2020
echo.
pause
goto titlescreen

:start
if %cash% GEQ 100 goto win
cls
echo Equiped Item Damage = %equip% Damage
echo (1=Pistol, 2=Hunting Rifle, 3=Bazooka)
echo Pistol Bullets = %pistolbullets%
echo Hunting Rifle Bullets = %sniperbullets%
echo Bazooka Bullets = %grenadebullets%
echo Cash = $%cash%
echo.
echo 1. Hunt a duck (Must equip Pistol)
echo 2. Hunt a horse (Must equip Hunting Rifle)
echo 3. Hunt a cow (Must equip Bazooka)
echo.
echo 4. Go to the shop
echo.
echo 5. Inventory
echo.
echo 6. Title Screen
set /p answer2=
if %answer2% == 1 (
if %equip% EQU 1 goto duck 
goto start
)
if %answer2% == 2 (
if %equip% EQU 3 goto horse
goto start
)
if %answer2% == 3 (
if %equip% EQU 5 goto cow
goto start
)
if %answer2% == 4 goto shop
if %answer2% == 5 goto inventory
if %answer2% == 6 goto transition
goto start

:inventory
cls
echo Pistol Bullets = %pistolbullets%
echo Hunting Rifle Bullets = %sniperbullets%
echo Bazooka Bullets = %grenadebullets%
echo Cash = $%cash%
echo Equiped Item Damage = %equip%
echo Pistol = 1 dmg
echo Hunting Rifle = 3 dmg
echo Bazooka = 5 dmg
echo.
echo 1. Equip Pistol
echo 2. Equip Hunting Rifle (Must Buy from Shop)
echo 3. Equip Bazooka (Must Buy from Shop)
echo 4. Go Back
set /p answer4=
if %answer4% == 1 (
set equip=1
goto inventory
)
if %answer4% == 2 (
if %huntingrifle_have% LSS 1 goto notbought
set equip=3
goto inventory
)
if %answer4% == 3 (
if %bazooka_have% LSS 1 goto notbought
set equip=5
goto inventory
)
if %answer4% == 4 goto start
goto inventory

:notbought
cls
echo You haven't bought this item from the store!
echo.
pause
goto inventory

:nobulletsduck
cls
echo You don't have any more bullets!
echo.
pause
goto duck

:duck
cls
echo Cash = $%cash%
echo Equiped Item Damage = %equip% Damage
echo Pistol Bullets = %pistolbullets%
echo Ducks HP = %duckhp%
echo.
echo There is a duck
echo.
echo 1. Shoot
echo 2. Run (Duck's HP will regen)
set /p answer5= 
if %answer5% == 1 (
if %pistolbullets% LSS 1 goto nobulletsduck
set /a duckhp= %duckhp% - %equip%
set /a pistolbullets= %pistolbullets% - 1
if %duckhp% EQU 1 goto duckwin
)
if %answer5% == 2 (
set duckhp=3
goto start
)
goto duck

:duckwin
set duckhp=3
cls
echo You killed the duck!
echo.
echo You are rewarded with $5!
echo.
pause
set /a cash= %cash% + 5
goto start

:horse
cls
echo Cash = $%cash%
echo Equiped Item Damage = %equip% Damage
echo Hunting Rifle Bullets = %sniperbullets%
echo Horse HP = %horsehp%
echo.
echo 1. Shoot
echo 2. Run (Horse's HP will regen)
set /p answer6= 
if %answer6% == 1 (
if %sniperbullets% LSS 1 goto nobulletshorse
set /a horsehp= %horsehp% - %equip%
set /a sniperbullets= %sniperbullets% - 1
if %horsehp% LEQ 3 goto horsewin
)
if %answer6% == 2 (
set horsehp = 9
goto start
)
goto horse

:horsewin
set horsehp=9
cls
echo You killed the horse!
echo.
echo You are rewarded with $15!
echo.
pause
set /a cash= %cash% + 15
goto start


:nobulletshorse
cls
echo You don't have any more bullets!
echo.
pause
goto horse

:cow
cls
echo Cash = $%cash%
echo Equiped Item Damage = %equip% Damage
echo Bazooka Bullets = %grenadebullets%
echo Cow HP = %cowhp%
echo.
echo 1. Shoot
echo 2. Run (Cow's HP will regen)
set /p answer7= 
if %answer7% == 1 (
if %grenadebullets% LSS 1 goto nobulletscow
set /a cowhp= %cowhp% - %equip%
set /a grenadebullets= %grenadebullets% - 1
if %cowhp% LEQ 5 goto cowwin
)
if %answer7% == 2 (
set cowhp = 15
goto start
)
goto cow

:cowwin
set cowhp=15
cls
echo You killed the cow!
echo.
echo You are rewarded with $40!
echo.
pause
set /a cash= %cash% + 40
goto start

:nobulletscow
cls
echo You don't have any more bullets!
echo.
pause
goto cow

:shop
cls
echo Cash = $%cash%
echo Pistol Bullets = %pistolbullets%
echo Hunting Rifle Bullets = %sniperbullets%
echo Bazooka Bullets = %grenadebullets%
echo.
echo 1. Buy a Pistol Bullet ($1)
echo.
echo 2. Buy a Hunting Rifle Bullet ($2)
echo.
echo 3. Buy a Bazooka Bullet ($3)
echo.
echo 4. Buy a Hunting Rifle ($10)
echo.
echo 5. Buy a Bazooka ($25)
echo.
echo 6. Go Back
set /p answer3=

if %answer3% == 1 (
if %cash% LSS 1 goto nofunds
set /a pistolbullets= %pistolbullets% + 1
set /a cash= %cash% - 1
)
if %answer3% == 2 (
if %cash% LSS 2 goto nofunds
set /a sniperbullets= %sniperbullets% + 1
set /a cash= %cash% - 2
)
if %answer3% == 3 (
if %cash% LSS 3 goto nofunds
set /a grenadebullets= %grenadebullets% + 1
set /a cash= %cash% - 3
)
if %answer3% == 4 (
if %cash% LSS 10 goto nofunds
set huntingrifle_have=1
set /a cash= %cash% - 10
)
if %answer3% == 5 (
if %cash% LSS 25 goto nofunds
set bazooka_have=1
set /a cash= %cash% - 25
)
if %answer3% == 6 goto start
goto shop

:nofunds
cls
echo You don't have enough money for that!
echo.
pause
goto shop

:transition
cls
echo You will lose your progress if you exit the game fully (save game coming soon, hopefully!)
echo.
pause
goto titlescreen

:howtoplay
cls
echo Hunt Animals and make money
echo Win when you get to $100
echo.
pause
goto titlescreen

:win
cls
echo You made enough money and you win!
echo CONGRATS!
echo.
pause
set pistolbullets=3
set sniperbullets=2
set grenadebullets=1
set cash=10
set equip=1
set pistol_have=1
set huntingrifle_have=0
set bazooka_have=0
set pistol=1
set huntingrifle=3
set bazooka=5
set duckhp=3
set horsehp=9
set cowhp=15
goto credits

:500start
if %cash% GEQ 500 goto win
cls
echo Equiped Item Damage = %equip% Damage
echo (1=Pistol, 2=Hunting Rifle, 3=Bazooka)
echo Pistol Bullets = %pistolbullets%
echo Hunting Rifle Bullets = %sniperbullets%
echo Bazooka Bullets = %grenadebullets%
echo Cash = $%cash%
echo.
echo 1. Hunt a duck (Must equip Pistol)
echo 2. Hunt a horse (Must equip Hunting Rifle)
echo 3. Hunt a cow (Must equip Bazooka)
echo.
echo 4. Go to the shop
echo.
echo 5. Inventory
echo.
echo 6. Title Screen
set /p answer10=
if %answer10% == 1 (
if %equip% EQU 1 goto duck 
goto start
)
if %answer10% == 2 (
if %equip% EQU 3 goto horse
goto start
)
if %answer10% == 3 (
if %equip% EQU 5 goto cow
goto start
)
if %answer10% == 4 goto shop
if %answer10% == 5 goto inventory
if %answer10% == 6 goto transition
goto 500start

:bigenemystart
if %cash% GEQ 100 goto win
cls
echo Equiped Item Damage = %equip% Damage
echo (1=Pistol, 2=Hunting Rifle, 3=Bazooka)
echo Pistol Bullets = %pistolbullets%
echo Hunting Rifle Bullets = %sniperbullets%
echo Bazooka Bullets = %grenadebullets%
echo Cash = $%cash%
echo.
echo 1. Hunt a duck (Must equip Pistol)
echo 2. Hunt a horse (Must equip Hunting Rifle)
echo 3. Hunt a cow (Must equip Bazooka)
echo.
echo 4. Go to the shop
echo.
echo 5. Inventory
echo.
echo 6. Title Screen
set /p answer2=
if %answer9% == 1 (
if %equip% EQU 1 goto bigduck 
goto start
)
if %answer9% == 2 (
if %equip% EQU 3 goto bighorse
goto start
)
if %answer9% == 3 (
if %equip% EQU 5 goto bigcow
goto start
)
if %answer9% == 4 goto shop
if %answer9% == 5 goto inventory
if %answer9% == 6 goto transition
goto bigenemystart

:bigcow
echo Cash = $%cash%
echo Equiped Item Damage = %equip% Damage
echo Bazooka Bullets = %grenadebullets%
echo Cow HP = %cowhp%
echo.
echo 1. Shoot
echo 2. Run (Cow's HP will regen)
set /p answer7= 
if %answer7% == 1 (
if %grenadebullets% LSS 1 goto nobulletscow
set /a cowhp= %cowhp% - %equip%
set /a grenadebullets= %grenadebullets% - 1
if %cowhp% LEQ 5 goto cowwin
)
if %answer7% == 2 (
set cowhp = 15
goto start
)
goto bigcow