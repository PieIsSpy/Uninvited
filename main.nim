echo("Welcome, Uninvited Guest.")
var name: string = ""
while name == "" or name != "3":
    echo("[1] Enter the Hotel")
    echo("[2] House Rules")
    echo("[3] Flee")
    name = readLine(stdin)

    if name == "1":
        echo 1
    elif name == "2":
        echo 2
    elif name == "3":
        echo("Do not come back.")