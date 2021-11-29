import XCTest
import HesotenKit

final class AccessLevelRewriterTests: XCTestCase {
    func testClass() throws {
        let source = """
        class Shop {}

        @available(swift 5.5) class Shop {}

        final class Shop {}

        @available(swift 5.5) final class Shop {}

        internal class Shop {}

        final internal class Shop {}

        @available(swift 5.5) internal class Shop {}

        @available(swift 5.5) final internal class Shop {}

        class Shop {
            class Food {}
        }

        fileprivate class Shop {
            class Food {}
        }

        private class Shop {
            class Food {}
        }

        public class shop {}

        fileprivate class shop {}

        private class Shop {}
        """

        let expected = """
        public class Shop {}

        @available(swift 5.5) public class Shop {}

        final public class Shop {}

        @available(swift 5.5) final public class Shop {}

        public class Shop {}

        final public class Shop {}

        @available(swift 5.5) public class Shop {}

        @available(swift 5.5) final public class Shop {}

        public class Shop {
            public class Food {}
        }

        fileprivate class Shop {
            class Food {}
        }

        private class Shop {
            class Food {}
        }

        public class shop {}

        fileprivate class shop {}

        private class Shop {}
        """

        let tested = try AccessLevelRewriter.rewrite(source: source)

        XCTAssertEqual(tested, expected)
    }

    func testStruct() throws {
        let source = """
        struct Shop {}

        @available(swift 5.5) struct Shop {}

        internal struct Shop {}

        @available(swift 5.5) internal struct Shop {}

        struct Shop {
            struct Food {}
        }

        fileprivate struct Shop {
            struct Food {}
        }

        private struct Shop {
            struct Food {}
        }

        public struct shop {}

        fileprivate struct shop {}

        private struct Shop {}
        """

        let expected = """
        public struct Shop {}

        @available(swift 5.5) public struct Shop {}

        public struct Shop {}

        @available(swift 5.5) public struct Shop {}

        public struct Shop {
            public struct Food {}
        }

        fileprivate struct Shop {
            struct Food {}
        }

        private struct Shop {
            struct Food {}
        }

        public struct shop {}

        fileprivate struct shop {}

        private struct Shop {}
        """

        let tested = try AccessLevelRewriter.rewrite(source: source)

        XCTAssertEqual(tested, expected)
    }

    func testEnum() throws {
        let source = """
        enum Shop {}

        @available(swift 5.5) enum Shop {}

        internal enum Shop {}

        @available(swift 5.5) internal enum Shop {}

        enum Shop {
            enum Food {}
        }

        fileprivate enum Shop {
            enum Food {}
        }

        private enum Shop {
            enum Food {}
        }

        public enum shop {}

        fileprivate enum shop {}

        private enum Shop {}
        """

        let expected = """
        public enum Shop {}

        @available(swift 5.5) public enum Shop {}

        public enum Shop {}

        @available(swift 5.5) public enum Shop {}

        public enum Shop {
            public enum Food {}
        }

        fileprivate enum Shop {
            enum Food {}
        }

        private enum Shop {
            enum Food {}
        }

        public enum shop {}

        fileprivate enum shop {}

        private enum Shop {}
        """

        let tested = try AccessLevelRewriter.rewrite(source: source)

        XCTAssertEqual(tested, expected)
    }

    func testProtocol() throws {
        let source = """
        protocol Shop {}

        @available(swift 5.5) protocol Shop {}

        internal protocol Shop {}

        @available(swift 5.5) internal protocol Shop {}

        enum Shop {
            protocol Food {}
        }

        fileprivate enum Shop {
            protocol Food {}
        }

        private enum Shop {
            protocol Food {}
        }

        public protocol shop {}

        fileprivate protocol shop {}

        private protocol Shop {}
        """

        let expected = """
        public protocol Shop {}

        @available(swift 5.5) public protocol Shop {}

        public protocol Shop {}

        @available(swift 5.5) public protocol Shop {}

        public enum Shop {
            public protocol Food {}
        }

        fileprivate enum Shop {
            protocol Food {}
        }

        private enum Shop {
            protocol Food {}
        }

        public protocol shop {}

        fileprivate protocol shop {}

        private protocol Shop {}
        """

        let tested = try AccessLevelRewriter.rewrite(source: source)

        XCTAssertEqual(tested, expected)
    }

