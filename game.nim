import entities/player
import battle

proc main*() =
    var cur_player = create_player()
    var is_over = false
    var floor = 0
    var room = 0

    echo("Enjoy your stay.")
    echo ""
    while is_over == false:
        echo "Floor ", floor
        echo "Room ", room
        echo ""
        
        var has_won = initiate_battle(cur_player)
        if has_won == false:
            is_over = true
        else:
            room += 1
            if room > 10:
                floor += 1
                room = 0

    echo "\x1B[31;1;4mYou have perished.\x1B[0m"