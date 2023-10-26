import UIKit

//24-2
struct Sports {
    enum GameType {
        case football, basketball
    }
    var gameType : GameType
    struct GameInfo {
        var time : Int
        var player: Int
    }
    var gameInfo: GameInfo {
        switch self.gameType {
        case .football:
            return GameInfo(time: 90, player: 11)
        case .basketball:
            return GameInfo(time: 40, player: 5)
        }
    }
}
struct ESports {
    enum GameType {
        case online, offline
    }
    var gameType: GameType
    struct GameInfo {
        var location : String
        var package : String
    }
    var gameInfo : GameInfo {
        switch self.gameType {
        case .online :
                return GameInfo(location: "wwww.leagueoflegends.co.kr", package: "LOL")
        case .offline:
                return GameInfo(location: "sa.nexon.com", package: "SA")
        }
    }
}
var basketball : Sports = Sports(gameType: .basketball)
print(basketball.gameInfo)
var sudden : ESports = ESports(gameType: .online)
print(sudden.gameInfo)

let someGameType : Sports.GameType = .football
let anotherGameType : ESports.GameType = .online

