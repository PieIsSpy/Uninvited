import entity
import ../items/item

type Player* = object of Entity
    perception*: int
    items*: array[3, Item]

proc create_player*(): Player =
    var new_player: Player
    new_player.name = "Player"
    new_player.health = 100
    new_player.max_health = 100
    new_player.damage = 10
    new_player.speed = 1
    new_player.perception = 0
    return new_player

proc show_items*(player: Player) =
    for i in countup(0, 2):
        if player.items[i].name != "":
            echo "[", i+1, "] ", player.items[i].name
        else:
            echo "[", i+1, "] None"