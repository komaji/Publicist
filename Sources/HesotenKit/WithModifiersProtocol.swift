import SwiftSyntax

protocol WithModifiersProtocol: SyntaxProtocol {
    var modifiers: ModifierListSyntax? { get }

    func withModifiers(_ newChild: ModifierListSyntax?) -> Self
}

extension WithModifiersProtocol {
    func withModifiersKeepingLeadingTrivia(_ newChild: ModifierListSyntax?) -> Self {
        self.withoutLeadingTrivia()
            .withModifiers(newChild)
            .withLeadingTrivia(leadingTrivia ?? .zero)
    }
}
