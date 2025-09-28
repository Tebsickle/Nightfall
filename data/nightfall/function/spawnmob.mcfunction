# this function is called an certain points each night in the tick function.

# begin calculating mob power
scoreboard players set @a mobPower 0

# add amount of days to mob power
execute as @a run scoreboard players operation @s mobPower += @s playerDays

# add 10 points for full moon
execute unless score days time matches 0 run execute if score fullMoon time matches 0 run scoreboard players add @a mobPower 10

# add points depending on advancements
execute as @a if entity @s[advancements={story/iron_tools=true}] run scoreboard players add @s mobPower 3
execute as @a if entity @s[advancements={story/deflect_arrow=true}] run scoreboard players add @s mobPower 5
execute as @a if entity @s[advancements={story/mine_diamond=true}] run scoreboard players add @s mobPower 3
execute as @a if entity @s[advancements={story/shiny_gear=true}] run scoreboard players add @s mobPower 5
execute as @a if entity @s[advancements={story/enchant_item=true}] run scoreboard players add @s mobPower 3
execute as @a if entity @s[advancements={nether/find_fortress=true}] run scoreboard players add @s mobPower 3
execute as @a if entity @s[advancements={nether/obtain_ancient_debris=true}] run scoreboard players add @s mobPower 3
execute as @a if entity @s[advancements={nether/netherite_armor=true}] run scoreboard players add @s mobPower 10
execute as @a if entity @s[advancements={end/kill_dragon=true}] run scoreboard players add @s mobPower 10
execute as @a if entity @s[advancements={nether/create_beacon=true}] run scoreboard players add @s mobPower 10
execute as @a if entity @s[advancements={nether/create_full_beacon=true}] run scoreboard players add @s mobPower 15
# end calculating mob power

# set up valid spawn positions around player
execute at @a run summon armor_stand ~7 ~ ~ {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~ ~ ~7 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~-7 ~ ~ {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~ ~ ~-7 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}

execute at @a run summon armor_stand ~-4.5 ~ ~4.5 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~4.5 ~ ~-4.5 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~4.5 ~ ~4.5 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~-4.5 ~ ~-4.5 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}

execute at @a run summon armor_stand ~2 ~ ~6 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~-2 ~ ~6 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~2 ~ ~-6 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~-2 ~ ~-6 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~6 ~ ~2 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~-6 ~ ~2 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~6 ~ ~-2 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}
execute at @a run summon armor_stand ~-6 ~ ~-2 {NoAI:1b,Silent:1b,Tags:["tempSpawn"],Invisible:1b}

# if armor stand in block, kill self
execute as @e[type=armor_stand,tag=tempSpawn] run execute as @s at @s unless block ~ ~ ~ air run kill @s

# generated mob spawns on one of the remaining armor stands if altar isnt active

# randomly choose number to determine mob roll
scoreboard players reset mobRoll numbers
scoreboard players reset mobHighRoll numbers

execute store result score mobRoll numbers run random value 1..4
execute store result score mobHighRoll numbers run random value 1..8

# heartbeat :)
execute unless score altarActive altar matches 1 run playsound entity.warden.heartbeat player @a

# NORMAL MOB SPAWNS
# if mobpower is 20 or less, choose from mobroll
execute as @a at @s if score mobRoll numbers matches 1 if score @s mobPower matches ..20 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon zombie ~ ~ ~
execute as @a at @s if score mobRoll numbers matches 2 if score @s mobPower matches ..20 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon skeleton ~ ~ ~
execute as @a at @s if score mobRoll numbers matches 3 if score @s mobPower matches ..20 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon slime ~ ~ ~ {Size:2}
execute as @a at @s if score mobRoll numbers matches 4 if score @s mobPower matches ..20 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon spider ~ ~ ~

