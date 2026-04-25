import std/random
randomize()

type Rarity = enum Common Uncommon Rare
type ItemTuple = tuple[name: string, description: string, rarity: Rarity]
type ItemTupleArray = array[7, ItemTuple]

type Item* = object of RootObj
    name*: string
    description*: string
    rarity*: Rarity

var item_list: ItemTupleArray = [
    # common
    ("Bandaid", "It's a bit gooey", Common),
    ("Rock", "What's the matter? Stuck in a rock and a hard place?", Common),
    ("Candy Pops", "Feels like popping when eating it.", Common),

    # uncommon
    ("Stink Bomb", "I strongly suggest against using this.", Uncommon),
    ("Elephant Figure", "Address Me.", Uncommon),

    # rare
    ("Bad Jam", "Hey, this jam isn't so bad. It's quite good actually.", Rare),
    ("Handgun", "Ok, this is getting ridiculous. Who smuggled this in?", Rare)
]

proc create_item*(name: string, description: string, rarity: Rarity): Item =
    var new_item: Item
    new_item.name = name
    new_item.description = description
    new_item.rarity = rarity
    return new_item

proc create_shop*(): array[3, Item] =
    var shop: array[3, Item]

    for i in countup(0, 2):
        var x = rand(100)
        var item: ItemTuple
        var rarity: Rarity

        if x >= 0 and x <= 60:
            rarity = Common
        elif x >= 61 and x <= 90:
            rarity = Uncommon
        else:
            rarity = Rare

        while item[0] == "" or item[2] != rarity:
            item = sample(item_list)
        
        shop[i] = create_item(item[0], item[1], item[2])

    return shop