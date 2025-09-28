# this function is called a certain points each night in the tick function.


# randomly choose number to determine mob roll
scoreboard players reset * altarRoll

execute as @a run execute store result score @s altarRoll run random value 1..10

# wave spawn indicator
execute at @a run playsound minecraft:block.end_portal.spawn player @a ~ ~ ~ 0.3 2 0.2

# summon altar spawns
execute as @a if score @s altarRoll matches 1 run execute as @e[tag=altarTarget] at @s run summon vindicator ~ ~1 ~ {Health:100,active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],Glowing:1b,active_effects:[{id:invisibility,duration:99999999,show_particles:0b}],HandItems:[{id:netherite_axe,components:{enchantments:{levels:{sharpness:7}}},count:1},{}],HandDropChances:[0f,0f],attributes:[{id:"generic.movement_speed",base:0.1},{id:"generic.max_health",base:100}],Tags:["altarSpawn"],Team:dangerous}

execute as @a if score @s altarRoll matches 2 run execute as @e[tag=altarTarget] at @s run summon vex ~ ~3 ~ {LifeTicks:11000,active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],Health:5,Glowing:1b,Tags:["altarSpawn"],HandItems:[{id:netherite_axe,components:{enchantments:{levels:{sharpness:10}}},count:1},{}],HandDropChances:[0f,0f],attributes:[{id:"generic.max_health",base:5}],Team:dangerous}
execute as @a if score @s altarRoll matches 2 run execute as @e[tag=altarTarget] at @s run summon vex ~ ~3 ~ {LifeTicks:11000,active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],Health:20,Tags:["altarSpawn"],HandItems:[{id:netherite_sword,components:{enchantments:{levels:{sharpness:5}}},count:1},{}],HandDropChances:[0f,0f],attributes:[{id:"generic.max_health",base:20}]}

execute as @a if score @s altarRoll matches 3 run execute as @e[tag=altarTarget] at @s run summon evoker ~ ~1 ~ {Health:100,active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],Tags:["altarSpawn"],attributes:[{id:"generic.max_health",base:100}],DeathLootTable:"nightfall:empty"}

execute as @a if score @s altarRoll matches 4 run execute as @e[tag=altarTarget] at @s run summon ravager ~ ~1 ~ {Health:100,active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],attributes:[{id:"generic.max_health",base:100}],Tags:["altarSpawn"],Passengers:[{id:pillager,Health:40,Tags:["altarSpawn"],HandItems:[{id:crossbow,components:{enchantments:{levels:{power:10,multishot:1,quick_charge:3}}},count:1},{}],HandDropChances:[0f,0f],attributes:[{id:"generic.max_health",base:40}]}]}

execute as @a if score @s altarRoll matches 5 run execute as @e[tag=altarTarget] at @s run summon illusioner ~ ~1 ~ {Health:50,active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],Tags:["altarSpawn"],HandItems:[{id:bow,components:{enchantments:{levels:{power:10}}},count:1},{}],HandDropChances:[0f,0f],attributes:[{id:"generic.max_health",base:50}]}
execute as @a if score @s altarRoll matches 5 run execute as @e[tag=altarTarget] at @s run summon illusioner ~ ~1 ~ {Health:50,active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],Tags:["altarSpawn"],HandItems:[{id:bow,components:{enchantments:{levels:{power:10}}},count:1},{}],HandDropChances:[0f,0f],attributes:[{id:"generic.max_health",base:50}]}

execute as @a if score @s altarRoll matches 6 run execute as @e[tag=altarTarget] at @s run summon endermite ~ ~1 ~ {Lifetime:1200,active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],Health:1,Glowing:1b,Invulnerable:1b,Tags:["altarSpawn"],attributes:[{id:"generic.movement_speed",base:0.2},{id:"generic.max_health",base:1}],Team:buffer}
execute as @a if score @s altarRoll matches 6 run execute as @e[tag=altarTarget] at @s run summon breeze ~ ~2 ~ {Health:100,Tags:["altarSpawn"],attributes:[{id:"generic.max_health",base:100}]}

execute as @a if score @s altarRoll matches 7 run execute as @e[tag=altarTarget] at @s run summon piglin_brute ~ ~1 ~ {IsImmuneToZombification:1b,active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],HandItems:[{id:diamond_axe,count:1},{}],HandDropChances:[0f,0f],ArmorItems:[{},{},{id:netherite_chestplate,count:1},{id:netherite_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],Tags:["altarSpawn"]}

execute as @a if score @s altarRoll matches 8 run execute as @e[tag=altarTarget] at @s run summon blaze ~ ~2 ~ {active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],ArmorItems:[{id:netherite_boots,count:1},{id:netherite_leggings,count:1},{id:netherite_chestplate,count:1},{id:netherite_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],Tags:["altarSpawn"]}
execute as @a if score @s altarRoll matches 8 run execute as @e[tag=altarTarget] at @s run summon blaze ~ ~2 ~ {active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],ArmorItems:[{id:netherite_boots,count:1},{id:netherite_leggings,count:1},{id:netherite_chestplate,count:1},{id:netherite_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],Tags:["altarSpawn"]}

execute as @a if score @s altarRoll matches 9 run execute as @e[tag=altarTarget] at @s run summon wither_skeleton ~ ~1 ~ {Health:80,active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],HandItems:[{id:netherite_sword,count:1},{}],HandDropChances:[0f,0f],ArmorItems:[{id:netherite_boots,count:1},{id:netherite_leggings,count:1},{id:netherite_chestplate,count:1},{id:netherite_helmet,count:1}],ArmorDropChances:[0f,0f,0f,0f],attributes:[{id:"generic.attack_damage",base:20},{id:"generic.max_health",base:80}],Tags:["altarSpawn"]}

execute as @a if score @s altarRoll matches 10 run execute as @e[tag=altarTarget] at @s run summon iron_golem ~ ~1 ~ {active_effects:[{id:fire_resistance,duration:11000,ambient:0b,show_particles:0b}],Glowing:1b,Tags:["altarSpawn"],Team:buffer}