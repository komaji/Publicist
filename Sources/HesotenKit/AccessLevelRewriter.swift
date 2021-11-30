import SwiftSyntax

public class AccessLevelRewriter: SyntaxRewriter {
    public static func rewrite(source: String) throws -> String {
        let syntax = try SyntaxParser.parse(source: source)
        return AccessLevelRewriter().visit(syntax).description
    }

    override public func visit(_ node: ClassDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.containsAny(of: \.isFileprivate, \.isPrivate) {
            return DeclSyntax(node)

        } else {
            let newNode: ClassDeclSyntax

            if modifiers.contains(where: \.isPublic) {
                newNode = node

            } else {
                let newModifiers: ModifierListSyntax?

                if let internalModifier = modifiers.first(of: \.isInternal) {
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

    override public func visit(_ node: StructDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.containsAny(of: \.isFileprivate, \.isPrivate) {
            return DeclSyntax(node)

        } else {
            let newNode: StructDeclSyntax

            if modifiers.contains(where: \.isPublic) {
                newNode = node

            } else {
                let newModifiers: ModifierListSyntax?

                if let internalModifier = modifiers.first(of: \.isInternal) {
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

    override public func visit(_ node: EnumDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.containsAny(of: \.isFileprivate, \.isPrivate) {
            return DeclSyntax(node)

        } else {
            let newNode: EnumDeclSyntax

            if modifiers.contains(where: \.isPublic) {
                newNode = node

            } else {
                let newModifiers: ModifierListSyntax?

                if let internalModifier = modifiers.first(of: \.isInternal) {
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

    override public func visit(_ node: ProtocolDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.containsAny(of: \.isFileprivate, \.isPrivate) {
            return DeclSyntax(node)

        } else {
            let newNode: ProtocolDeclSyntax

            if modifiers.contains(where: \.isPublic) {
                newNode = node

            } else {
                let newModifiers: ModifierListSyntax?

                if let internalModifier = modifiers.first(of: \.isInternal) {
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

    override public func visit(_ node: ExtensionDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.containsAny(of: \.isFileprivate, \.isPrivate) {
            return DeclSyntax(node)

        } else {
            let newNode: ExtensionDeclSyntax

            if modifiers.contains(where: \.isPublic) {
                newNode = node

            } else {
                let newModifiers: ModifierListSyntax?

                if let internalModifier = modifiers.first(of: \.isInternal) {
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

    override public func visit(_ node: AssociatedtypeDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.containsAny(of: \.isPublic, \.isFileprivate, \.isPrivate) {
            return DeclSyntax(node)

        } else {
            let newModifiers: ModifierListSyntax?

            if let internalModifier = modifiers.first(of: \.isInternal) {
                newModifiers = modifiers.replacing(
                    childAt: internalModifier.indexInParent,
                    with: SyntaxFactory.makePublicKeywordModifier()
                )

            } else {
                newModifiers = modifiers.appending(SyntaxFactory.makePublicKeywordModifier())
            }

            let newNode = node
                .withLeadingTrivia(.zero) // remove leading newlines
                .withModifiers(newModifiers) // add public keyword
                .withLeadingTrivia(node.leadingTrivia ?? .zero) // add leading newlines

            return DeclSyntax(newNode)
        }
    }

    override public func visit(_ node: TypealiasDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.containsAny(of: \.isPublic, \.isFileprivate, \.isPrivate) {
            return DeclSyntax(node)

        } else {
            let newModifiers: ModifierListSyntax?

            if let internalModifier = modifiers.first(of: \.isInternal) {
                newModifiers = modifiers.replacing(
                    childAt: internalModifier.indexInParent,
                    with: SyntaxFactory.makePublicKeywordModifier()
                )

            } else {
                newModifiers = modifiers.appending(SyntaxFactory.makePublicKeywordModifier())
            }

            let newNode = node
                .withLeadingTrivia(.zero) // remove leading newlines
                .withModifiers(newModifiers) // add public keyword
                .withLeadingTrivia(node.leadingTrivia ?? .zero) // add leading newlines

            return DeclSyntax(newNode)
        }
    }

    override public func visit(_ node: VariableDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.containsAny(of: \.isPublic, \.isFileprivate, \.isPrivateGetSet) {
            return DeclSyntax(node)

        } else {
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

            let newNode = node
                .withLeadingTrivia(.zero) // remove leading newlines
                .withModifiers(newModifiers) // add public keyword
                .withLeadingTrivia(node.leadingTrivia ?? .zero) // add leading newlines

            return DeclSyntax(newNode)
        }
    }

    override public func visit(_ node: InitializerDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.containsAny(of: \.isPublic, \.isFileprivate, \.isPrivate) {
            return DeclSyntax(node)

        } else {
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

            let newNode = node
                .withLeadingTrivia(.zero) // remove leading newlines
                .withModifiers(newModifiers) // add public keyword
                .withLeadingTrivia(node.leadingTrivia ?? .zero) // add leading newlines

            return DeclSyntax(newNode)
        }
    }

    override public func visit(_ node: FunctionDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.containsAny(of: \.isPublic, \.isFileprivate, \.isPrivate) {
            return DeclSyntax(node)

        } else {
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

            let newNode = node
                .withLeadingTrivia(.zero) // remove leading newlines
                .withModifiers(newModifiers) // add public keyword
                .withLeadingTrivia(node.leadingTrivia ?? .zero) // add leading newlines

            return DeclSyntax(newNode)
        }
    }

    override public func visit(_ node: SubscriptDeclSyntax) -> DeclSyntax {
        let modifiers = node.modifiers ?? SyntaxFactory.makeModifierList([])

        if modifiers.containsAny(of: \.isPublic, \.isFileprivate, \.isPrivate) {
            return DeclSyntax(node)

        } else {
            let newModifiers: ModifierListSyntax?

            if let internalModifier = modifiers.first(of: \.isInternal) {
                newModifiers = modifiers.replacing(
                    childAt: internalModifier.indexInParent,
                    with: SyntaxFactory.makePublicKeywordModifier()
                )

            } else {
                newModifiers = modifiers.appending(SyntaxFactory.makePublicKeywordModifier())
            }

            let newNode = node
                .withLeadingTrivia(.zero) // remove leading newlines
                .withModifiers(newModifiers) // add public keyword
                .withLeadingTrivia(node.leadingTrivia ?? .zero) // add leading newlines

            return DeclSyntax(newNode)
        }
    }
}
