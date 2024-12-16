import CoreGraphics

public extension FrameLayout {
    // MARK: Adjust With Aspect Ratio

    @discardableResult
    func adjustWidth(aspectRatio ratio: CGFloat) -> Self {
        set(width: floor(frame.height * ratio))
    }

    @discardableResult
    func adjustHeight(aspectRatio ratio: CGFloat) -> Self {
        set(height: floor(frame.width / ratio))
    }
}
