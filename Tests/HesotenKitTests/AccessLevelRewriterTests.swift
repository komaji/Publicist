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
}
