import UIKit
import SwiftUI
import Foundation

//10-24
//struct SystemVolume {
//    static var volume: Int = 5
//    static func mute(){
//        self.volume = 0
//    }
//}
//
//class navigation{
//    var volume: Int = 5
//    
//    func guideway(){
//        SystemVolume.mute()
//    }
//    func finishGuideWay(){
//        SystemVolume.volume = self.volume
//    }
//}
//
//SystemVolume.volume = 10
//let myNavi: navigation = navigation()
//
//myNavi.guideway()
//print(SystemVolume.volume)
//
//myNavi.finishGuideWay()
//print(SystemVolume.volume)
//11-2
//struct Area {
//    var squareMeter : Double
//    
//    init(){
//        squareMeter = 0.0
//    }
//}
//let room: Area = Area()
//
//print(room.squareMeter)
//11-4
//struct Area{
//    var squareMeter : Double
//    init(){
//        squareMeter = 0.0
//    }
//    init(fromPy py : Double){
//        squareMeter = py * 3.3058
//    }
//    init(fromSquareMeter squareMeter: Double){
//        self.squareMeter = squareMeter
//    }
//    init(value: Double){
//        squareMeter = value
//    }
//    init(_ value: Double){
//        squareMeter = value
//    }
//}
//let roomZero: Area = Area(0.0)
//print(roomZero.squareMeter)
//let roomOne: Area = Area(fromPy: 15.0)
//print(roomOne.squareMeter)
//let roomTwo: Area = Area(fromSquareMeter: 33.06)
//print(roomTwo.squareMeter)
//let roomThree: Area = Area(value: 30.0)
//let roomFour: Area = Area(55.0)
//print(roomThree.squareMeter)
//print(roomFour.squareMeter)
//11-5
//class Person {
//    var name: String
//    var age: Int?
//    
//    init(name: String){
//        self.name = name
//    }
//}
//let yagom: Person = Person(name: "yagom")
//print(yagom.name)
//11-7
//struct Point {
//    var x: Double = 0.0
//    var y: Double = 0.0
//}
//struct Size {
//    var width: Double = 0.0
//    var height: Double = 0.0
//}
//let point : Point = Point(x: 0, y: 0)
//let size: Size = Size(width: 50.0, height: 50.0)
//
//let somePoint: Point = Point()
//let someSize: Size = Size(width: 50)
//let anotherPoint: Point = Point(y: 100)
//class Person {
//    var name: String
//    var age: Int
//
//    // 기본 이니셜라이저
//    init() {
//        name = "Unknown"
//        age = 0
//    }
//}
//
//let person = Person()
//print(person.name) // "Unknown"
//print(person.age)  // 0
//
//struct Point {
//    var x: Double
//    var y: Double
//
//    // 멤버와이즈 이니셜라이저
//    init(x: Double, y: Double) {
//        self.x = x
//        self.y = y
//    }
//}
//
//let point = Point(x: 3.0, y: 4.0)
//print(point.x) // 3.0
//print(point.y) // 4.0
