// Teamtreehouse Swift tech degree
// - project 01 Soccer League Coordinator

// - DIctionary for players
var players: [String: (height: Int, experience: Bool, guardians: String)] = [
    "Joe Smith": (42, true, "Jim and Jan Smith"),
    "Jill Tanner": (36, true, "Clara Tanner"),
    "Bill Bon": (43, true, "Sara and Jenny Bon"),
    "Eva Gordon": (45, false, "Wendy and Mike Gordon"),
    "Matt Gill": (40, false, "Charles and Sylvia Gill"),
    "Kimmy Stein": (41, false, "Bill and Hillary Stein"),
    "Sammy Adams": (45, false, "Jeff Adams"),
    "Karl Saygan": (42, true, "Heather Bledsoe"),
    "Suzane Greenberg": (44, true, "Henrietta Dumas"),
    "Sal Dali": (41, false, "Gala Dali"),
    "Joe Kavalier": (39, false, "Sam and Elaine Kavalier"),
    "Ben Finkelstein": (44, false, "Aaron and Jill Finkelstein"),
    "Diego Soto": (41, true, "Robin and Sarika Soto"),
    "Chloe Alaska": (47, false, "David and Jamie Alaska"),
    "Arnold Willis": (43, false, "Claire Willis"),
    "Phillip Helm": (44, true, "Thomas Helm and Eva Jones"),
    "Les Clay": (42, true, "Wynonna Brown"),
    "Herschel Krustofski": (45, true, "Hyman and Rachel Krustofski")
]

// - Arrays to store experienced and not experienced players by key (string)
var experiencedPlayers: [String] = []
var notExperiencedPlayers: [String] = []

// - Arrays for teams to store divided players
var Dragons: [String] = []
var Sharks: [String] = []
var Raptors: [String] = []

// - varaibles for number of team player count
var countDragons = 0
var countSharks = 0
var countRaptors = 0

// - dictionary for teams training datetime
var teamDates: [String: (date: String, time: String)] = [
    "Dragons": ("March 17", "1:00 PM"),
    "Sharks": ("March 17", "3:00 PM"),
    "Raptors": ("March 18", "1:00 PM")
]

// - loop to sort players by experience
for (key, value) in players {
    if value.experience == true {
        experiencedPlayers.append(key)
    } else {
        notExperiencedPlayers.append(key)
    }
}

// - checking how many players per team have to be assigned
// if players count is divideable exactly by 3, assign each team the player count / 3
// else if there is a remainder of 1, assign each team the player count / 3 + 1 to dragons
// else (there is a remainder of 2), assign each team the player count / 3, + 1 to dragons and +1 to sharks
if players.count % 3 == 0 {
    countDragons = players.count / 3
    countSharks = players.count / 3
    countRaptors = players.count / 3
} else if players.count % 3 == 1 {
    countDragons = (players.count / 3) + 1
    countSharks = players.count / 3
    countRaptors = players.count / 3
} else {
    countDragons = (players.count / 3) + 1
    countSharks = (players.count / 3) + 1
    countRaptors = players.count / 3
}

