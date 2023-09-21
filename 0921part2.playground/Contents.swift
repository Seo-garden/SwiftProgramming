import UIKit
import Foundation
//9-2
//struct BasicInformation{
//    var name : String
//    var age : Int
//}
//
//var yagomInfo : BasicInformation = BasicInformation(name : "yagom", age : 12)
//yagomInfo.age = 100
//yagomInfo.name = "garden"
//
//print(yagomInfo.name)
//print(yagomInfo.age)
//9-4
//class Person {
//    var height: Float = 0.0
//    var weight: Float = 0.0
//}
//
//var yagom: Person = Person()
//
//yagom.height = 123.4
//yagom.weight = 123.4
//
//let jenny: Person = Person()
//
//jenny.height = 123.4
//jenny.weight = 123.4
//9-5
//class Person {
//    var height : Double = 0.0
//    var weight : Double = 0.0
//
//    deinit {
//        print("Person 클래스의 인스턴스가 소멸됩니다.")
//    }
//}
//
//var yagom: Person? = Person()
//
//yagom = nil
//9-6 정리하면 값 타입의 데이터를 함수의 전달인자로 전달하면 메모리의 전달인자를 위한 인스턴스가 새로 생성. 생성된 새 인스턴스에는 전달하려는 값이 복사되어 들어감. 반면 참조 타입으
//struct BasicInformation{
//    let name: String
//    var age: Int
//}
//
//var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
//yagomInfo.age = 100
//
//var friendInfo: BasicInformation = yagomInfo
//
//print("yagom ' s age : \(yagomInfo.age)")
//print("friend ' s age : \(friendInfo.age)")
//
//friendInfo.age = 999
//
//print("yagom ' s age : \(yagomInfo.age)")
//print("friend ' s age : \(friendInfo.age)")
//print("----------------------------------")
//class Person {
//    var height: Float = 0.0
//    var weight: Float = 0.0
//}
//var yagom: Person = Person()
//var friend: Person = yagom
//
//print("yagom's height : \(yagom.height)")
//print("friend's height : \(friend.weight)")
//
//friend.height = 185.5
//print("yagom ' s height: \(yagom.height)")
//
//print("friend's height : \(friend.height)")
//
//
//func changeBasicInfo(_ info: BasicInformation){
//    var copiedInfo: BasicInformation = info
//    copiedInfo.age = 1
//}
//func changePersonInfo(_ info: Person){
//    info.height = 155.3
//}
//changeBasicInfo(yagomInfo)
//print("yagom's age: \(yagomInfo.age)")
//
//changePersonInfo(yagom)
//print("yagom ' s height : \(yagom.height)")
//
//let name: String = "Jaypark"
//10-1
//struct CoordinatePoint {
//    var x : Int
//    var y : Int
//}
//let yagomPoint : CoordinatePoint = CoordinatePoint(x : 10, y : 5)
//
//class Position {
//    var point: CoordinatePoint
//    let name : String
//    
//    init(name: String, currentPoint: CoordinatePoint){
//        self.name = name
//        self.point = currentPoint
//        
//    }
//}
//
//let yagomPosition: Position = Position(name : "yagom", currentPoint: yagomPoint)
//10-2
struct CoordinatePoint {
    var x : Int = 0
    var y : Int = 0
}
let yagomPoint : CoordinatePoint = CoordinatePoint(x: 10, y: 5)

let wizplanPoint : CoordinatePoint = CoordinatePoint(x:5, y:10)

print("yagom 's : point : \(yagomPoint.x), \(yagomPoint.y)")
print("yagom 's : point : \(wizplanPoint.x), \(wizplanPoint.y)")

class Position {
    var point: CoordinatePoint = CoordinatePoint()
    var name: String = "Unknown"
}

let yagomPosition: Position = Position()

yagomPosition.point = yagomPoint
yagomPosition.name = "yagom"
