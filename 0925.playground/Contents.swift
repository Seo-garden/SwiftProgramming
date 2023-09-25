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
struct Area{
    var squareMeter : Double
    init(){
        squareMeter = 0.0
    }
    init(fromPy py : Double){
        squareMeter = py * 3.3058
    }
    init(fromSquareMeter squareMeter: Double){
        self.squareMeter = squareMeter
    }
    init(value: Double){
        squareMeter = value
    }
    init(_ value: Double){
        squareMeter = value
    }
}
let roomZero: Area = Area(0.0)
print(roomZero.squareMeter)
let roomOne: Area = Area(fromPy: 15.0)
print(roomOne.squareMeter)
let roomTwo: Area = Area(fromSquareMeter: 33.06)
print(roomTwo.squareMeter)
let roomThree: Area = Area(value: 30.0)
let roomFour: Area = Area(55.0)
print(roomThree.squareMeter)
print(roomFour.squareMeter)