// - while loop to divide experienced players
// - loop finishes when there is no more players to sort
while experiencedPlayers.count > 0 {
    // set empty strings
    var longestPlayerName: String = ""
    var longestPlayerHeight: Int = 0
    var currentPlayerName: String = ""
    var currentPlayerHeight: Int = 0
    // - for loop to find the player with the longest height (if multiples have the same height, first player found applies)
    for key in experiencedPlayers {
        // if there has not been a player with highest height selected yet, select automatically this one to compare with others
        // else compare this current player with the heighest height player so far
        if longestPlayerName == "" {
            longestPlayerName = key
            longestPlayerHeight = players[key]!.height
        } else {
            currentPlayerName = key
            currentPlayerHeight = players[key]!.height
            // if this current player hieght is higher that the longest player height, set this player as the longest player
            if currentPlayerHeight > longestPlayerHeight {
                longestPlayerName = currentPlayerName
                longestPlayerHeight = currentPlayerHeight
            }
        }
    }
    // - selecting a team where to put the player
    // if there is space in dragons team and dragons team count is equal to sharks and raptors, insert player in dragons
    // else if there is space in Sharks, Sharks has less players than dragons, and sharks has players equal to raptors, insert player in sharks
    // else if there is space in Raptors, Raptors has less players than dragons, and raptors has less players than sharks, insert player in raptors
    if Dragons.count < countDragons && Dragons.count == Sharks.count && Dragons.count == Raptors.count {
        Dragons.append(longestPlayerName)
    } else if Sharks.count < countSharks && Sharks.count < Dragons.count && Sharks.count == Raptors.count {
        Sharks.append(longestPlayerName)
    } else if Raptors.count < countRaptors && Raptors.count < Dragons.count && Raptors.count < Sharks.count {
        Raptors.append(longestPlayerName)
    }
    // remove player from array.
    experiencedPlayers = experiencedPlayers.filter{$0 != longestPlayerName}
}

// - while loop to divide not experienced players
// - loop finishes when there is no more players to sort
while notExperiencedPlayers.count > 0 {
    // set empty strings
    var longestPlayerName: String = ""
    var longestPlayerHeight: Int = 0
    var currentPlayerName: String = ""
    var currentPlayerHeight: Int = 0
    // - for loop to find the player with the longest height (if multiples have the same height, first player found applies)
    for key in notExperiencedPlayers {
        // if there has not been a player with highest height selected yet, select automatically this one to compare with others
        // else compare this current player with the heighest height player so far
        if longestPlayerName == "" {
            longestPlayerName = key
            longestPlayerHeight = players[key]!.height
        } else {
            currentPlayerName = key
            currentPlayerHeight = players[key]!.height
            // if this current player hieght is higher that the longest player height, set this player as the longest player
            if currentPlayerHeight > longestPlayerHeight {
                longestPlayerName = currentPlayerName
                longestPlayerHeight = currentPlayerHeight
            }
        }
    }
    // - selecting a team where to put the player
    // if there is space in dragons team and dragons team count is equal to sharks and raptors, insert player in dragons
    // else if there is space in Sharks, Sharks has less players than dragons, and sharks has players equal to raptors, insert player in sharks
    // else if there is space in Raptors, Raptors has less players than dragons, and raptors has less players than sharks, insert player in raptors
    if Dragons.count < countDragons && Dragons.count == Sharks.count && Dragons.count == Raptors.count {
        Dragons.append(longestPlayerName)
    } else if Sharks.count < countSharks && Sharks.count < Dragons.count && Sharks.count == Raptors.count {
        Sharks.append(longestPlayerName)
    } else if Raptors.count < countRaptors && Raptors.count < Dragons.count && Raptors.count < Sharks.count {
        Raptors.append(longestPlayerName)
    }
    // remove player from array.
    notExperiencedPlayers = notExperiencedPlayers.filter{$0 != longestPlayerName}
}

// - loop all 3 teams and generate message to gusrdians
for Dragon in Dragons {
    print("Dear \(players[Dragon]!.guardians), we are happy to inform you that \(Dragon) will be participating in Dragons this year. The first training date is on \(teamDates["Dragons"]!.date), \(teamDates["Dragons"]!.time) best reagrds, the coach")
}
for Shark in Sharks {
    print("Dear \(players[Shark]!.guardians), we are happy to inform you that \(Shark) will be participating in Sharks this year. The first training date is on \(teamDates["Sharks"]!.date), \(teamDates["Sharks"]!.time) best reagrds, the coach")
}
for Raptor in Raptors {
    print("Dear \(players[Raptor]!.guardians), we are happy to inform you that \(Raptor) will be participating in Raptors this year. The first training date is on \(teamDates["Raptors"]!.date), \(teamDates["Raptors"]!.time) best reagrds, the coach")
}










