import SwiftSyntax

protocol WithModifiersProtocol: SyntaxProtocol {
    var modifiers: ModifierListSyntax? { get }
    var declKeyword: TokenSyntax { get }

    func withModifiers(_ newChild: ModifierListSyntax?) -> Self
    func withDeclKeyword(_ newChild: TokenSyntax?) -> Self
}
extension WithModifiersProtocol {
    func withModifiersKeepingLeadingTrivia(_ newChild: ModifierListSyntax?) -> Self {
        withModifiers(
            newChild?.withLeadingTrivia(
                modifiers?.leadingTrivia
                    ?? declKeyword.leadingTrivia
                    ?? .zero
            )
        )
        .withDeclKeyword(
            declKeyword.withoutLeadingTrivia()
        )
    }
}

extension ClassDeclSyntax: WithModifiersProtocol {
    var declKeyword: TokenSyntax { classKeyword }
    func withDeclKeyword(_ newChild: TokenSyntax?) -> ClassDeclSyntax {
        withClassKeyword(newChild)
    }
}
extension StructDeclSyntax: WithModifiersProtocol {
    var declKeyword: TokenSyntax { structKeyword }
    func withDeclKeyword(_ newChild: TokenSyntax?) -> StructDeclSyntax {
        withStructKeyword(newChild)
    }
}
extension EnumDeclSyntax: WithModifiersProtocol {
    var declKeyword: TokenSyntax { enumKeyword }
    func withDeclKeyword(_ newChild: TokenSyntax?) -> EnumDeclSyntax {
        withEnumKeyword(newChild)
    }
}
extension ExtensionDeclSyntax: WithModifiersProtocol {
    var declKeyword: TokenSyntax { extensionKeyword }
    func withDeclKeyword(_ newChild: TokenSyntax?) -> ExtensionDeclSyntax {
        withExtensionKeyword(newChild)
    }
}
extension ProtocolDeclSyntax: WithModifiersProtocol {
    var declKeyword: TokenSyntax { protocolKeyword }
    func withDeclKeyword(_ newChild: TokenSyntax?) -> ProtocolDeclSyntax {
        withProtocolKeyword(newChild)
    }
}
extension AssociatedtypeDeclSyntax: WithModifiersProtocol {
    var declKeyword: TokenSyntax { associatedtypeKeyword }
    func withDeclKeyword(_ newChild: TokenSyntax?) -> AssociatedtypeDeclSyntax {
        withAssociatedtypeKeyword(newChild)
    }
}
extension TypealiasDeclSyntax: WithModifiersProtocol {
    var declKeyword: TokenSyntax { typealiasKeyword }
    func withDeclKeyword(_ newChild: TokenSyntax?) -> TypealiasDeclSyntax {
        withTypealiasKeyword(newChild)
    }
}
extension VariableDeclSyntax: WithModifiersProtocol {
    var declKeyword: TokenSyntax { letOrVarKeyword }
    func withDeclKeyword(_ newChild: TokenSyntax?) -> VariableDeclSyntax {
        withLetOrVarKeyword(newChild)
    }
}
extension InitializerDeclSyntax: WithModifiersProtocol {
    var declKeyword: TokenSyntax { initKeyword }
    func withDeclKeyword(_ newChild: TokenSyntax?) -> InitializerDeclSyntax {
        withInitKeyword(newChild)
    }
}
extension FunctionDeclSyntax: WithModifiersProtocol {
    var declKeyword: TokenSyntax { funcKeyword }
    func withDeclKeyword(_ newChild: TokenSyntax?) -> FunctionDeclSyntax {
        withFuncKeyword(newChild)
    }
}
extension SubscriptDeclSyntax: WithModifiersProtocol {
    var declKeyword: TokenSyntax { subscriptKeyword }
    func withDeclKeyword(_ newChild: TokenSyntax?) -> SubscriptDeclSyntax {
        withSubscriptKeyword(newChild)
    }
}
