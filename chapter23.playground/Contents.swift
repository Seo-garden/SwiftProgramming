import UIKit
//23-1
//protocol Receiveable {
//    func received(data: Any, from : Sendable)
//}
//extension Receiveable {
//    func received(data: Any, from : Sendable){
//        print("\(self) received \(data) from \(from)")
//    }
//}
//protocol Sendable {
//    var from : Sendable {get}
//    var to : Receiveable? {get}
//    func send (data : Any)
//    static func isSendableInstance(_ instance : Any) -> Bool
//}
//extension Sendable {
//    var from : Sendable {
//        return self
//    }
//    func send(data : Any){
//        guard let receiver : Receiveable = self.to else {
//            print("Message has no receiver")
//            return
//        }
//        receiver.received(data: data, from: self.from)
//    }
//    static func isSendableInstance(_ instance : Any) -> Bool {
//        if let sendableInstance : Sendable = instance as? Sendable {
//            return sendableInstance.to != nil
//        }
//        return false
//    }
//}
//class Message : Sendable, Receiveable {
//    var to : Receiveable?
//}
//class Mail : Sendable, Receiveable {
//    var to : Receiveable?
//}
//let myPhoneMessage : Message = Message()
//let yourPhoneMessage : Message = Message()
//
//myPhoneMessage.send(data: "hello")
//myPhoneMessage.to = yourPhoneMessage
//myPhoneMessage.send(data: "hello")
//
//let myMail : Mail = Mail()
//let yourMail : Mail = Mail()
//
//myMail.send(data: "Hello")
//
//myMail.to = yourMail
//myMail.send(data: "Hi")
//
//myMail.to = myPhoneMessage
//myMail.send(data: "Bye")
//
//Message.isSendableInstance("Hello")
//Message.isSendableInstance(myPhoneMessage)
//
//Message.isSendableInstance(yourPhoneMessage)
//Mail.isSendableInstance(myPhoneMessage)
//Mail.isSendableInstance(myMail)
//23-3
protocol SelfPrintable {
    func printSelf()
}
extension SelfPrintable where Self: Container {
    func printSelf(){
        print(items)
    }
}
protocol Container: SelfPrintable {
    associatedtype ItemType
    
    var items: [ItemType] {get set}
    var count : Int {get}
    
    mutating func append(item: ItemType)
    subscript(i : Int) -> ItemType {get}
}
extension Container {
    mutating func append(item : ItemType){
        items.append(item)
    }
    var count : Int {
        return items.count
    }
    subscript(i : Int ) -> ItemType {
        return items[i]
    }
}
protocol Popable : Container{
    mutating func pop() -> ItemType?
    mutating func push(_ item : ItemType)
}
extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }
    mutating func push(_ item : ItemType) {
        self.append(item: item)
    }
}
protocol Insertable : Container {
    mutating func delete() -> ItemType?
    mutating func insert(_ item: ItemType)
}
extension Insertable {
    mutating func delete() -> ItemType? {
        return items.removeFirst()
    }
    mutating func insert(_ item: ItemType) {
        self.append(item: item)
    }
}
struct Stack<Element>: Popable {
    var items: [Element] = [Element]()
}
struct Queue<Element>: Insertable {
    var items: [Element] = [Element]()
}
//23-5
let items : Array<Int> = [1,2,3]
let mappedItems : Array<Int> = items.map {(item : Int) -> Int in
    return item * 10
}
print(mappedItems)

