import SwiftSyntax

protocol WithPrivateSetDetailProtocol: WithModifiersProtocol {}

extension WithPrivateSetDetailProtocol {
    func changingAccessLevelIntoPublic() -> Self {
        let modifiers = modifiers ?? SyntaxFactory.makeModifierList([])
        if modifiers.containsAny(of: \.isPublic, \.isFileprivate, \.isPrivateGetSet) {
            return self
        }

        let newModifiers: ModifierListSyntax?
        if let internalModifier = modifiers.first(of: \.isInternal) {
            newModifiers = modifiers.replacing(
                childAt: internalModifier.indexInParent,
                with: SyntaxFactory.makePublicKeywordModifier()
            )

        } else if let privateSetModifier = modifiers.first(of: \.isPrivateSet) {
            newModifiers = modifiers
                .withoutLeadingTrivia()
                .inserting(
                    SyntaxFactory.makePublicKeywordModifier(),
                    at: privateSetModifier.indexInParent
                )

        } else {
            newModifiers = modifiers
                .withoutLeadingTrivia()
                .prepending(SyntaxFactory.makePublicKeywordModifier())
        }

        return withModifiersKeepingLeadingTrivia(newModifiers)
    }
}

extension VariableDeclSyntax: WithPrivateSetDetailProtocol {}
