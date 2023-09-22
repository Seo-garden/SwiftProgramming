import UIKit
import Foundation
//10-2
//struct CoordinatePoint{
//    var x: Int = 0
//    var y: Int = 0
//}
//let yagomPoint : CoordinatePoint = CoordinatePoint()
//let wizplanPoint: CoordinatePoint = CoordinatePoint(x: 10, y:20)
//
//class Position {
//    var x1 : CoordinatePoint = CoordinatePoint()
//    var y1 : String = "Unknown"
//}
//10-3
//struct CoordinatePoint {
//    var x : Int
//    var y : Int
//}
//
//class Position {
//    var point: CoordinatePoint?
//    
//    let name: String
//    init(name: String){
//        self.name = name
//    }
//}
//
//let yagomPosition : Position = Position(name: "yagom")
//yagomPosition.point = CoordinatePoint(x: 10, y: 20)
//10-4
//struct CoordinatePoint {
//    var x: Int = 0
//    var y: Int = 0
//}
//
//class Position {
//    lazy var point: CoordinatePoint = CoordinatePoint()
//    let name: String
//    
//    init(name: String){
//        self.name = name
//    }
//}
//
//let yagomPosition: Position = Position(name: "yagom")
//
//print(yagomPosition.point)
//10-5 와 10-6 비교하면서
//struct CoordinatePoint{
//    var x: Int
//    var y: Int
//    
//    func oppositePoint() -> Self{
//        return CoordinatePoint(x: -x, y: -y)
//    }
//    mutating func setOppositePoint(_ opposite: CoordinatePoint){
//        x = -opposite.x
//        y = -opposite.y
//    }
//}
//var yagomPosition : CoordinatePoint = CoordinatePoint(x: 10, y: 20)
//print(yagomPosition)
//print(yagomPosition.oppositePoint())
//10-6
//struct CoordinatePoint {
//    var x: Int
//    var y: Int
//    
//    var oppositePoint: CoordinatePoint {
//        get {
//            return CoordinatePoint(x: -x, y: -y)
//        }
//        set(oppositePoint){
//            x = -oppositePoint.x
//            y = -oppositePoint.y
//        }
//    }
//}
//var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)
//print(yagomPosition)
//print(yagomPosition.oppositePoint)
//10-9, 10
//class Account {
//    var credit: Int = 0{
//        willSet{
//            print("잔액이 \(credit)원에서 \(newValue) 로 변경될 예정입니다.")
//        }
//        didSet{
//            print("잔액이 \(oldValue)원에서 \(credit) 원으로 변경되었습니다.")
//        }
//    }
//    var dollarValue : Double {
//        get{
//            return Double(credit) / 1000.0
//        }
//        set{
//            credit = Int(newValue * 1000)
//            print("잔액을 \(newValue) 달러로 변경중입니다.")
//        }
//    }
//}
//class ForeignAccount: Account {
//    override var dollarValue: Double {
//        willSet {
//            print("잔액이 \(dollarValue) 에서 \(newValue)달러로 변경될 예정입니다.")
//        }
//        didSet {
//            print("잔액이 \(oldValue)에서 \(dollarValue)달러로 변경되었습니다.")
//        }
//    }
//}
//
//let myAccount : ForeignAccount = ForeignAccount()
//
//myAccount.credit = 1000
//myAccount.dollarValue = 2

