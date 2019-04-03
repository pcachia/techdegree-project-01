// Teamtreehouse Swift tech degree
// - project 01 Soccer League Coordinator
// - 3rd attempt for the "Exceeds Expectations" grade 04/04/2019
// - By Phil Cachia

// - Dictionary for players
let players: [[String:Any]] = [
    [
        "name":"Joe Smith",
        "height":42,
        "experience":true,
        "guardians":"Jim and Jan Smith"
    ],
    [
        "name":"Jill Tanner",
        "height":36,
        "experience":true,
        "guardians":"Clara Tanner"
    ],
    [
        "name":"Bill bon",
        "height":43,
        "experience":true,
        "guardians":"Sara and Jenny Bon"
    ],
    [
        "name":"Eva Gordon",
        "height":45,
        "experience":false,
        "guardians":"Wendy and Mike Gordon"
    ],
    [
        "name":"Matt Gill",
        "height":40,
        "experience":false,
        "guardians":"Charles and Sylvia Gill"
    ],
    [
        "name":"Kimmy Stein",
        "height":41,
        "experience":false,
        "guardians":"Bill and Hillary Stein"
    ],
    [
        "name":"Sammy Adams",
        "height":46,
        "experience":false,
        "guardians":"Jeff Adams"
    ],
    [
        "name":"Karl Saygan",
        "height":42,
        "experience":true,
        "guardians":"Heather Bledsoe"
    ],
    [
        "name":"Suzane Greenberg",
        "height":44,
        "experience":true,
        "guardians":"Henrietta Dumas"
    ],
    [
        "name":"Sal Dali",
        "height":41,
        "experience":false,
        "guardians":"Gala Dali"
    ],
    [
        "name":"Joe Kavalier",
        "height":39,
        "experience":false,
        "guardians":"Sam and Elaine Kavalier"
    ],
    [
        "name":"Ben Finkelstein",
        "height":44,
        "experience":false,
        "guardians":"Aaron and Jill Finkelstein"
    ],
    [
        "name":"Diego Soto",
        "height":41,
        "experience":true,
        "guardians":"Robin and Sarika Soto"
    ],
    [
        "name":"Chloe Alaska",
        "height":47,
        "experience":false,
        "guardians":"David and Jamie Alaska"
    ],
    [
        "name":"Arnold Willis",
        "height":43,
        "experience":false,
        "guardians":"Claire Willis"
    ],
    [
        "name":"Phillip Helm",
        "height":44,
        "experience":true,
        "guardians":"Thomas Helm and Eva Jones"
    ],
    [
        "name":"Les Clay",
        "height":42,
        "experience":true,
        "guardians":"Wynonna Brown"
    ],
    [
        "name":"Herschel Krustofski",
        "height":45,
        "experience":true,
        "guardians":"Hyman and Rachel Krustofski"
    ]
]

// - Arrays to store experienced and not experienced players by key
var experiencedPlayers: [Int] = []
var notExperiencedPlayers: [Int] = []

// - Arrays for teams to store divided players
var teamDragons: [Int] = []
var teamSharks: [Int] = []
var teamRaptors: [Int] = []

// - varaibles for number of team player count
var countDragons = 0
var countSharks = 0
var countRaptors = 0

// - varaibles for number of team players count
var countExperiencedDragons = 0
var countExperiencedSharks = 0
var countExperiencedRaptors = 0

// - variales for teams total heights
var dragonsTotalHeight = 0
var sharksTotalHeight = 0
var raptorsTotalHeight = 0

// - varaibles for average of team player height
var averageDragons: Double = 0
var averageSharks: Double = 0
var averageRaptors: Double = 0

// - dictionary for teams training datetime
let teamDates: [String: (date: String, time: String)] = [
    "teamDragons": ("March 17", "1:00 PM"),
    "teamSharks": ("March 17", "3:00 PM"),
    "teamRaptors": ("March 18", "1:00 PM")
]

// - variable that will be used to loop various persons loops (will reset at the start of each loop)
var countedPersons = 0

// - array used for player selection
var playerSelection: [Int] = []

// - variable used for checking if teams are equally balanced
var teamAreEqualyBalanced = false

// - array to store letters for guardians
var letters: [String] = []

// - for loop to sort players by experience
for person in players {
    // if current player has experience, append player to experiencedPlayers array
    // else append player to notExperiencedPlayers array
    if person["experience"] as? Bool == true {
        experiencedPlayers.append(countedPersons)
    } else {
        notExperiencedPlayers.append(countedPersons)
    }
    // add + 1 to countedPersons variable
    countedPersons += 1
}

