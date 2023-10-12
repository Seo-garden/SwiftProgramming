import Foundation

class Coffee {
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shots \(name)"
    }
    init(name: String, shot: Int){
        self.name = "coffee"
        self.shot = shot
    }
}
class Latte: Coffee {
    var flavor: String
    override var description: String {
        return "\(shot) shots \(flavor) latte"
    }
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(name: "coffee", shot: shot)
    }
}
class Americano: Coffee {
    let iced: Bool
    override var description: String {
        return "\(shot) shots \(iced ? "iced" : "hot") americano"
    }
    init(iced: Bool, shot: Int){
        self.iced = iced
        super.init(name: "coffee", shot: shot)
    }
}
