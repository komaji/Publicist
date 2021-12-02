import SwiftSyntax

protocol VisitChildrenProtocol: WithModifiersProtocol & SyntaxProtocol {}
extension VisitChildrenProtocol {
    var shouldVisitChildren: Bool {
        let modifiers = modifiers ?? SyntaxFactory.makeModifierList([])
        return !modifiers.containsAny(of: \.isFileprivate, \.isPrivate)
    }
}

extension ClassDeclSyntax: VisitChildrenProtocol {}
extension StructDeclSyntax: VisitChildrenProtocol {}
extension EnumDeclSyntax: VisitChildrenProtocol {}
extension ExtensionDeclSyntax: VisitChildrenProtocol {}
extension ProtocolDeclSyntax: VisitChildrenProtocol {}
