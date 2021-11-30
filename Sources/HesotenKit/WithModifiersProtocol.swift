import SwiftSyntax

protocol WithModifiersProtocol {
    func withModifiers(_ newChild: ModifierListSyntax?) -> Self
}
extension WithModifiersProtocol where Self: SyntaxProtocol {
    func withModifiersKeepingLeadingTrivia(_ newChild: ModifierListSyntax?) -> Self {
        self.withoutLeadingTrivia() // remove leading newlines
            .withModifiers(newChild) // add public keyword
            .withLeadingTrivia(leadingTrivia ?? .zero) // add leading newlines
    }
}

extension ClassDeclSyntax: WithModifiersProtocol {}
extension StructDeclSyntax: WithModifiersProtocol {}
extension EnumDeclSyntax: WithModifiersProtocol {}
extension ExtensionDeclSyntax: WithModifiersProtocol {}
extension ProtocolDeclSyntax: WithModifiersProtocol {}
extension AssociatedtypeDeclSyntax: WithModifiersProtocol {}
extension TypealiasDeclSyntax: WithModifiersProtocol {}
extension VariableDeclSyntax: WithModifiersProtocol {}
extension InitializerDeclSyntax: WithModifiersProtocol {}
extension FunctionDeclSyntax: WithModifiersProtocol {}
extension SubscriptDeclSyntax: WithModifiersProtocol {}
