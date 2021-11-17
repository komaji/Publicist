import SwiftSyntax

extension TokenKind {
    var isAccessLevel: Bool {
        switch self {
        case .publicKeyword,
             .internalKeyword,
             .fileprivateKeyword,
             .privateKeyword:
            return true
        default:
            return false
        }
    }
}
