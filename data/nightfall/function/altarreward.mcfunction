# this function is called on sunup after an altar is activated.
# this function is not meant to be called manually.

# THE REWARD IS DEPENDANT ON TOTAL KILLCOUNT!

# determine loot quality
execute as @e[type=tadpole,tag=altarTarget] at @s run scoreboard players set @a[distance=150..] altarKills 0

execute as @e[type=tadpole,tag=altarTarget] run execute as @a[distance=..150] run scoreboard players operation altarKillsTotal altarKills += @s altarKills

# announce altar loot
tellraw @a {"text": "The altar pays out...", "color": "#804aff"}

# generate loot
execute at @e[type=tadpole,tag=altarTarget] run summon lightning_bolt ~ ~1 ~
execute at @e[type=tadpole,tag=altarTarget] run fill ~-1 ~ ~-1 ~1 ~ ~1 quartz_block
execute at @e[type=tadpole,tag=altarTarget] run setblock ~ ~1 ~ chest{LootTable:"nightfall:altarloot"}
execute as @e[type=tadpole,tag=altarTarget] run kill @s

# kill all mobs that were spawned by altar
tp @e[tag=altarSpawn] ~ -1000 ~
kill @e[tag=altarSpawn]

# turn off mob griefing
gamerule mobGriefing false

# reset for next altar
scoreboard players set altarActive altar 0
