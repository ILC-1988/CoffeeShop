import Foundation

typealias Ruble = Int

class CoffeeShop {
    
    static let shared = CoffeeShop()

    var day: Int
    var customersCounter: Int
    var totalRevenue: Int
    var revenue: Ruble

    private init() {
        day = 0
        customersCounter = 0
        revenue = 0
        totalRevenue = 0
    }

    func buyCoffee(price: Ruble) {
        revenue += price
        customersCounter += 1
        totalRevenue += price
    }

    func startNewDay() {
        day += 1
        customersCounter = 0
        revenue = 0
        print(totalRevenue)
    }
}
