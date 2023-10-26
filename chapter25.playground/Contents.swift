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
//25-1
let string : String = "ABC"

switch string {
case _: print(string)
}
let optionalString : String? = "ABC"

switch optionalString {
case "ABC"?: print(optionalString)
case _?: print("Has Value, but not ABC")
case nil: print("nil")
}
let yagom = ("yagom", 99, "Male")
switch yagom {
case("yagom", _, _):print("Hello yagom!!!")
case(_,_,_):print("Who cares~")
}
for _ in 0..<2 {
    print("Hello")
}
//25-3
let yagom3 = ("yagom", 99, "male")
switch yagom3 {
case let(name, age, gender): print("Name : \(name) age : \(age) gender: \(gender)")
}
switch yagom3 {
case (let name, _, let gender):print("Name : \(name), Gender: \(gender)")
}

