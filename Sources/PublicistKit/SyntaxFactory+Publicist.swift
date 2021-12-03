import SwiftSyntax

extension SyntaxFactory {
    static func makePublicKeywordModifier() -> DeclModifierSyntax {
        SyntaxFactory.makeDeclModifier(
            name: makePublicKeyword(),
            detailLeftParen: nil,
            detail: nil,
            detailRightParen: nil
        )
        .withTrailingTrivia(.spaces(1))
    }
}
