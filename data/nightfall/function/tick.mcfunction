# this function is ran every tick of the game.
# this function is not meant to be called manually.

# randomize each player's spawnpoint
execute as @a[team=!spawnedplayer] at @s run function nightfall:randomspawnpoint

# give 1 sec of speed to all entities on gravel
execute as @e at @s if block ~ ~-1 ~ gravel run effect give @s speed 1 1 true

# detect altar built
execute at @a as @a if block ~ ~-1 ~ end_stone_bricks run execute if block ~1 ~-1 ~ amethyst_block run execute if block ~-1 ~-1 ~ amethyst_block run execute if block ~ ~-1 ~-1 amethyst_block run execute if block ~ ~-1 ~1 amethyst_block run execute if block ~1 ~-1 ~1 warped_stem run execute if block ~-1 ~-1 ~-1 warped_stem run execute if block ~-1 ~-1 ~1 warped_stem run execute if block ~1 ~-1 ~-1 warped_stem run execute as @s if items entity @s weapon.* netherite_ingot run function nightfall:altarstart

# altar functionality (ALTAR SPAWNS ARE IN spawnmob.mcfunction)
execute if score daytime time matches 13000 run execute if score altarActive altar matches 1 run gamerule mobGriefing true
execute if score daytime time matches 23000 run execute if score altarActive altar matches 1 run function nightfall:altarreward
# altar detonations
execute if score daytime time matches 14900 run execute if score altarActive altar matches 1 run execute at @e[tag=altarTarget] run title @a[distance=..99] title {"text":"Altar detonation imminent!","color":"#FF0000"}
execute if score daytime time matches 15000 run execute if score altarActive altar matches 1 run execute at @e[tag=altarTarget] run summon creeper ~ ~1 ~ {ExplosionRadius:7b,Fuse:0,ignited:1b}

execute if score daytime time matches 17900 run execute if score altarActive altar matches 1 run execute at @e[tag=altarTarget] run title @a[distance=..99] title {"text":"Altar detonation imminent!","color":"#FF0000"}
execute if score daytime time matches 18000 run execute if score altarActive altar matches 1 run execute at @e[tag=altarTarget] run summon creeper ~ ~1 ~ {ExplosionRadius:7b,Fuse:0,ignited:1b}

execute if score daytime time matches 20900 run execute if score altarActive altar matches 1 run execute at @e[tag=altarTarget] run title @a[distance=..99] title {"text":"Altar detonation imminent!","color":"#FF0000"}
execute if score daytime time matches 21000 run execute if score altarActive altar matches 1 run execute at @e[tag=altarTarget] run summon creeper ~ ~1 ~ {ExplosionRadius:7b,Fuse:0,ignited:1b}

# measure time values
execute store result score daytime time run time query daytime
execute if score daytime time matches 23999 run scoreboard players add @a playerDays 1

# check full moon >> fullMoon time = 0 >> means full moon
scoreboard players operation fullMoon time = days time
scoreboard players operation fullMoon time %= 8 numbers

# time announcements
execute unless score fullMoon time matches 0 run execute unless score altarActive altar matches 1 run execute if score daytime time matches 13000 run tellraw @a {"text": "Night falls...", "color": "#ab1f3c"}

execute if score fullMoon time matches 0 run execute if score daytime time matches 13000 run tellraw @a {"text": "A full moon rises, casting its silver glow.", "color": "#ab1f3c"}

execute if score daytime time matches 13000 run execute if score altarActive altar matches 1 run tellraw @a {"text": "An altar was activated at the following coordinates: ","extra":[{"score": {"name": "altarX","objective": "altar"}},{"text":" "},{"score": {"name": "altarY","objective": "altar"}},{"text":" "},{"score": {"name": "altarZ","objective": "altar"}}], "color": "#ff0000"}

execute if score daytime time matches 23000 run tellraw @a {"text": "The moon begins to fall past the horizon...", "color": "#cf973e"}

# SPECIAL MOB FUNCTIONS
# enderman give darkness to nearby players
execute as @e[type=enderman] at @s run effect give @a[distance=..10,gamemode=!creative] darkness 2 0 true
# hoglins give poison 3 to nearby players
execute as @e[type=hoglin] at @s run effect give @a[distance=..5,gamemode=!creative] poison 1 2 true
# make all nether fireballs just a "bit" stronger ;) (fireball ExplosionPower is normally 1)
execute in the_nether as @e[type=fireball] run data modify entity @s ExplosionPower set value 2
# altar illusioner remove blindness
execute if score altarActive altar matches 1 run execute as @e[type=minecraft:illusioner,tag=altarSpawn] at @s run effect clear @a[distance=..50] blindness
# altar endermite buffs nearby mobs with strength
execute if score altarActive altar matches 1 run execute as @e[type=minecraft:endermite,tag=altarSpawn] at @s run effect give @e[type=!player,type=!endermite,distance=..10] strength 1 0
# altar iron golems buffs nearby mobs with resistance 2
execute if score altarActive altar matches 1 run execute as @e[type=iron_golem,tag=altarSpawn] at @s run effect give @e[type=!player,type=!iron_golem,distance=..20] resistance 1 1
# all altar mobs target nearest player instead of each other
execute if score altarActive altar matches 1 run execute as @e[tag=altarSpawn] at @s run data modify entity @s AngryAt set from entity @p[distance=..50] UUID


# timed extra mob spawns
execute if score daytime time matches 13000 run function nightfall:spawnmob
execute if score daytime time matches 14000 run function nightfall:spawnmob
execute if score daytime time matches 14000 run function nightfall:spawnmob
execute if score daytime time matches 15000 run function nightfall:spawnmob
execute if score daytime time matches 16000 run function nightfall:spawnmob
execute if score daytime time matches 17000 run function nightfall:spawnmob
execute if score daytime time matches 18000 run function nightfall:spawnmob
execute if score daytime time matches 19000 run function nightfall:spawnmob
execute if score daytime time matches 20000 run function nightfall:spawnmob
execute if score daytime time matches 21000 run function nightfall:spawnmob
execute if score daytime time matches 21500 run function nightfall:spawnmob
execute if score daytime time matches 22000 run function nightfall:spawnmob
execute if score daytime time matches 22500 run function nightfall:spawnmob

# altar spawns
execute if score daytime time matches 13000 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 13250 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 13500 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 13750 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 14000 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 14250 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 14500 if score altarActive altar matches 1 run function nightfall:altarmob

execute if score daytime time matches 15500 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 15750 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 16000 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 16250 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 16500 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 16750 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 17000 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 17250 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 17500 if score altarActive altar matches 1 run function nightfall:altarmob

execute if score daytime time matches 18500 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 18750 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 19000 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 19250 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 19500 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 19750 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 20000 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 20250 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 20500 if score altarActive altar matches 1 run function nightfall:altarmob

execute if score daytime time matches 21500 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 21750 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 22000 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 22250 if score altarActive altar matches 1 run function nightfall:altarmob
execute if score daytime time matches 22500 if score altarActive altar matches 1 run function nightfall:altarmob