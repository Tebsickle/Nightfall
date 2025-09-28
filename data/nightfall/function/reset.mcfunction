# this is a debug function used only manually.
# simulates a fresh install of the datapack.
# /function nightfall:reset

scoreboard objectives remove time
scoreboard objectives remove numbers
scoreboard objectives remove mobPower
scoreboard objectives remove altar
scoreboard objectives remove altarKills
scoreboard objectives remove altarRoll

team remove buffer
team remove dangerous

tellraw @a {"text": "Pack reset.", "color": "#AAFFAA"}