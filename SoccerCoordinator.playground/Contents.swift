// SoccerCoordinator
// Developed by Marc Roelofs
// Feb, 23 2017

// Divide all players over 3 teams. The Experienced players must be equally divided over the teams. 
//



//Store players information in a Dictionary with an array [Name: [Height, Played soccer, Guardian]]

var players = ["Joe Smith": ["42", "YES", "Jim and Jan Smith"],
                "Jill Tanner":["36", "YES", "Clara Tanner"],
                "Bill Bon":["43","YES","Sara and Jenny Bon"],
                "Eva Gordon":["45","NO","Wnedy and Mike Gordon"],
                "Matt Gill":["40","NO","Charles and Sylvia Gill"],
                "Kimmie Stein":["41","NO","Bill and HIllary Stein"],
                "Sammy Adams":["45","NO","Jeff Adams"],
                "Karl Saygan":["42","YES","Heather Bledsoe"],
                "Suzanne Greenberg":["44","YES","Henrietta Dumas"],
                "Sal Dali":["41","NO","Gala Dali"],
                "Joe Kavalier":["39","NO","Sam and Elaine Kavalier"],
                "Ben Finkelstein":["44","NO","Aaron and Jill Finkelstein"],
                "Diego Soto":["41","YES","Robin and Sarika Soto"],
                "Chloe Alaska":["47","NO","David and Jamie Alaska"],
                "Arnold Willis":["43","NO","Claire Willis"],
                "Phillip Helm":["44","YES","Thomas Helm and Eva Jones"],
                "Les Clay":["42","YES","Wynonna Brown"],
                "Herschel Krustofski":["45","YES","Hyman and Rachel Krustofski"]]

var teamSharks = [String: Array<String>]()
var teamDragons = [String: Array<String>]()
var teamRaptors = [String: Array<String>]()

var letters = [String]()


func calcAverageTotalHeightPerTeam() -> Int {
    var totalHeight: Int = 0
    
    // Calc total average height per team
    // Add all heights and divide by number of teams (fixed 3)
    
    for player in players {
        totalHeight += Int(player.value[0])!
 
    }
    return totalHeight / 3
}

func maxNumberOfExperiencedPlayersPerTeam() -> Int {
    
    // Determine number of experienced players per team
    // count all players with "YES" and divide by number of teams (fixed 3)

    var experiencedPlayers: Int = 0
    
    for n in players {
        if n.value[1] == "YES" {
            experiencedPlayers += 1
        }
    }
    return experiencedPlayers / 3
}

func isExperiencedPlayer(playerExperience: String) -> Bool {
    
    // Is the player an experienced player? 
    // Return true if "YES"
    
    if playerExperience == "YES" {
        return true
    } else {
        return false
    }
}

func dividePlayers() {
    let maxNumberOfPlayersPerTeam = players.count / 3
    var numberOfPlayersTeamShark = 0
    var numberOfPlayersTeamDragons = 0
    var numberOfPlayersTeamRaptors = 0
    var numberOfExperiencedPlayersTeamShark = 0
    var numberOfExperiencedPlayersTeamDragons = 0
    var heightOfTeamSharks = 0
    var heightOfTeamDragons = 0
    var heightOfTeamRaptors = 0
    
    
    // first divide experienced players over the teams
    
    for player in players {
        if isExperiencedPlayer(playerExperience: player.value[1]) {
            if numberOfExperiencedPlayersTeamShark < maxNumberOfExperiencedPlayersPerTeam() {
                teamSharks[player.key] = player.value
                numberOfExperiencedPlayersTeamShark += 1
                numberOfPlayersTeamShark += 1
                heightOfTeamSharks += Int(player.value[0])!
            } else if numberOfExperiencedPlayersTeamDragons < maxNumberOfExperiencedPlayersPerTeam() {
                teamDragons[player.key] = player.value
                numberOfExperiencedPlayersTeamDragons += 1
                numberOfPlayersTeamDragons += 1
                heightOfTeamDragons += Int(player.value[0])!
            } else {
                teamRaptors[player.key] = player.value
                numberOfPlayersTeamRaptors += 1
                heightOfTeamRaptors += Int(player.value[0])!
            }
        }
    }
    
    // Run through the list again and divide the others over the teams (keep in mind the height of the teams)
    
    for player in players {
        if !isExperiencedPlayer(playerExperience: player.value[1]) {
            if numberOfPlayersTeamShark < maxNumberOfPlayersPerTeam && heightOfTeamSharks <= calcAverageTotalHeightPerTeam() {
                teamSharks[player.key] = player.value
                numberOfExperiencedPlayersTeamShark += 1
                numberOfPlayersTeamShark += 1
                heightOfTeamSharks += Int(player.value[0])!
            } else if numberOfPlayersTeamDragons < maxNumberOfPlayersPerTeam && heightOfTeamDragons <= calcAverageTotalHeightPerTeam(){
                teamDragons[player.key] = player.value
                numberOfExperiencedPlayersTeamDragons += 1
                numberOfPlayersTeamDragons += 1
                heightOfTeamDragons += Int(player.value[0])!
            } else {
                teamRaptors[player.key] = player.value
                numberOfPlayersTeamRaptors += 1
                heightOfTeamRaptors += Int(player.value[0])!
            }
        }
    }
    
}

func createLetters(forTeam team: [String: Array<String>], teamName: String) {
    
    var playTime = ""
    // Select correct play time
    switch teamName {
        case "Sharks": playTime = "March 17, 3pm"
        case "Dragons": playTime = "March 17, 1pm"
        case "Raptors": playTime = "March 18, 1pm"
    default: print("Error: Not a valid team name")
    }
    
    
    // Create letter for each player in the team and append to all letters
    // use \n for new line
    
    for player in team {
        letters.append("Dear \(player.value[2]), \n\nThis letter is to inform you that \(player.key) has been placed in team \(teamName). \n\nThe team will play at\(playTime). \n\nCan you make sure \(player.key) arrives 15 minutes in advance of the playing time so we can start on time?\n\nYours Sincerely,\nCoach Marc")
    }
}




dividePlayers()
createLetters(forTeam: teamSharks, teamName: "Sharks")
createLetters(forTeam: teamDragons, teamName: "Dragons")
createLetters(forTeam: teamRaptors, teamName: "Raptors")

for letter in letters {
    print(letter)
    // print a divider between the letters
    print("\n______________________________________\n")
}









