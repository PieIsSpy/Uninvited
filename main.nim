import game

proc showRules() =
    echo("Run through the corridors as far as you can.")
    echo("Get supplies along the way.")
    echo("\x1B[31;1;4mDo NOT trust anyone.\x1B[0m")
    echo("\x1B[31;1;4mDo NOT look back.\x1B[0m")
    echo ""

echo("Welcome, Uninvited Guest.")
var name: string = ""
while name == "" or name != "3":
    echo("[1] Enter the Hotel")
    echo("[2] House Rules")
    echo("[3] Flee")
    name = readLine(stdin)

    if name == "1":
        echo ""
        main()
    elif name == "2":
        echo ""
        showRules()
    elif name == "3":
        echo ""
        echo("Do not come back.")