    func testExtension() throws {
        let source = """
        extension Shop {}

        @available(swift 5.5) extension Shop {}

        internal extension Shop {}

        @available(swift 5.5) internal extension Shop {}

        public extension shop {}

        fileprivate extension shop {}

        private extension Shop {}
        """

        let expected = """
        public extension Shop {}

        @available(swift 5.5) public extension Shop {}

        public extension Shop {}

        @available(swift 5.5) public extension Shop {}

        public extension shop {}

        fileprivate extension shop {}

        private extension Shop {}
        """

        let tested = try AccessLevelRewriter.rewrite(source: source)

        XCTAssertEqual(tested, expected)
    }

    func testAssociatedtype() throws {
        let source = """
        protocol Shop {
            associatedtype Food

            @available(swift 5.5) associatedtype Food

            internal associatedtype Food

            @available(swift 5.5) internal associatedtype Food

            public associatedtype Food

            fileprivate associatedtype Food

            private associatedtype Food
        }

        fileprivate protocol Shop {
            associatedtype Food
        }

        private protocol Shop {
            associatedtype Food
        }
        """

        let expected = """
        public protocol Shop {
            public associatedtype Food

            @available(swift 5.5) public associatedtype Food

            public associatedtype Food

            @available(swift 5.5) public associatedtype Food

            public associatedtype Food

            fileprivate associatedtype Food

            private associatedtype Food
        }

        fileprivate protocol Shop {
            associatedtype Food
        }

        private protocol Shop {
            associatedtype Food
        }
        """

        let tested = try AccessLevelRewriter.rewrite(source: source)

        XCTAssertEqual(tested, expected)
    }

    func testTypealias() throws {
        let source = """
        typealias Shop = Void

        @available(swift 5.5) typealias Shop = Void

        internal typealias Shop = Void

        @available(swift 5.5) internal typealias Shop = Void

        enum Shop {
            typealias Food = Void
        }

        fileprivate enum Shop {
            typealias Food = Void
        }

        private enum Shop {
            typealias Food = Void
        }

        public typealias shop = Void

        fileprivate typealias shop = Void

        private typealias Shop = Void
        """

        let expected = """
        public typealias Shop = Void

        @available(swift 5.5) public typealias Shop = Void

        public typealias Shop = Void

        @available(swift 5.5) public typealias Shop = Void

        public enum Shop {
            public typealias Food = Void
        }

        fileprivate enum Shop {
            typealias Food = Void
        }

        private enum Shop {
            typealias Food = Void
        }

        public typealias shop = Void

        fileprivate typealias shop = Void

        private typealias Shop = Void
        """

        let tested = try AccessLevelRewriter.rewrite(source: source)

        XCTAssertEqual(tested, expected)
    }

    func testVariable() throws {
        let source = """
        struct Shop {
            var name: String

            @available(swift 5.5) var name: String

            static var name: String

            @available(swift 5.5) static var name: String

            internal var name: String

            @available(swift 5.5) internal var name: String

            internal static var name: String

            @available(swift 5.5) internal static var name: String

            private(set) var name: String

            @available(swift 5.5) private(set) var name: String

            @available(swift 5.5) private(set) static var name: String

            internal private(set) var name: String

            @available(swift 5.5) internal private(set) var name: String

            @available(swift 5.5) internal private(set) static var name: String

            public var name: String

            fileprivate var name: String

            private var name: String

            public private(set) var name: String
        }

        public struct Shop {
            var name: String
        }

        fileprivate struct Shop {
            var name: String
        }

        private struct Shop {
            var name: String
        }
        """

        let expected = """
        public struct Shop {
            public var name: String

            @available(swift 5.5) public var name: String

            public static var name: String

            @available(swift 5.5) public static var name: String

            public var name: String

            @available(swift 5.5) public var name: String

            public static var name: String

            @available(swift 5.5) public static var name: String

            public private(set) var name: String

            @available(swift 5.5) public private(set) var name: String

            @available(swift 5.5) public private(set) static var name: String

            public private(set) var name: String

            @available(swift 5.5) public private(set) var name: String

            @available(swift 5.5) public private(set) static var name: String

            public var name: String

            fileprivate var name: String

            private var name: String

            public private(set) var name: String
        }

        public struct Shop {
            public var name: String
        }

        fileprivate struct Shop {
            var name: String
        }

        private struct Shop {
            var name: String
        }
        """

        let tested = try AccessLevelRewriter.rewrite(source: source)

        XCTAssertEqual(tested, expected)
    }

