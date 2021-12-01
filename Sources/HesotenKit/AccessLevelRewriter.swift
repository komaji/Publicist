import SwiftSyntax

public class AccessLevelRewriter: SyntaxRewriter {
    public static func rewrite(source: String) throws -> String {
        let syntax = try SyntaxParser.parse(source: source)
        return AccessLevelRewriter().visit(syntax).description
    }

    override public func visit(_ node: ClassDeclSyntax) -> DeclSyntax {
        let newNode = node.changingAccessLevelIntoPublic()
        return node.shouldVisitChildren ? super.visit(newNode) : DeclSyntax(node)
    }

    override public func visit(_ node: StructDeclSyntax) -> DeclSyntax {
        let newNode = node.changingAccessLevelIntoPublic()
        return node.shouldVisitChildren ? super.visit(newNode) : DeclSyntax(node)
    }

    override public func visit(_ node: EnumDeclSyntax) -> DeclSyntax {
        let newNode = node.changingAccessLevelIntoPublic()
        return node.shouldVisitChildren ? super.visit(newNode) : DeclSyntax(node)
    }

    override public func visit(_ node: ProtocolDeclSyntax) -> DeclSyntax {
        let newNode = node.changingAccessLevelIntoPublic()
        return node.shouldVisitChildren ? super.visit(newNode) : DeclSyntax(node)
    }

    override public func visit(_ node: ExtensionDeclSyntax) -> DeclSyntax {
        let newNode = node.changingAccessLevelIntoPublic()
        return node.shouldVisitChildren ? super.visit(newNode) : DeclSyntax(node)
    }

    override public func visit(_ node: AssociatedtypeDeclSyntax) -> DeclSyntax {
        let newNode = node.changingAccessLevelIntoPublic()
        return DeclSyntax(newNode)
    }

    override public func visit(_ node: TypealiasDeclSyntax) -> DeclSyntax {
        let newNode = node.changingAccessLevelIntoPublic()
        return DeclSyntax(newNode)
    }

    override public func visit(_ node: VariableDeclSyntax) -> DeclSyntax {
        let newNode = node.changingAccessLevelIntoPublic()
        return DeclSyntax(newNode)
    }

    override public func visit(_ node: InitializerDeclSyntax) -> DeclSyntax {
        let newNode = node.changingAccessLevelIntoPublic()
        return DeclSyntax(newNode)
    }

    override public func visit(_ node: FunctionDeclSyntax) -> DeclSyntax {
        let newNode = node.changingAccessLevelIntoPublic()
        return DeclSyntax(newNode)
    }

    override public func visit(_ node: SubscriptDeclSyntax) -> DeclSyntax {
        let newNode = node.changingAccessLevelIntoPublic()
        return DeclSyntax(newNode)
    }
}
