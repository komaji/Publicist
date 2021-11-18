import Foundation

// change
class Food {}

@objc class Food {}

internal class Food {}

@objc internal class Food {}

final class Food {}

@objc final class Food {}

final internal class Food {}

@objc final internal class Food {}

// keep
public class Food {}

@objc public class Food {}

final public class Food {}

@objc final public class Food {}

private class Food {}

@objc private class Food {}

final private class Food {}

@objc final private class Food {}

fileprivate class Food {}

@objc fileprivate class Food {}

final fileprivate class Food {}

@objc final fileprivate class Food {}
