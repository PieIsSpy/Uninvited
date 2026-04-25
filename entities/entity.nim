import std/random
randomize()

type Entity* = object of RootObj
    name*: string
    health*: int
    max_health*: int
    damage*: int
    speed*: int

type EntityTuple = tuple[name: string, health: int, damage: int, speed: int, floor: int]
type EntityTupleArray = array[7, EntityTuple]
var enemy_list: EntityTupleArray = [
    # minimum floor: floor 1
    ("Shadow", 40, 10, 0, 1),
    ("Splinter", 50, 5, 1, 1),
    ("Screamling", 30, 15, 0, 1),

    # minimum floor: floor 2
    ("Spider", 45, 15, 2, 2),
    ("Urchin", 40, 20, -1, 2),

    # minimum floor: floor 3
    ("Glorp", 10, 40, 4, 3),
    ("Figure", 40, 30, 3, 3)
]

proc create_entity*(name: string, health: int, damage: int, speed: int): Entity =
    var new_entity: Entity
    new_entity.name = name
    new_entity.health = health
    new_entity.max_health = health
    new_entity.damage = damage
    new_entity.speed = speed
    return new_entity

proc random_enemy*(floor: int): Entity =
    var enemy: EntityTuple

    while enemy[0] == "" or enemy[4] > floor:
        enemy = sample(enemy_list)
        
    return create_entity(enemy[0], enemy[1], enemy[2], enemy[3])

proc take_damage*(damaged: var Entity, amount: int) = 
    echo ""
    echo damaged.name, " took ", amount, " damage!"
    echo ""
    damaged.health -= amount