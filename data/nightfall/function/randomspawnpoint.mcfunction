spreadplayers 0 0 0 3000 false @s
execute at @s run spawnpoint @s ~ ~ ~
team join spawnedplayer @s
tellraw @s {"text":"Spawnpoint set.","color":"blue"}