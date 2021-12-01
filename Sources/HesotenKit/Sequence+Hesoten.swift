import SwiftSyntax

extension Sequence {
    func first(of keyPath: KeyPath<Element, Bool>) -> Element? {
        first { $0[keyPath: keyPath] }
    }

    func containsAny(of keyPaths: KeyPath<Element, Bool>...) -> Bool {
        contains { element in
            for keyPath in keyPaths {
                if element[keyPath: keyPath] { return true }
            }

            return false
        }
    }
}
