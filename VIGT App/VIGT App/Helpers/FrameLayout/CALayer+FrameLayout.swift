import QuartzCore

extension CALayer: Layoutable {
    public var parent: Layoutable? { superlayer }
}

public extension CALayer {
    var frameLayout: FrameLayout { FrameLayout(currentLayoutable: self) }
}
