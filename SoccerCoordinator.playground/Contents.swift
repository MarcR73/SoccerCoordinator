// SoccerCoordinator
// Developed by Marc Roelofs
// Feb, 23 2017

// Divide all players over 3 teams. The Experienced players must be equally divided over the teams. 
//
// Solution:
// - Determine the number of Experienced players (all player with "YES" and divide by 3
// - Determine the number of total players per team; count players and divide by 3
// - walk through each player, 
//      check if experienced, 
//         if yes then if number of experienced is under max and total number in team is under max: add to the team
//         if no then is total number in team is under max: add to the team
//         else check the same for the next team


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

func maxNumberOfExperiencedPlayersPerTeam() -> Int {

    var experiencedPlayers: Int = 0
    
    for n in players {
        if n.value[1] == "YES" {
            experiencedPlayers += 1
        }
    }
    return experiencedPlayers / 3
}

func isExperiencedPlayer(playerExperience: String) -> Bool {
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
    var numberOfExperiencedPlayersTeamShark = 0
    var numberOfExperiencedPlayersTeamDragons = 0
    
    
    // first divide experienced players over the teams
    for player in players {
        if isExperiencedPlayer(playerExperience: player.value[1]) {
            if numberOfExperiencedPlayersTeamShark < maxNumberOfExperiencedPlayersPerTeam() {
                teamSharks[player.key] = player.value
                numberOfExperiencedPlayersTeamShark += 1
                numberOfPlayersTeamShark += 1
            } else if numberOfExperiencedPlayersTeamDragons < maxNumberOfExperiencedPlayersPerTeam() {
                teamDragons[player.key] = player.value
                numberOfExperiencedPlayersTeamDragons += 1
                numberOfPlayersTeamDragons += 1
            } else {
                teamRaptors[player.key] = player.value
            }
        }
    }
    
    // Then divide the others over the teams
    
    for player in players {
        if !isExperiencedPlayer(playerExperience: player.value[1]) {
            if numberOfPlayersTeamShark < maxNumberOfPlayersPerTeam {
                teamSharks[player.key] = player.value
                numberOfExperiencedPlayersTeamShark += 1
                numberOfPlayersTeamShark += 1
            } else if numberOfPlayersTeamDragons < maxNumberOfPlayersPerTeam {
                teamDragons[player.key] = player.value
                numberOfExperiencedPlayersTeamDragons += 1
                numberOfPlayersTeamDragons += 1
            } else {
                teamRaptors[player.key] = player.value
            }
        }
    }
    
}




dividePlayers()
print("Sharks")
print(teamSharks)
print("Dragons")
print(teamDragons)
print("Raptors")
print(teamRaptors)






