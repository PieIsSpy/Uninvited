import entity
import ../items/item
import ../items/relic

type Player* = object of Entity
    perception*: int
    items*: array[3, Item]
    relic*: Relic

proc create_player*(): Player =
    var new_player: Player
    new_player.name = "Player"
    new_player.health = 100
    new_player.max_health = 100
    new_player.damage = 10
    new_player.speed = 1
    new_player.perception = 0
    return new_player