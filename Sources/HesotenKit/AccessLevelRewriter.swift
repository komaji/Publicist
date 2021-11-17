import SwiftSyntax

public class AccessLevelRewriter: SyntaxRewriter {
    public static func rewrite(source: String) throws -> String {
        let syntax = try SyntaxParser.parse(source: source)
        return AccessLevelRewriter().visit(syntax).description
    }

    override public func visit(_ node: ClassDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])
        let newModifiers: ModifierListSyntax?

        if !modifiers.hasAccessLevelModifier {
            newModifiers = modifiers.appending(SyntaxFactory.makePublicKeywordModifier())

        } else if let internalModifier = modifiers.firstInternalModifier {
            newModifiers = modifiers.replacing(
                childAt: internalModifier.indexInParent,
                with: SyntaxFactory.makePublicKeywordModifier()
            )

        } else {
            newModifiers = nil
        }

        let newNode: ClassDeclSyntax? = newModifiers.flatMap {
            node
                .withLeadingTrivia(.zero) // remove leading newlines
                .withModifiers($0) // add public keyword
                .withLeadingTrivia(node.leadingTrivia ?? .zero) // add leading newlines
        }

        return super.visit(newNode ?? node)
    }
}
