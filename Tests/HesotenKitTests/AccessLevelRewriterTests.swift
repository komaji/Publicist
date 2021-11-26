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
}
