import std/random
import strutils
import ../entities/player
import ../items/item

randomize()

var greetings_list = [
    "What're ya buyin'?",
    "Got somethin' that might interest ya'!",
    "Got a selection of good things on sale, stranger!"
]

proc initiate_shop*(player: var Player) =
    var shop: array[3, Item] = create_shop()
    var greeting = sample(greetings_list)
    var action: string
    var slot: int
    var valid_choice = false

    echo greeting
    echo ""

    while action == "" or valid_choice == false:
        for i in countup(0, 2):
            echo "[", i+1, "]", shop[i].name
            echo shop[i].description
            echo ""
        echo "[4] Refuse"
        echo ""
        action = readLine(stdin)

        try:
            var action_int = parseInt(action) - 1
            
            if action_int >= 0 and action_int <= 2:
                echo ""
                echo "Choose a slot to replace:"
                player.show_items()

                slot = parseInt(readLine(stdin)) - 1

                if slot >= 0 and slot <= 2:
                    player.items[slot] = shop[action_int]
                    echo ""
                    echo "You took ", player.items[slot].name
                    echo ""
                    valid_choice = true

            elif action_int == 3:
                echo ""
                echo "You took nothing"
                valid_choice = true

            echo ""
        except:
            valid_choice = false
            echo ""