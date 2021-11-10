import Foundation

struct Food {
    typealias Buyer = String

    let name: String
    private let price: Int

    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }

    func printName() {
        print(name)
    }

    private func printPrice() {
        print(price)
    }
}
