import entities/entity
import entities/player

proc initiate_battle*(cur_player: var Player, floor: int): bool =
    var enemy = random_enemy(floor)
    var valid_move = true

    echo cur_player.name, " encountered ", enemy.name
    echo ""
    while cur_player.health > 0 and enemy.health > 0:
        var action: string

        echo cur_player.name, ": ", cur_player.health, "/", cur_player.max_health
        echo enemy.name, ": ", enemy.health, "/", enemy.max_health
        echo "[1] Fight"
        echo "[2] Defend"
        echo "[3] Dodge"
        action = readLine(stdin)

        if action == "1":
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
        else:
            valid_move = false

        if enemy.health > 0 and valid_move == true:
            echo enemy.name, " attacked!"
            take_damage(cur_player, int(enemy.damage / (if action == "2": 2 else: 1)))

    if cur_player.health <= 0:
        echo enemy.name, " won"
        echo ""
        return false
    else:
        echo cur_player.name, " won"
        echo ""
        return true