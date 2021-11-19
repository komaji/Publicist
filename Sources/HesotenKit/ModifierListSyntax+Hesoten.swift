import SwiftSyntax

extension ModifierListSyntax {
    var firstInternalModifier: DeclModifierSyntax? {
        first { $0.name.tokenKind == .internalKeyword }
    }

    var hasPublicModifier: Bool {
        contains { $0.name.tokenKind == .publicKeyword }
    }

    var hasPrivateOrFileprivateModifier: Bool {
        contains {
            switch $0.name.tokenKind {
            case .privateKeyword,
                 .fileprivateKeyword:
                return true
            default:
                return false
            }
        }
    }
}
