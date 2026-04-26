import strutils
import std/random
import ../entities/entity
import ../entities/player
import ../items/item

randomize()

proc choose_item(player: var Player): string =
    var choice: int
    var item_name: string
    echo ""

    try:
        echo "Choose an item:"
        player.show_items()
        echo "[4] Cancel"
        choice = parseInt(readLine(stdin)) - 1

        if choice >= 0 and choice <= 2:
            if player.items[choice].name != "":
                item_name = player.items[choice].name
                player.items[choice] = create_item(delete_item[0], delete_item[1], delete_item[2])
                return item_name

        return ""
    except:
        return ""

proc ambush(player: var Player, enemy: var Entity) =
    var x = rand(100) / 100
    if x <= 1 / (3 + player.perception):
        echo "\x1B[31;1;4mAMBUSHED!\x1B[0m"
        take_damage(player, enemy.damage + int(float(enemy.damage) * 0.05))

proc initiate_battle*(cur_player: var Player, floor: int): bool =
    var enemy = random_enemy(floor)
    var valid_move = true
    var item: string
    var heal: int
    var stink_count = 0
    var chance: float

    ambush(cur_player, enemy)
    echo cur_player.name, " encountered ", enemy.name
    echo ""
    while cur_player.health > 0 and enemy.health > 0:
        var action: string

        echo cur_player.name, ": ", cur_player.health, "/", cur_player.max_health
        echo enemy.name, ": ", enemy.health, "/", enemy.max_health
        echo "[1] Fight"
        echo "[2] Defend"
        echo "[3] Dodge"
        echo "[4] Item"
        action = readLine(stdin)

        if action == "1":
            chance = rand(100) / 100

            if chance <= 1 / (4 + cur_player.perception):
                echo cur_player.name, " attacked, but missed."
                echo ""
            else:
                echo cur_player.name, " attacked!"
                take_damage(enemy, cur_player.damage)

            valid_move = true
        elif action == "2":
            echo ""
            echo cur_player.name, " defended"
            valid_move = true
        elif action == "3":
            echo ""
            echo "Coward."
            valid_move = true
        elif action == "4":
            item = choose_item(cur_player)
            echo ""

            if item == "":
                valid_move = false
            else:
                echo cur_player.name, " used ", item
                
                case item:
                    of "Bandaid", "Candy Pops":
                        heal = min(cur_player.health + int(float(cur_player.max_health) * 0.2), cur_player.max_health)
                        echo "Healed ", heal, " HP"
                        cur_player.health = heal
                    of "Rock":
                        take_damage(enemy, 20)
                    of "Stink Bomb":
                        echo "The area is filled with stink!"
                        stink_count = 5
                    of "Elephant Figure":
                        echo "Address me."
                        take_damage(enemy, 30)
                    of "Bad Jam":
                        echo "Mmmm jam."
                        echo "Healed full health"
                        cur_player.health = cur_player.max_health
                    of "Handgun":
                        echo "BANG!"
                        take_damage(enemy, 100)

                echo ""
                valid_move = true
        else:
            valid_move = false

        if enemy.health > 0 and valid_move == true:
            chance = rand(100) / 100

            if chance <= 1 / (3 - cur_player.perception):
                echo enemy.name, " attacked, but missed."
                echo ""
            else:
                echo enemy.name, " attacked!"
                take_damage(cur_player, int(enemy.damage / (if action == "2": 2 else: 1)))

        if stink_count > 0:
            echo "The stink lingers..."
            take_damage(cur_player, 5)
            take_damage(enemy, 5)
            stink_count -= 1

    if cur_player.health <= 0:
        echo enemy.name, " won"
        echo ""
        return false
    else:
        echo cur_player.name, " won"
        echo ""
        return true