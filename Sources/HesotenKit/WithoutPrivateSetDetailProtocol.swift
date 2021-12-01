import SwiftSyntax

protocol WithoutPrivateSetDetailProtocol: WithModifiersProtocol {}
extension WithoutPrivateSetDetailProtocol {
    func changingAccessLevelIntoPublic() -> Self {
        let modifiers = modifiers ?? SyntaxFactory.makeModifierList([])
        if modifiers.containsAny(of: \.isPublic, \.isFileprivate, \.isPrivate) {
            return self
        }

        let newModifiersWithoutLeadingTrivia: ModifierListSyntax?
        if let internalModifier = modifiers.first(of: \.isInternal) {
            newModifiersWithoutLeadingTrivia = modifiers.replacing(
                childAt: internalModifier.indexInParent,
                with: SyntaxFactory.makePublicKeywordModifier()
            )

        } else {
            newModifiersWithoutLeadingTrivia = modifiers
                .withoutLeadingTrivia()
                .prepending(SyntaxFactory.makePublicKeywordModifier())
        }

        return withModifiersKeepingLeadingTrivia(newModifiersWithoutLeadingTrivia)
    }
}

extension ClassDeclSyntax: WithoutPrivateSetDetailProtocol {}
extension StructDeclSyntax: WithoutPrivateSetDetailProtocol {}
extension EnumDeclSyntax: WithoutPrivateSetDetailProtocol {}
extension ExtensionDeclSyntax: WithoutPrivateSetDetailProtocol {}
extension ProtocolDeclSyntax: WithoutPrivateSetDetailProtocol {}
extension AssociatedtypeDeclSyntax: WithoutPrivateSetDetailProtocol {}
extension TypealiasDeclSyntax: WithoutPrivateSetDetailProtocol {}
extension InitializerDeclSyntax: WithoutPrivateSetDetailProtocol {}
extension FunctionDeclSyntax: WithoutPrivateSetDetailProtocol {}
extension SubscriptDeclSyntax: WithoutPrivateSetDetailProtocol {}
