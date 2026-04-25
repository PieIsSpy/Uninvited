import ../entities/player
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

        var has_won = initiate_battle(cur_player, floor)
        if has_won == false:
            is_over = true
        else:
            room += 1
            if room > 10:
                floor += 1
                room = 1

    echo "\x1B[31;1;4mYou have perished.\x1B[0m"