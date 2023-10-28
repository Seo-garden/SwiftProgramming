import UIKit

//class Person {
//    let name : String
//    init(name: String) {
//        self.name = name
//    }
//    deinit{
//        print("\(name) is being deinitialized")
//    }
//}
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "yagom")      //참조 1
//reference2 = reference1                 //참조 2
//reference3 = reference1                 //참조 3
//
//reference1 = nil                        //참조 횟수 2
//reference2 = nil                        //참조 횟수 1
//reference3 = nil                        //참조 횟수 0 -> 디이니셜라이저 호출
//27-3
//var globalReference : Person?
//
//func foo() {
//    let yagom : Person = Person(name: "Yagom")      //참조 1
//    
//    globalReference = yagom                         //참조 2
//    
//}                                                   //함수가 종료되면서 참조 -1 되서 1 이지만 참조횟수가 남아있기 때문에 메모리에서 해제되지 않는다.
//foo()
//27-7
class Person {
    let name : String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    
    deinit{
        print("\(name) is deinitialized")
    }
}
class CreditCard {
    let number : UInt
    unowned let owner : Person
    
    init(number: UInt, owner: Person) {
        self.number = number
        self.owner = owner
    }
    deinit{
        print("Card #\(number) is being deinitialized")
    }
}

var jisoo : Person? = Person( name: "jisoo")

if let person: Person = jisoo {
    person.card = CreditCard(number: 1004, owner: person)
}
jisoo = nil
//27-8
class Department {
    var name: String
    var subjects : [Subject] = []
    init(name: String) {
        self.name = name
    }
}
class Subject {
    var name : String
    unowned var department : Department
    unowned var nextSubject : Subject?
    
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextSubject = nil
    }
}
let department = Department(name : "Computer Science")

let intro = Subject(name: "Computer Architecture", in: department)
let intermediate = Subject(name: "Swift Language", in: department)
let advanced = Subject(name: "iOS App Programming", in: department)

intro.nextSubject = intermediate
intermediate.nextSubject = advanced
department.subjects = [intro, intermediate, advanced]
//27-9
class Company {
    let name : String
    //암시적 추출 옵셔널 프로퍼티
    var ceo : CEO!
    
    init(name: String, ceoName: String) {
        self.name = name
        self.ceo = CEO(name: ceoName, company: self)
    }
    func introduce(){
        print("\(name)의 CEO는 \(ceo.name) 이다.")
    }
}
class CEO {
    let name : String
    unowned let company : Company
    
    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }
    func introduce(){
        print("\(name) 는 \(company.name) 의 CEO 입니다.")
    }
}
let company : Company = Company(name : "무한상사", ceoName: "김태호")
company.introduce()
company.ceo.introduce()
