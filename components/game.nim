import ../entities/player
import shop
import battle

proc main*() =
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

        if room != 5:
            var has_won = initiate_battle(cur_player, floor)
            if has_won == false:
                is_over = true
            else:
                cur_player.health = min(cur_player.health + int(float(cur_player.max_health) * 0.05), cur_player.max_health)
        else:
            initiate_shop(cur_player)
        
        if is_over == false:
            room += 1
            if room > 10:
                floor += 1
                room = 1

    echo "\x1B[31;1;4mYou have perished.\x1B[0m"