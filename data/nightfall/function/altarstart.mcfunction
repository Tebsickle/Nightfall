# this function is called when a player stands on a built altar.
# this function is not meant to be called manually.

# get altar coords
execute store result score altarX altar run data get entity @s Pos[0] 1
execute store result score altarY altar run data get entity @s Pos[1] 1
execute store result score altarZ altar run data get entity @s Pos[2] 1

# pay altar costs
fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 bedrock
clear @s netherite_ingot 1

execute as @s run summon lightning_bolt ~ ~-1 ~
summon minecraft:tadpole ~ ~-1 ~ {NoAI:1b,Silent:1b,Invulnerable:1b,Tags:["altarTarget"],active_effects:[{id:invisibility,duration:30000,ambient:0b,show_particles:0b}]}

# signal altar event and give coords
tellraw @a {"text": "The true power of night has been invoked at the coordinates: ","extra":[{"score": {"name": "altarX","objective": "altar"}},{"text":" "},{"score": {"name": "altarY","objective": "altar"}},{"text":" "},{"score": {"name": "altarZ","objective": "altar"}}], "color": "#ff0000"}
tellraw @a {"text": "A test of strength will occur throughout the course of night.", "color": "#FF0000"}

# altar setup
scoreboard players set altarActive altar 1
scoreboard players set altarTime altar 0
scoreboard players reset * altarKills