import game

proc showRules() =
    echo("Run through the corridors as far as you can.")
    echo("Get supplies along the way.")
    echo("\x1B[31;1;4mDo NOT trust anyone.\x1B[0m")
    echo("\x1B[31;1;4mDo NOT look back.\x1B[0m")
    echo ""

echo("Welcome, Uninvited Guest.")
var action: string = ""
while action == "" or action != "3":
    echo("[1] Enter the Hotel")
    echo("[2] House Rules")
    echo("[3] Flee")
    action = readLine(stdin)

    if action == "1":
        echo ""
        main()
    elif action == "2":
        echo ""
        showRules()
    elif action == "3":
        echo ""
        echo("Do not come back.")