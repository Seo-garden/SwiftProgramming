import UIKit
import Foundation

//20-3
protocol SomeProtocol {
    var settableProperty : String {get set}
    var notNeedToBeSettableProperty: String {get}
}
protocol AnotherProtocol {
    static var someTypeProperty: Int {get set}
    static var anotherTypeProperty: Int {get}
}
//20-4
//protocol Sendable {
//    var from: String {get}
//    var to: String {get}
//}
//
//class Message: Sendable {
//    var sender: String
//    var from: String {
//        return self.sender
//    }
//    var to: String
//    init(sender:String, receiver: String){
//        self.sender = sender
//        self.to = receiver
//    }
//}
//class Mail : Sendable {
//    var from: String
//    var to: String
//    
//    init(sender:String, receiver: String){
//        self.from = sender
//        self.to = receiver
//    }
//}
//20-5
// 무언가를 수신받을 수 있는 기능
protocol Receiveable {
    func received(data: Any, from: Sendable)
}
//무언가를 발신할 수 있는 기능
protocol Sendable {
    var from : Sendable { get }
    var to: Receiveable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}
//수신, 발신이 가능한 Message 클래스
class Message: Sendable, Receiveable {
    // 발신은 발신 가능한 객체, 즉 Sendable 프로토콜을 준수하는 타입의 인스턴스여야 합니다.
    var from: Sendable {
        return self
    }
    //상대방은 수신 가능한 객체, 즉 Receiveable 프로토콜을 준수하는 타입의 인스턴스 여야 합니다.
    var to: Receiveable?
    //메시지를 발신합니다.
    func send(data: Any){
        guard let receiver: Receiveable = self.to else {
            print("Message has no Receiver")
            return
        }
        //수신 가능한 인스턴스의 received 메서드를 호출합니다.
        receiver.received(data: data, from: self.from)
    }
    //메시지를 수신합니다.
    func received(data: Any, from: Sendable) {
        print("Message received \(data) from \(from)")
    }
    //class 메서드 이므로 상속이 가능합니다.
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}
//수신, 발신이 가능한 Mail 클래스
class Mail: Sendable, Receiveable {
    var from: Sendable {
        return self
    }
    var to: Receiveable?
    
    func send(data: Any){
        guard let receiver: Receiveable = self.to else {
            print("Mail has no receiver")
            return
        }
        receiver.received(data: data, from: self.from)
    }
    func received(data: Any, from: Sendable) {
        print("Mail received \(data) from \(from)")
    }
    //static 메서드이므로 상속이 불가능하다. 그냥 안되는거다.
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}
//두 Message 인스턴스를 생성합니다.
let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()
//아직 수신받을 인스턴스가 없습니다.
myPhoneMessage.send(data: "Hello") //Message has no receiver
//Message 인스턴스는 발신과 수신이 모두 가능하므로 메시지를 주고 받을 수 있습니다.
myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")
//두 Mail 인스턴스를 생성합니다.
let myMail : Mail = Mail()
let yourMail : Mail = Mail()

myMail.send(data: "Hi")         //Message has no receiver
//Mail 과 Message 모두 Sendable 과 Receiveable 프로토콜을 준수하므로 서로 주고받을 수 있다.
myMail.to = yourMail
myMail.send(data: "HI")         //Mail received Hi from Mail

myMail.to = myPhoneMessage
myMail.send(data: "Bye")        //Message received Bye from Mail
//String은 Sendable 프로토콜을 준수하지 않습니다.
Message.isSendableInstance("Hello")     //false
//Mail 과 Message는 Sendable 프로토콜을 준수합니다.
Message.isSendableInstance(myPhoneMessage)
//yourPhoneMessage 는 to 프로퍼티가 설정되지 않아서 보낼 수 없는 상태입니다.
Message.isSendableInstance(yourPhoneMessage)
Mail.isSendableInstance(myPhoneMessage)
Mail.isSendableInstance(myMail)
//20-7
protocol Named {
    var name: String {get}
    init(name: String)
}
struct Pet : Named {
    var name : String
    init(name: String){
        self.name = name
    }
}

class Person : Named {
    var name: String
    required init(name: String){
        self.name = name
    }
}
//20-11
class School {
    var name : String
    init(name: String){
        self.name = name
    }
}
class MiddleSchool : School, Named {        //상속와 프로토콜의 채택이 동시에 이루어질 경우 상위클래스의 상속을 먼저 작성한다. 아니면 오류가 뱔섕햔댜.
    required override init(name: String) {
        super.init(name: name)
    }
}
