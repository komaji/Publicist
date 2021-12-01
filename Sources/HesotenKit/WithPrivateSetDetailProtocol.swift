import SwiftSyntax

protocol WithPrivateSetDetailProtocol: WithModifiersProtocol {}
extension WithPrivateSetDetailProtocol {
    func changingAccessLevelIntoPublic() -> Self {
        let modifiers = modifiers ?? SyntaxFactory.makeModifierList([])
        if modifiers.containsAny(of: \.isPublic, \.isFileprivate, \.isPrivateGetSet) {
            return self
        }

        let newModifiersWithoutLeadingTrivia: ModifierListSyntax?
        if let internalModifier = modifiers.first(of: \.isInternal) {
            newModifiersWithoutLeadingTrivia = modifiers.replacing(
                childAt: internalModifier.indexInParent,
                with: SyntaxFactory.makePublicKeywordModifier()
            )

        } else if let privateSetModifier = modifiers.first(of: \.isPrivateSet) {
            newModifiersWithoutLeadingTrivia = modifiers
                .withoutLeadingTrivia()
                .inserting(
                    SyntaxFactory.makePublicKeywordModifier(),
                    at: privateSetModifier.indexInParent
                )

        } else {
            newModifiersWithoutLeadingTrivia = modifiers
                .withoutLeadingTrivia()
                .prepending(SyntaxFactory.makePublicKeywordModifier())
        }

        return withModifiersKeepingLeadingTrivia(newModifiersWithoutLeadingTrivia)
    }
}

extension VariableDeclSyntax: WithPrivateSetDetailProtocol {}
