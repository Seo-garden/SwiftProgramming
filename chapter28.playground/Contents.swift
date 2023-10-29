import UIKit
import Foundation

struct Item {
    var price : Int
    var count : Int
}

class VendingMachine : Error {
    var inventory = [
        "Candy Bar" : Item(price: 12, count: 7),
        "Chips" : Item(price: 10, count: 4),
        "Biscuit" : Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func dispense(snack : String){
        print("\(snack) 제공")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = self.inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= self.coinsDeposited else {
            throw VendingMachineError.insufficientFunds(
                coinNeeded : item.price - self.coinsDeposited)
        }
        
        self.coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        self.inventory[name] = newItem
        
        self.dispense(snack: name)
    }
}
let favoriteSnacks = [
    "yagom" : "Chips",
    "jinsung" : "Biscuit",
    "heejin" : "Chocolate"
]

func buyFavoriteaSnack(person: String, vendingMachine: VendingMachine) {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    tryingVend(itemNamed: snackName, vendingMachine: vendingMachine)
}
struct PurchasedSnack {
    let name : String
    init(name : String, vendMachine: VendingMachine) throws {
        try vendMachine.vend(itemNamed: name)
        self.name = name
    }
}
let machine : VendingMachine = VendingMachine()

machine.coinsDeposited = 30

var purchase : PurchasedSnack = try PurchasedSnack(name: "Biscuit", vendMachine: machine)

print(purchase.name)

for(person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnack)
    try buyFavoriteSnack(person: person, vendingMachine: machine)
}
func tryingVend(itemNamed: String, vendingMachine : VendingMachine) {
    do {
        try vendingMachine.vend(itemNamed: itemNamed)
    } catch VendingMachineError.invalidSelection {
        print("유효하지 않은 선택")
    } catch VendingMachineError.outOfStock {
        print("품절")
    } catch VendingMachineError.insufficientFunds {
        print("자금 부족 - 동전 \(coinsNeeded)개를 추가로 지급해야주세요")
    } catch {
        print("그 외의 오류 발생 : ", error)
    }
}
let machine : VendingMachine = VendingMachine()
machine.coinsDeposited = 20

var purchase : PurchasedSnack = PurchasedSnack(name : "Biscuit", vendMachine: machine)

//28-6

