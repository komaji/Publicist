import SwiftSyntax

extension ModifierListSyntax {
    var firstInternalModifier: DeclModifierSyntax? {
        first { $0.isInternal }
    }

    var firstPrivateSetModifier: DeclModifierSyntax? {
        first { $0.isPrivateSet }
    }

    var hasPublicModifier: Bool {
        contains { $0.isPublic }
    }

    var hasPrivateOrFileprivateModifier: Bool {
        contains { $0.isPrivate || $0.isFileprivate  }
    }

    var hasPrivateGetSetModifier: Bool {
        contains { $0.isPrivateGetSet }
    }

    var hasPrivateModifier: Bool {
        contains { $0.isPrivate }
    }

    var hasFileprivateModifier: Bool {
        contains { $0.isFileprivate }
    }
}
