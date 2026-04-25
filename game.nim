import player
import item
import equippable

proc main*() =
    var cur_player = Player(health: 100, perception: 0, damage: 5)
    var is_over = false
    var floor = 0
    var room = 0