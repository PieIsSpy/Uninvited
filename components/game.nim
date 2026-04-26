import std/random
import ../entities/player
import shop
import battle

randomize()

proc main*() =
    randomize()
    var cur_player = create_player()
    var is_over = false
    var floor = 1
    var room = 1

    echo("Enjoy your stay.")
    echo ""
    while is_over == false:
        echo "Floor ", floor
        echo "Room ", room
        echo ""

        if room == 5 or (rand(100) / 100) <= (1/7):
            initiate_shop(cur_player)
        else:
            var has_won = initiate_battle(cur_player, floor)
            if has_won == false:
                is_over = true
            else:
                cur_player.health = min(cur_player.health + int(float(cur_player.max_health) * 0.3), cur_player.max_health)
        
        if is_over == false:
            room += 1
            if room > 10:
                floor += 1
                room = 1

    echo "\x1B[31;1;4mYou have perished.\x1B[0m"