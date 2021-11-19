import SwiftSyntax

public class AccessLevelRewriter: SyntaxRewriter {
    public static func rewrite(source: String) throws -> String {
        let syntax = try SyntaxParser.parse(source: source)
        return AccessLevelRewriter().visit(syntax).description
    }

    override public func visit(_ node: ClassDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.hasPrivateOrFileprivateModifier {
            return DeclSyntax(node)

        } else {
            let newNode: ClassDeclSyntax

            if modifiers.hasPublicModifier {
                newNode = node

            } else {
                let newModifiers: ModifierListSyntax?

                if let internalModifier = modifiers.firstInternalModifier {
                    newModifiers = modifiers.replacing(
                        childAt: internalModifier.indexInParent,
                        with: SyntaxFactory.makePublicKeywordModifier()
                    )

                } else {
                    newModifiers = modifiers.appending(SyntaxFactory.makePublicKeywordModifier())
                }

                newNode = node
                    .withLeadingTrivia(.zero) // remove leading newlines
                    .withModifiers(newModifiers) // add public keyword
                    .withLeadingTrivia(node.leadingTrivia ?? .zero) // add leading newlines
            }

            return super.visit(newNode)
        }
    }
}
