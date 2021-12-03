import SwiftSyntax

extension DeclModifierSyntax {
    var isPublic: Bool {
        name.tokenKind == .publicKeyword
    }

    var isInternal: Bool {
        name.tokenKind == .internalKeyword
    }

    var isFileprivate: Bool {
        name.tokenKind == .fileprivateKeyword
    }

    var isPrivateSet: Bool {
        isPrivate && hasSetDetail
    }

    var isPrivateGetSet: Bool {
        isPrivate && !hasSetDetail
    }

    var isPrivate: Bool {
        name.tokenKind == .privateKeyword
    }

    var hasSetDetail: Bool {
        detailLeftParen?.tokenKind == .leftParen
            && detail?.tokenKind == .identifier("set")
            && detailRightParen?.tokenKind == .rightParen
    }
}
