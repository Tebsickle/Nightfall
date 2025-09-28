# this is a debug function, used only manually. 
# changes the days elapsed

# DESYNCS ACTUAL DAYS PASSED AND MEASURED DAYS PASSED.
# This means that full moons will generally be measured incorrectly, as well as bosses.
# recommended to only change days by multiples of 8 to maintain moon cycle

# /function nightfall:setdays {days: x}


$scoreboard players set days time $(days)