    func testInitializer() throws {
        let source = """
        struct Shop {
            init() {}

            @available(swift 5.5) init() {}

            convenience init() {}

            @available(swift 5.5) convenience init() {}

            internal init() {}

            @available(swift 5.5) internal init() {}

            internal convenience init() {}

            @available(swift 5.5) internal convenience init() {}

            public init() {}

            fileprivate init() {}

            private init() {}
        }

        public struct Shop {
            init() {}
        }

        fileprivate struct Shop {
            init() {}
        }

        private struct Shop {
            init() {}
        }
        """

        let expected = """
        public struct Shop {
            public init() {}

            @available(swift 5.5) public init() {}

            public convenience init() {}

            @available(swift 5.5) public convenience init() {}

            public init() {}

            @available(swift 5.5) public init() {}

            public convenience init() {}

            @available(swift 5.5) public convenience init() {}

            public init() {}

            fileprivate init() {}

            private init() {}
        }

        public struct Shop {
            public init() {}
        }

        fileprivate struct Shop {
            init() {}
        }

        private struct Shop {
            init() {}
        }
        """

        let tested = try AccessLevelRewriter.rewrite(source: source)

        XCTAssertEqual(tested, expected)
    }

    func testFunction() throws {
        let source = """
        struct Shop {
            func serve() {}

            @available(swift 5.5) func serve() {}

            static func serve() {}

            @available(swift 5.5) static func serve() {}

            internal func serve() {}

            @available(swift 5.5) internal func serve() {}

            internal static func serve() {}

            @available(swift 5.5) internal static func serve() {}

            public func serve() {}

            fileprivate func serve() {}

            private func serve() {}
        }

        public struct Shop {
            func serve() {}
        }

        fileprivate struct Shop {
            func serve() {}
        }

        private struct Shop {
            func serve() {}
        }
        """

        let expected = """
        public struct Shop {
            public func serve() {}

            @available(swift 5.5) public func serve() {}

            public static func serve() {}

            @available(swift 5.5) public static func serve() {}

            public func serve() {}

            @available(swift 5.5) public func serve() {}

            public static func serve() {}

            @available(swift 5.5) public static func serve() {}

            public func serve() {}

            fileprivate func serve() {}

            private func serve() {}
        }

        public struct Shop {
            public func serve() {}
        }

        fileprivate struct Shop {
            func serve() {}
        }

        private struct Shop {
            func serve() {}
        }
        """

        let tested = try AccessLevelRewriter.rewrite(source: source)

        XCTAssertEqual(tested, expected)
    }

    func testSubscript() throws {
        let source = """
        struct Shop {
            subscript(index: Int) -> Int { 0 }

            @available(swift 5.5) subscript(index: Int) -> Int { 0 }

            internal subscript(index: Int) -> Int { 0 }

            @available(swift 5.5) internal subscript(index: Int) -> Int { 0 }

            public subscript(index: Int) -> Int { 0 }

            fileprivate subscript(index: Int) -> Int { 0 }

            private subscript(index: Int) -> Int { 0 }
        }

        public struct Shop {
            subscript(index: Int) -> Int { 0 }
        }

        fileprivate struct Shop {
            subscript(index: Int) -> Int { 0 }
        }

        private struct Shop {
            subscript(index: Int) -> Int { 0 }
        }
        """

        let expected = """
        public struct Shop {
            public subscript(index: Int) -> Int { 0 }

            @available(swift 5.5) public subscript(index: Int) -> Int { 0 }

            public subscript(index: Int) -> Int { 0 }

            @available(swift 5.5) public subscript(index: Int) -> Int { 0 }

            public subscript(index: Int) -> Int { 0 }

            fileprivate subscript(index: Int) -> Int { 0 }

            private subscript(index: Int) -> Int { 0 }
        }

        public struct Shop {
            public subscript(index: Int) -> Int { 0 }
        }

        fileprivate struct Shop {
            subscript(index: Int) -> Int { 0 }
        }

        private struct Shop {
            subscript(index: Int) -> Int { 0 }
        }
        """

        let tested = try AccessLevelRewriter.rewrite(source: source)

        XCTAssertEqual(tested, expected)
    }
}
