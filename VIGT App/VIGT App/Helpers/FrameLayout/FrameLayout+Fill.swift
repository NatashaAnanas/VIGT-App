import CoreGraphics
import UIKit

public extension FrameLayout {
    // MARK: Fill Parent

    @discardableResult
    func fillParentWidth(leftMargin: CGFloat = 0, rightMargin: CGFloat = 0) -> Self {
        guard let parent else {
            return self
        }
        return set(left: leftMargin)
            .set(width: parent.bounds.width - leftMargin - rightMargin)
    }

    @discardableResult
    func fillParentWidth(horizontalMargin: CGFloat) -> Self {
        fillParentWidth(leftMargin: horizontalMargin, rightMargin: horizontalMargin)
    }

    @discardableResult
    func fillParentHeight(topMargin: CGFloat = 0, bottomMargin: CGFloat = 0) -> Self {
        guard let parent else {
            return self
        }
        return set(top: topMargin)
            .set(height: parent.bounds.height - topMargin - bottomMargin)
    }

    @discardableResult
    func fillParentHeight(verticalMargin: CGFloat) -> Self {
        fillParentHeight(topMargin: verticalMargin, bottomMargin: verticalMargin)
    }

    @discardableResult
    func fillParent(margin: UIEdgeInsets) -> Self {
        fillParentWidth(leftMargin: margin.left, rightMargin: margin.right)
            .fillParentHeight(topMargin: margin.top, bottomMargin: margin.bottom)
    }

    @discardableResult
    func fillParent(horizontalMargin: CGFloat = 0, verticalMargin: CGFloat = 0) -> Self {
        fillParent(margin: UIEdgeInsets(horizontal: horizontalMargin, vertical: verticalMargin))
    }

    @discardableResult
    func fillParent(margin: CGFloat) -> Self {
        fillParent(horizontalMargin: margin, verticalMargin: margin)
    }

    // MARK: Fill View

    @discardableResult
    func fillWidth(
        of layoutable: Layoutable,
        leftMargin: CGFloat = 0,
        rightMargin: CGFloat = 0
    ) -> Self {
        set(left: layoutable.frame.left + leftMargin)
            .set(width: layoutable.frame.width - leftMargin - rightMargin)
    }

    @discardableResult
    func fillWidth(of layoutable: Layoutable, horizontalMargin: CGFloat) -> Self {
        fillWidth(of: layoutable, leftMargin: horizontalMargin, rightMargin: horizontalMargin)
    }

    @discardableResult
    func fillHeight(
        of layoutable: Layoutable,
        topMargin: CGFloat = 0,
        bottomMargin: CGFloat = 0
    ) -> Self {
        set(top: layoutable.frame.top + topMargin)
            .set(height: layoutable.frame.height - topMargin - bottomMargin)
    }

    @discardableResult
    func fillHeight(of layoutable: Layoutable, verticalMargin: CGFloat) -> Self {
        fillHeight(of: layoutable, topMargin: verticalMargin, bottomMargin: verticalMargin)
    }

    @discardableResult
    func fill(_ layoutable: Layoutable, margin: UIEdgeInsets) -> Self {
        fillWidth(of: layoutable, leftMargin: margin.left, rightMargin: margin.right)
            .fillHeight(of: layoutable, topMargin: margin.top, bottomMargin: margin.bottom)
    }

    @discardableResult
    func fill(
        _ layoutable: Layoutable,
        horizontalMargin: CGFloat = 0,
        verticalMargin: CGFloat = 0
    ) -> Self {
        fill(layoutable, margin: UIEdgeInsets(horizontal: horizontalMargin, vertical: verticalMargin))
    }

    @discardableResult
    func fill(_ layoutable: Layoutable, margin: CGFloat) -> Self {
        fill(layoutable, horizontalMargin: margin, verticalMargin: margin)
    }
}
