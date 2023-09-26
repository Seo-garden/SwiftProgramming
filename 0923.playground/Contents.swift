import UIKit
import Foundation
////10-12
class AClass {
    static var typeProperty: Int = 0
    
    var instanceProperty: Int = 0{
        didSet {
            Self.typeProperty = instanceProperty + 100
        }
    }
    static var typeComputedProperty: Int{
        get{
            return typeProperty
        }
        set{
            typeProperty = newValue
        }
    }
}
AClass.typeProperty = 123
let classInstance: AClass = AClass()

classInstance.instanceProperty = 100
print(AClass.typeProperty)
print(AClass.typeComputedProperty)
10-16
class Person {
    var name: String
    
    init(name: String){
        self.name = name
    }
}
struct Stuff{
    var name: String
    var owner: Person
}
let yagom1 = Person(name: "yagom")
let hana1 = Person(name:"hana")
let macbook = Stuff(name: "MacBook Pro", owner: yagom1)
var iMac = Stuff(name: "MacBook M1 Pro", owner: yagom1)
let iPhone = Stuff(name: "iPhone", owner: hana1)

let stuffNameKeyPath = \Stuff.name
let ownerkeyPath = \Stuff.owner

let ownerNameKeyPath = ownerkeyPath.appending(path: \.name)

print(macbook[keyPath: stuffNameKeyPath])
print(iMac[keyPath: stuffNameKeyPath])
print(iPhone[keyPath: stuffNameKeyPath])

print(macbook[keyPath: ownerkeyPath])
print(iMac[keyPath: ownerkeyPath])
print(iPhone[keyPath: ownerkeyPath])

iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
iMac[keyPath: ownerkeyPath] = hana1

print(iMac[keyPath: stuffNameKeyPath])
iMac[keyPath: stuffNameKeyPath] = "Master"
print(iMac[keyPath: stuffNameKeyPath])
10-17
struct Person {
    let name: String
    let nickname: String?
    let age: Int
    
    var isAdult: Bool {
        return age > 18
    }
}
let yagom: Person = Person(name: "yagom", nickname: "bear", age: 100)
let hana: Person = Person(name: "hana", nickname: "na", age: 100)
let happy: Person = Person(name: "happy", nickname: nil, age: 3)
10-18
class LevelClass {
    var Level: Int = 0 {
        didSet {
            print("Level \(Level)")
        }
    }
    func levelUp(){
        print("Level UP")
        Level+=1
    }
    func levelDown(){
        print("Level DOWN")
        Level-=1
    }
    func jumpLevel(to: Int){
        print("Jump to \(to)")
        Level = to
    }
    func reset(){
        print("reset")
        Level = 0
    }
}
var levelClassInstance: LevelClass = LevelClass()

levelClassInstance.levelUp()
10-19
struct LevelStruct{
    var level: Int = 0 {
        didSet{
            print("Level is \(level)")
        }
    }
    mutating func LevelUp(){
        print("Level Up")
        level += 1
    }
    mutating func LevelDown(){
        print("Level Down")
        level -= 1
    }
    mutating func reset(){
        print("reset")
        level = 0
    }
}
var levelStructInstance : LevelStruct = LevelStruct()

levelStructInstance.LevelUp()
10-22
struct poppy{
    var name: String = "멍멍이"
    func callAsFunction(){
        print("멍멍")
    }
    func callAsFunction(destination: String){
        print("\(destination)으로 달려갑니다.")
    }
    func callAsFunction(something: String, times: Int){
        print("\(something) 을 \(times) 만큼 반복합니다.")
    }
    func callAsFunction(color: String) -> String{
        return "\(color)응가"
    }
    mutating func callAsFunction(name: String){
        self.name = name
    }
}

var doggy: poppy = poppy()

doggy.callAsFunction()
doggy()
doggy.callAsFunction(destination: "집")
doggy(destination: "동산")
