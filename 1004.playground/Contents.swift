import UIKit
//13-1
class Room {
    var number: Int
    
    init(number: Int){
        self.number = number
    }
}
class Building {
    var name: String
    var room: Room?
    
    init(name: String){
        self.name = name
    }
}
struct Address {
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
    
}
class Person {
    var name: String
    var address: Address?
    
    init(name: String){
        self.name = name
    }
}

let yagom: Person = Person(name:"yagom")

let yagomRoomViaOptionalChaning: Int? = yagom.address?.building?.room?.number
//let yagomRoomViaOptionalChaning: Int = yagom.address!.building!.room!.number
var roomNumber: Int? = nil
if let yagomAddress: Address = yagom.address {
    if let yagombuilding: Building = yagomAddress.building {
        if let yagomRoom: Room = yagombuilding.room {
            roomNumber = yagomRoom.number
        }
    }
}
if let number: Int = roomNumber {
    print(number)
} else {
    print("Can't find room number")
}
//14-5 옵셔널 체이닝 사용
if let roomNumber: Int = yagom.address?.building?.room?.number {
    print(roomNumber)
} else {
    print("Can't find room number")
}
yagom.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로", building: nil, detailAddress: nil)
struct Address {
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
    
    init(province: String, city: String, street: String) {
        self.province = province
        self.city = city
        self.street = street
    }
    func fullAddress() -> String? {
        var restAddress: String? = nil
        
        if let buildingInfo : Building = self.building {
            restAddress = buildingInfo.name
        } else if let detail = self.detailAddress {
            restAddress = detail
        }
        if let rest: String = restAddress {
            var fullAddress: String = self.province
            
            fullAddress += " " + self.city
            fullAddress += " " + self.street
            fullAddress += " " + rest
            
            return fullAddress
        } else {
            return nil
        }
    }
    func printAddress(){
        if let address: String = self.fullAddress() {
            print(address)
        }
    }
}
yagom.address?.fullAddress()?.isEmpty
yagom.address?.printAddress()
func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return
    }
    print("Hello \(name)")
    
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    print("I hope the weather is nice in \(location)")
}
var personInfo: [String: String] = [String: String]()
personInfo["name"] = "Jenny"
greet(personInfo)
personInfo["location"] = "Korea"
greet(personInfo)
//15-1
let numbers: [Int] = [0,1,2,3,4]

var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

//for 구문 사용
for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}
print(doubledNumbers)
print(strings)
//map 메서드 사용
doubledNumbers = numbers.map({(number: Int) -> Int in
    return number * 2})
strings = numbers.map({(number: Int) -> String in
    return "\(number)"})
print(doubledNumbers)
print(strings)
//15-2
var doubleNumbers = numbers.map({(number: Int)-> Int in
    return number * 2
})
doubleNumbers = numbers.map({return $0 * 2})
print(doubledNumbers)

doubleNumbers = numbers.map({$0 * 2})
print(doubledNumbers)

doubleNumbers = numbers.map{$0 * 2 }
print(doubledNumbers)

//15-4
let alphabetDictionary: [String: String] = ["a" : "A", "b" : "B"]
var keys: [String] = alphabetDictionary.map({(tuple: (String, String)) -> String
    in return tuple.0})
keys = alphabetDictionary.map{$0.0}
let values: [String] = alphabetDictionary.map{$0.1}
print(keys)
print(values)

var numberSet: Set<Int> = [1,2,3,4,5]
let resultSet = numberSet.map{ $0 * 2}
print(resultSet)

let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map {$0 * 2}
print(resultInt)

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map{$0 * 2}
print(resultRange)
