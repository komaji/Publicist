import XCTest
import HesotenKit

final class AccessLevelRewriterTests: XCTestCase {
    func testClass() throws {
        let source = """
        class Shop {}

        @objc class Shop {}

        final class Shop {}

        @objc final class Shop {}

        internal class Shop {}

        final internal class Shop {}

        @objc internal class Shop {}

        @objc final internal class Shop {}

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

        @objc public class Shop {}

        final public class Shop {}

        @objc final public class Shop {}

        public class Shop {}

        final public class Shop {}

        @objc public class Shop {}

        @objc final public class Shop {}

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
}
