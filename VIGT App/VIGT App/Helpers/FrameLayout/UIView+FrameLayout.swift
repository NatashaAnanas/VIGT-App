import UIKit

// MARK: - Layoutable

extension UIView: Layoutable {
    public var parent: Layoutable? { superview }
}

public extension UIView {
    var frameLayout: FrameLayout { FrameLayout(currentLayoutable: self) }
}

public extension FrameLayout {
    // MARK: Set Size That Fits

    @discardableResult
    func setSizeThatFits(
        width: CGFloat = CGFloat.greatestFiniteMagnitude,
        height: CGFloat = CGFloat.greatestFiniteMagnitude
    ) -> FrameLayout {
        guard
            let currentLayoutable = currentLayoutable as? UIView
        else {
            assertionFailure("Support only UIView")
            return self
        }
        let size = currentLayoutable.sizeThatFits(CGSize(width: width, height: height))
        return set(width: min(width, size.width), height: min(height, size.height))
    }
}
