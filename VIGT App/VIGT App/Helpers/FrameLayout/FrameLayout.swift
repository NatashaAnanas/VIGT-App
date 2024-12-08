import CoreGraphics

public protocol Layoutable: AnyObject {
    var parent: Layoutable? { get }
    var frame: CGRect { get set }
    var bounds: CGRect { get set }
}

public final class FrameLayout {
    unowned let currentLayoutable: Layoutable
    weak var parent: Layoutable? { currentLayoutable.parent }
    var frame: CGRect {
        get {
            currentLayoutable.frame
        }
        set {
            currentLayoutable.frame = newValue
        }
    }

    var bounds: CGRect {
        get {
            currentLayoutable.bounds
        }
        set {
            currentLayoutable.bounds = newValue
        }
    }

    init(currentLayoutable: Layoutable) {
        self.currentLayoutable = currentLayoutable
    }
}
