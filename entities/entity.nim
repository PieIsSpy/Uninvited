type Entity* = object of RootObj
    name*: string
    health*: int
    max_health*: int
    damage*: int
    speed*: int

proc create_entity*(name: string, health: int, damage: int, speed: int): Entity =
    var new_entity: Entity
    new_entity.name = name
    new_entity.health = health
    new_entity.max_health = health
    new_entity.damage = damage
    new_entity.speed = speed
    return new_entity

proc take_damage*(damaged: var Entity, amount: int) = 
    echo ""
    echo damaged.name, " took ", amount, " damage!"
    echo ""
    damaged.health -= amount