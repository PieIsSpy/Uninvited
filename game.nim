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
        var has_won = initiate_battle(cur_player)
        if has_won == false:
            is_over = true

    echo "\x1B[31;1;4mYou have perished.\x1B[0m"