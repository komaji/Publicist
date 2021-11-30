import SwiftSyntax

extension ModifierListSyntax {
    func first(of keyPath: KeyPath<DeclModifierSyntax, Bool>) -> DeclModifierSyntax? {
        first { $0[keyPath: keyPath] }
    }

    func containsAny(of keyPaths: KeyPath<DeclModifierSyntax, Bool>...) -> Bool {
        contains { modifier in
            for keyPath in keyPaths {
                if modifier[keyPath: keyPath] { return true }
            }

            return false
        }
    }
}
