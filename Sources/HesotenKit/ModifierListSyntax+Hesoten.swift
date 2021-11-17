import SwiftSyntax

extension ModifierListSyntax {
    var firstInternalModifier: DeclModifierSyntax? {
        first { $0.name.tokenKind == .internalKeyword }
    }

    var hasAccessLevelModifier: Bool {
        contains { $0.name.tokenKind.isAccessLevel }
    }
}