// - checking how many players per team have to be assigned
// if players count is divideable exactly by (number of teams), assign each team the (player count / number of teams)
// else if there is a remainder of 1, assign each team the (player count / number of teams) and + 1 player to team dragons
// else (there is a remainder of 2), assign each team the (player count / number of teams), + 1 player to team dragons and + 1 player to team sharks
if players.count % teamDates.count == 0 {
    countDragons = players.count / teamDates.count
    countSharks = players.count / teamDates.count
    countRaptors = players.count / teamDates.count
} else if players.count % teamDates.count == 1 {
    countDragons = (players.count / teamDates.count) + 1
    countSharks = players.count / teamDates.count
    countRaptors = players.count / teamDates.count
} else {
    countDragons = (players.count / teamDates.count) + 1
    countSharks = (players.count / teamDates.count) + 1
    countRaptors = players.count / teamDates.count
}

// - copy expieranced players into playerSelection
playerSelection = experiencedPlayers
// - while loop to divide playerSelection
// - loop finishes when there is no more players to sort
while playerSelection.count > 0 {
    // set empty strings
    var longestPlayer: Int = -1
    var longestPlayerHeight: Int = -1
    var currentPlayer: Int = -1
    var currentPlayerHeight: Int = -1
    // - for loop to find the player with the longest height (if multiples have the same height, first player found applies)
    for person in playerSelection {
        // if there has not been a player with highest height selected yet, select automatically this one to compare with others
        // else compare this current player with the heighest height player so far
        if longestPlayer < 0 {
            longestPlayer = person
            longestPlayerHeight = players[person]["height"] as! Int
        } else {
            currentPlayer = person
            currentPlayerHeight = players[person]["height"] as! Int
            // if this current player height is higher than the longest player height, set this player as the longest player
            if currentPlayerHeight > longestPlayerHeight {
                longestPlayer = currentPlayer
                longestPlayerHeight = currentPlayerHeight
            }
        }
    }
    // - selecting a team where to put the player
    // if there is space in dragons team and dragons team count is equal to sharks and raptors, insert player in dragons
        // if team dragons player is experienced, add a + 1 on countExperiencedDragons variable
    // else if there is space in Sharks, Sharks has less players than dragons, and sharks has players equal to raptors, insert player in sharks
        // if team sharks player is experienced, add a + 1 on countExperiencedSharks variable
    // else if there is space in Raptors, Raptors has less players than dragons, and raptors has less players than sharks, insert player in raptors
        // if team raptors player is experienced, add a + 1 on countExperiencedRaptors variable
    if teamDragons.count < countDragons && teamDragons.count == teamSharks.count && teamDragons.count == teamRaptors.count {
        teamDragons.append(longestPlayer)
        dragonsTotalHeight += players[longestPlayer]["height"] as! Int
        if players[longestPlayer]["experience"] as! Bool == true {
            countExperiencedDragons += 1
        }
   } else if teamSharks.count < countSharks && teamSharks.count < teamDragons.count && teamSharks.count == teamRaptors.count {
        teamSharks.append(longestPlayer)
        sharksTotalHeight += players[longestPlayer]["height"] as! Int
        if players[longestPlayer]["experience"] as! Bool == true {
            countExperiencedSharks += 1
        }
    } else if teamRaptors.count < countRaptors && teamRaptors.count < teamDragons.count && teamRaptors.count < teamSharks.count {
        teamRaptors.append(longestPlayer)
        raptorsTotalHeight += players[longestPlayer]["height"] as! Int
        if players[longestPlayer]["experience"] as! Bool == true {
            countExperiencedRaptors += 1
        }
    }
    // remove player from array.
    playerSelection = playerSelection.filter{$0 != longestPlayer}
}

