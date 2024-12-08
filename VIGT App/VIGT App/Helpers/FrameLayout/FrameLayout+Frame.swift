import CoreGraphics

public extension FrameLayout {
    // MARK: Set Frame Origin

    @discardableResult
    func set(left: CGFloat) -> Self {
        frame.origin = CGPoint(x: left, y: frame.origin.y)
        return self
    }

    @discardableResult
    func set(right: CGFloat) -> Self {
        set(left: right - frame.width)
    }

    @discardableResult
    func set(top: CGFloat) -> Self {
        frame.origin = CGPoint(x: frame.origin.x, y: top)
        return self
    }

    @discardableResult
    func set(bottom: CGFloat) -> Self {
        set(top: bottom - frame.height)
    }

    @discardableResult
    func set(origin: CGPoint) -> Self {
        frame.origin = origin
        return self
    }

    // MARK: Set Frame Size

    @discardableResult
    func set(width: CGFloat) -> Self {
        frame.size = CGSize(width: width, height: frame.size.height)
        return self
    }

    @discardableResult
    func set(height: CGFloat) -> Self {
        frame.size = CGSize(width: frame.size.width, height: height)
        return self
    }

    @discardableResult
    func set(width: CGFloat, height: CGFloat) -> Self {
        frame.size = CGSize(width: width, height: height)
        return self
    }

    @discardableResult
    func set(size: CGSize) -> Self {
        frame.size = size
        return self
    }
}
