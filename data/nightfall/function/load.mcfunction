# this function is run each time the datapack is reloaded.
# this function is not meant to be called manually.

# set difficulty hard BECAUSE BALANCE REASONS SMH
difficulty hard

worldborder set 15000 0

# set up spawnpoint prereqs
team add spawnedplayer

# set up and define numbers for arithmetic or randomization
scoreboard objectives add numbers dummy
scoreboard players set 8 numbers 8

# set up and sync time measurement
scoreboard objectives add time dummy
time set 0
scoreboard objectives add playerDays dummy

# set up altar functionality
scoreboard objectives add altar dummy
scoreboard objectives add altarKills totalKillCount
scoreboard objectives add altarRoll dummy
scoreboard players reset * altarKills
scoreboard players set altarActive altar 0

# make teams for glowing coloration
team add buffer
team modify buffer color green
team add dangerous
team modify dangerous color red

# set up mob Power scaling
scoreboard objectives add mobPower dummy

# confirm complete load and offer world expansion if not loaded before
tellraw @a {"text":"Nightfall difficulty loaded.","bold":true,"color":"dark_purple"}