// - copy not expieranced players into playerSelection
playerSelection = notExperiencedPlayers
// - while loop to divide playerSelection
// - loop finishes when there is no more players to sort
while playerSelection.count > 0 {
    // set empty strings
    var longestPlayer: Int = -1
    var longestPlayerHeight: Int = -1
    var currentPlayer: Int = -1
    var currentPlayerHeight: Int = -1
    // - for loop to find the player with the longest height (if multiples have the same height, first player found applies)
    for person in playerSelection {
        // if there has not been a player with highest height selected yet, select automatically this one to compare with others
        // else compare this current player with the heighest height player so far
        if longestPlayer < 0 {
            longestPlayer = person
            longestPlayerHeight = players[person]["height"] as! Int
        } else {
            currentPlayer = person
            currentPlayerHeight = players[person]["height"] as! Int
            // if this current player hieght is higher that the longest player height, set this player as the longest player
            if currentPlayerHeight > longestPlayerHeight {
                longestPlayer = currentPlayer
                longestPlayerHeight = currentPlayerHeight
            }
        }
    }
    // - selecting a team where to put the player
    // if team dragons total hieght is less than the other 2 teams, insert player in team dragons
    // else if team sharks total hieght is less than the other 2 teams, insert player in team sharks
    // else if team raptors total hieght is less than the other 2 teams, insert player in team raptors
    // else if there is space in team dragons and dragons team count is less than one of the other two teams, insert player in team dragons
    // else if there is space in team sharks and sharks team count is less than one of the other two teams, insert player in team sharks
    // else if there is space in team raptors and raptors team count is less than one of the other two teams, insert player in team raptors
    if dragonsTotalHeight < sharksTotalHeight && dragonsTotalHeight < raptorsTotalHeight {
        teamDragons.append(longestPlayer)
        dragonsTotalHeight += players[longestPlayer]["height"] as! Int
    } else if sharksTotalHeight < raptorsTotalHeight && sharksTotalHeight < dragonsTotalHeight {
        teamSharks.append(longestPlayer)
        sharksTotalHeight += players[longestPlayer]["height"] as! Int
    } else if raptorsTotalHeight < dragonsTotalHeight && raptorsTotalHeight < sharksTotalHeight {
        teamRaptors.append(longestPlayer)
        raptorsTotalHeight += players[longestPlayer]["height"] as! Int
    } else if teamDragons.count < countDragons && (teamDragons.count < teamSharks.count || teamDragons.count < teamRaptors.count) {
        teamDragons.append(longestPlayer)
        dragonsTotalHeight += players[longestPlayer]["height"] as! Int
    } else if teamSharks.count < countSharks && (teamSharks.count < teamRaptors.count || teamSharks.count < teamDragons.count) {
        teamSharks.append(longestPlayer)
        sharksTotalHeight += players[longestPlayer]["height"] as! Int
    } else if teamRaptors.count < countRaptors && (teamRaptors.count < teamDragons.count || teamRaptors.count < teamSharks.count) {
        teamRaptors.append(longestPlayer)
        raptorsTotalHeight += players[longestPlayer]["height"] as! Int
    }
    // remove player from array.
    playerSelection = playerSelection.filter{$0 != longestPlayer}
}

// getting averages of teams
averageDragons = Double(dragonsTotalHeight) / Double(teamDragons.count)
averageSharks = Double(sharksTotalHeight) / Double(teamSharks.count)
averageRaptors = Double(raptorsTotalHeight) / Double(teamRaptors.count)

// checking if all teams are built by height not having the average difference of 1.5 inches with each other
// if one team average value compared to the other two average team values has as average of less than -1,5 or greater than 1,5 than the others, turn teamAreEqualyBalanced to false and make changes to teams,
// else all teams are equaly split, turn variale to true
if (averageDragons - averageSharks) < -1.5 || (averageDragons - averageSharks) > 1.5 ||
    (averageDragons - averageRaptors) < -1.5 || (averageDragons - averageRaptors) > 1.5 ||
    (averageSharks - averageRaptors) < -1.5 || (averageSharks - averageRaptors) > 1.5 {
    teamAreEqualyBalanced = false
} else {
    teamAreEqualyBalanced = true
}

// print teams averages
print("Team Dragons average height is \(averageDragons)")
print("Team Sharks average height is \(averageSharks)")
print("Team Raptors average height is \(averageRaptors)")

// print all teams numbers of exprienced players
print("The number of expieranced players in team dragons is \(countExperiencedDragons)")
print("The number of expieranced players in team sharks is \(countExperiencedSharks)")
print("The number of expieranced players in team raptors is \(countExperiencedRaptors)")

// print message if teams are split with an average height of 1.5 difference between each other or not
if teamAreEqualyBalanced == true {
    print("All teams averages are within 1.5 inch of eachother")
} else {
    print("All teams averages are not within 1.5 inch of eachother")
}


// - loop all 3 teams and generate message to guardians, append all messages to letters array
for Dragon in teamDragons {
    letters.append("Dear \(players[Dragon]["guardians"] as! String), we are happy to inform you that \(players[Dragon]["name"] as! String) will be participating in Team Dragons this year. The first training date is on \(teamDates["teamDragons"]!.date), \(teamDates["teamDragons"]!.time) best reagrds, the coach")
}
for Shark in teamSharks {
    letters.append("Dear \(players[Shark]["guardians"] as! String), we are happy to inform you that \(players[Shark]["name"] as! String) will be participating in Team Sharks this year. The first training date is on \(teamDates["teamSharks"]!.date), \(teamDates["teamSharks"]!.time) best reagrds, the coach")
}
for Raptor in teamRaptors {
    letters.append("Dear \(players[Raptor]["guardians"] as! String), we are happy to inform you that \(players[Raptor]["name"] as! String) will be participating in Team Raptors this year. The first training date is on \(teamDates["teamRaptors"]!.date), \(teamDates["teamRaptors"]!.time) best reagrds, the coach")
}
