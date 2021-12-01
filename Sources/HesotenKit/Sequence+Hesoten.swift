extension Sequence {
    func first(of keyPath: KeyPath<Element, Bool>) -> Element? {
        first { $0[keyPath: keyPath] }
    }

    func containsAny(of keyPaths: KeyPath<Element, Bool>...) -> Bool {
        contains { element in
            keyPaths.contains { element[keyPath: $0] }
        }
    }
}
