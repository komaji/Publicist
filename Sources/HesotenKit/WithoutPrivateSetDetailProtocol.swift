import SwiftSyntax

protocol WithoutPrivateSetDetailProtocol: WithModifiersProtocol {}

extension WithoutPrivateSetDetailProtocol {
    func changingAccessLevelIntoPublic() -> Self {
        let modifiers = modifiers ?? SyntaxFactory.makeModifierList([])
        if modifiers.containsAny(of: \.isPublic, \.isFileprivate, \.isPrivate) {
            return self
        }

        let newModifiers: ModifierListSyntax?
        if let internalModifier = modifiers.first(of: \.isInternal) {
            newModifiers = modifiers.replacing(
                childAt: internalModifier.indexInParent,
                with: SyntaxFactory.makePublicKeywordModifier()
            )

        } else {
            newModifiers = modifiers
                .withoutLeadingTrivia()
                .prepending(SyntaxFactory.makePublicKeywordModifier())
        }

        return withModifiersKeepingLeadingTrivia(newModifiers)
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
