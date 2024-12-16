//import CoreGraphics
//import UIKit
//
//public extension FrameLayout {
//    // MARK: Align With Parent
//
//    @discardableResult
//    func alignLeft(margin: CGFloat = 0) -> Self {
//        set(left: margin)
//    }
//
//    @discardableResult
//    func alignRight(margin: CGFloat = 0) -> Self {
//        guard let parent else {
//            return self
//        }
//        return set(right: parent.bounds.width - margin)
//    }
//
//    @discardableResult
//    func alignTop(margin: CGFloat = 0) -> Self {
//        set(top: margin)
//    }
//
//    @discardableResult
//    func alignBottom(margin: CGFloat = 0) -> Self {
//        guard let parent else {
//            return self
//        }
//        return set(bottom: parent.bounds.height - margin)
//    }
//
//    // MARK: Align With View
//
//    @discardableResult
//    func alignLeft(with layoutable: Layoutable, margin: CGFloat = 0) -> Self {
//        assert(layoutable.parent === parent, "Aligning layoutables with different parents")
//        return set(left: layoutable.frame.left + margin)
//    }
//
//    @discardableResult
//    func alignRight(with layoutable: Layoutable, margin: CGFloat = 0) -> Self {
//        assert(layoutable.parent === parent, "Aligning layoutables with different parents")
//        return set(right: layoutable.frame.right - margin)
//    }
//
//    @discardableResult
//    func alignTop(with layoutable: Layoutable, margin: CGFloat = 0) -> Self {
//        assert(layoutable.parent === parent, "Aligning layoutables with different parents")
//        return set(top: layoutable.frame.top + margin)
//    }
//
//    @discardableResult
//    func alignBottom(with layoutable: Layoutable, margin: CGFloat = 0) -> Self {
//        assert(layoutable.parent === parent, "Aligning layoutables with different parents")
//        return set(bottom: layoutable.frame.bottom - margin)
//    }
//
//    @discardableResult
//    func alignCenterHorizontally(with layoutable: Layoutable, margin: CGFloat = 0) -> Self {
//        assert(layoutable.parent === parent, "Aligning layoutables with different parents")
//        return set(left: layoutable.frame.center.x - frame.width / 2 + margin)
//    }
//
//    @discardableResult
//    func alignCenterVertically(with layoutable: Layoutable, margin: CGFloat = 0) -> Self {
//        assert(layoutable.parent === parent, "Aligning layoutables with different parents")
//        return set(top: layoutable.frame.center.y - frame.height / 2 + margin)
//    }
//
//    @discardableResult
//    func alignCenter(
//        with layoutable: Layoutable,
//        horizontalMargin: CGFloat = 0,
//        verticalMargin: CGFloat = 0
//    ) -> Self {
//        alignCenterHorizontally(with: layoutable, margin: horizontalMargin)
//            .alignCenterVertically(with: layoutable, margin: verticalMargin)
//    }
//
//    @discardableResult
//    func alignCenter(with layoutable: Layoutable, margin: CGFloat) -> Self {
//        alignCenter(with: layoutable, horizontalMargin: margin, verticalMargin: margin)
//    }
//}