# if mobpower is 21-40, choose from mobroll
execute as @a at @s if score mobRoll numbers matches 1 if score @s mobPower matches 21..40 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon zombie ~ ~ ~ {HandItems:[{id:stone_sword,count:1},{}],HandDropChances:[0f,0f],ArmorItems:[{},{},{id:iron_chestplate,count:1},{id:iron_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f]}
execute as @a at @s if score mobRoll numbers matches 2 if score @s mobPower matches 21..40 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon skeleton ~ ~ ~ {HandItems:[{id:bow,count:1},{}],HandDropChances:[0f,0f],ArmorItems:[{},{},{id:iron_chestplate,count:1},{id:iron_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f]}
execute as @a at @s if score mobRoll numbers matches 3 if score @s mobPower matches 21..40 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon creeper ~ ~ ~ {ExplosionRadius:2}
execute as @a at @s if score mobRoll numbers matches 4 if score @s mobPower matches 21..40 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon zombie ~ ~ ~ {IsBaby:1b,HandItems:[{id:wooden_sword,count:1},{}],HandDropChances:[0f,0f]}

# if mobpower is 41-60, choose from mobroll
execute as @a at @s if score mobRoll numbers matches 1 if score @s mobPower matches 41..60 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon spider ~ ~ ~ {attributes:[{id:"generic.attack_damage",base:6}]}
execute as @a at @s if score mobRoll numbers matches 2 if score @s mobPower matches 41..60 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon pillager ~ ~ ~ {HandItems:[{id:crossbow,components:{enchantments:{levels:{power:2}}},count:1},{}],HandDropChances:[0f,0f]}
execute as @a at @s if score mobRoll numbers matches 3 if score @s mobPower matches 41..60 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon spider ~ ~ ~ {Passengers:[{id:skeleton,HandItems:[{id:bow,components:{enchantments:{levels:{power:1}}},count:1},{}],HandDropChances:[0f,0f]}]}
execute as @a at @s if score mobRoll numbers matches 4 if score @s mobPower matches 41..60 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon witch ~ ~ ~ {Health:60,attributes:[{id:"generic.max_health",base:50}]}

# if mobpower is 61-80, choose from mobroll
execute as @a at @s if score mobRoll numbers matches 1 if score @s mobPower matches 61..80 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon cave_spider ~ ~ ~ {Health:40f,attributes:[{id:"generic.attack_damage",base:5},{id:"generic.max_health",base:40}]}
execute as @a at @s if score mobRoll numbers matches 2 if score @s mobPower matches 61..80 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon drowned ~ ~ ~ {HandItems:[{id:trident,count:1},{}],HandDropChances:[0f,0f],ArmorItems:[{},{},{id:diamond_chestplate,count:1},{id:iron_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f]}
execute as @a at @s if score mobRoll numbers matches 3 if score @s mobPower matches 61..80 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon endermite ~ ~ ~ {Lifetime:0,attributes:[{id:"generic.attack_knockback",base:3}]}
execute as @a at @s if score mobRoll numbers matches 4 if score @s mobPower matches 61..80 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon husk ~ ~ ~ {IsBaby:1b,HandItems:[{id:iron_sword,count:1},{}],HandDropChances:[0f,0f],ArmorDropChances:[0f,0f,0f,0f],ArmorItems:[{},{},{id:diamond_chestplate,count:1},{}]}

# if mobpower is 81-100, choose from mobroll
execute as @a at @s if score mobRoll numbers matches 1 if score @s mobPower matches 81..100 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon piglin ~ ~ ~ {IsImmuneToZombification:1b,CannotHunt:1b,HandItems:[{id:iron_sword,count:1},{}],HandDropChances:[0f,0f],ArmorDropChances:[0f,0f,0f,0f],ArmorItems:[{id:iron_boots,count:1},{},{id:diamond_chestplate,count:1},{}]}
execute as @a at @s if score mobRoll numbers matches 2 if score @s mobPower matches 81..100 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon stray ~ ~ ~ {HandItems:[{id:bow,components:{enchantments:{levels:{power:3}}},count:1},{}],HandDropChances:[0f,0f]}
execute as @a at @s if score mobRoll numbers matches 3 if score @s mobPower matches 81..100 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon chicken ~ ~ ~ {IsChickenJockey:1b,attributes:[{id:"generic.movement_speed",base:0.5}],Passengers:[{id:zombie,IsBaby:1b,HandItems:[{id:iron_sword,count:1},{}],HandDropChances:[0f,0f],ArmorItems:[{id:iron_boots,count:1},{id:iron_leggings,count:1},{id:iron_chestplate,count:1},{id:iron_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f]}]}
execute as @a at @s if score mobRoll numbers matches 4 if score @s mobPower matches 81..100 run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon silverfish ~ ~ ~ {attributes:[{id:"generic.attack_damage",base:6}],Passengers:[{id:silverfish,attributes:[{id:"generic.attack_damage",base:6}],Passengers:[{id:silverfish,attributes:[{id:"generic.attack_damage",base:6}],Passengers:[{id:silverfish,attributes:[{id:"generic.attack_damage",base:6}]}]}]}]}

# if mobpower is 101 or higher, choose from mobroll
execute as @a at @s if score mobHighRoll numbers matches 1 if score @s mobPower matches 101.. run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon skeleton ~ ~ ~ {ArmorItems:[{},{},{id:leather_chestplate,components:{dyed_color:{rgb:16711680}},count:1},{id:leather_helmet,components:{dyed_color:{rgb:16711680}},count:1}],ArmorDropChances:[0f,0f,0f,0f],HandItems:[{id:bow,components:{enchantments:{levels:{power:12}}},count:1},{}],HandDropChances:[0f,0f]}
execute as @a at @s if score mobHighRoll numbers matches 1 if score @s mobPower matches 101.. run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon skeleton ~ ~ ~ {ArmorItems:[{},{},{id:leather_chestplate,components:{dyed_color:{rgb:65535}},count:1},{id:leather_helmet,components:{dyed_color:{rgb:65535}},count:1}],ArmorDropChances:[0f,0f,0f,0f],HandItems:[{id:bow,components:{enchantments:{levels:{punch:3}}},count:1},{}],HandDropChances:[0f,0f]}


execute as @a at @s if score mobHighRoll numbers matches 2 if score @s mobPower matches 101.. run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon wither_skeleton ~ ~ ~ {HandItems:[{id:netherite_sword,components:{enchantments:{levels:{sharpness:5}}},count:1},{}],HandDropChances:[0f,0f]}

execute as @a at @s if score mobHighRoll numbers matches 3 if score @s mobPower matches 101.. run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon piglin_brute ~ ~ ~ {IsImmuneToZombification:1b,HandItems:[{id:"netherite_axe",count:1},{}],HandDropChances:[0f,0f]}

execute as @a at @s if score mobHighRoll numbers matches 4 if score @s mobPower matches 101.. run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon husk ~ ~ ~ {IsBaby:1b,HandItems:[{id:netherite_sword,count:1},{}],HandDropChances:[0f,0f],ArmorItems:[{id:diamond_boots,count:1},{id:netherite_leggings,count:1},{id:netherite_chestplate,count:1},{id:diamond_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f]}

execute as @a at @s if score mobHighRoll numbers matches 5 if score @s mobPower matches 101.. run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon zombie_villager ~ ~ ~ {VillagerData:{type:taiga,profession:librarian,level:1},HandItems:[{id:netherite_sword,components:{enchantments:{levels:{sharpness:8}}},count:1},{}],HandDropChances:[0f,0f],ArmorItems:[{id:netherite_boots,count:1},{id:netherite_leggings,count:1},{id:netherite_chestplate,count:1},{id:netherite_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f]}

execute as @a at @s if score mobHighRoll numbers matches 6 if score @s mobPower matches 101.. run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon bogged ~ ~ ~ {Health:50,HandItems:[{id:bow,components:{enchantments:{levels:{power:8}}},count:1},{}],HandDropChances:[0f,0f],ArmorItems:[{id:diamond_boots,count:1},{id:netherite_leggings,count:1},{id:netherite_chestplate,count:1},{id:diamond_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],attributes:[{id:"generic.max_health",base:50}]}

execute as @a at @s if score mobHighRoll numbers matches 7 if score @s mobPower matches 101.. run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon silverfish ~ ~ ~ {Passengers:[{id:"minecraft:silverfish",Health:60f,Passengers:[{id:"minecraft:silverfish",Passengers:[{id:"minecraft:silverfish",Health:60f,attributes:[{id:"minecraft:generic.attack_damage",base:12},{id:"minecraft:generic.max_health",base:60},{id:"minecraft:generic.movement_speed",base:0.3}]}]}],attributes:[{id:"minecraft:generic.attack_damage",base:12},{id:"minecraft:generic.max_health",base:60},{id:"minecraft:generic.movement_speed",base:0.3}]}]}

execute as @a at @s if score mobHighRoll numbers matches 8 if score @s mobPower matches 101.. run execute at @e[tag=tempSpawn,distance=..9,sort=random,limit=1] run execute unless score altarActive altar matches 1 run summon vindicator ~ ~ ~ {Glowing:1b,Team:"dangerous",Health:80f,HandItems:[{id:"minecraft:netherite_axe",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":12}}}},{}],HandDropChances:[0.000F,0.085F],attributes:[{id:"minecraft:generic.max_health",base:80}]}

# clean up
kill @e[tag=tempSpawn]