import entities/entity
import entities/player

proc initiate_battle*(cur_player: var Player): bool =
    var enemy = create_entity("Shadow", 30, 9, 0)

    echo cur_player.name, " encountered ", enemy.name
    while cur_player.health > 0 and enemy.health > 0:
        var action: string

        echo "[1] Fight"
        echo "[2] Defend"
        echo "[3] Dodge"
        action = readLine(stdin)

        if action == "1":
            enemy.health -= cur_player.damage
            echo ""
            echo cur_player.name, " damaged ", enemy.name
            echo enemy.health, "/", enemy.max_health
        if action == "2":
            echo ""
            echo cur_player.name, " defended"
        if action == "3":
            echo ""
            echo "Coward."

        if enemy.health > 0:
            cur_player.health -= int(enemy.damage / (if action == "2": 2 else: 1))
            echo ""
            echo enemy.name, " damaged ", cur_player.name
            echo cur_player.health, "/", cur_player.max_health
            echo ""

    if cur_player.health <= 0:
        echo ""
        echo enemy.name, " won"
        echo ""
        return false
    else:
        echo ""
        echo cur_player.name, " won"
        echo ""
        return true