import CoreGraphics

public extension FrameLayout {
    // MARK: Stretch In Parent

    @discardableResult
    func stretchToTheLeft(margin: CGFloat = 0) -> Self {
        set(width: frame.right - margin)
            .alignLeft(margin: margin)
    }

    @discardableResult
    func stretchToTheRight(margin: CGFloat = 0) -> Self {
        guard let parent else {
            return self
        }
        return set(width: parent.bounds.width - frame.left - margin)
    }

    @discardableResult
    func stretchToTheTop(margin: CGFloat = 0) -> Self {
        set(height: frame.bottom - margin)
            .alignTop(margin: margin)
    }

    @discardableResult
    func stretchToTheBottom(margin: CGFloat = 0) -> Self {
        guard let parent else {
            return self
        }
        return set(height: parent.bounds.height - frame.top - margin)
    }

    // MARK: Stretch between Layoutables

    @discardableResult
    func stretchHorizontally(
        between layoutable1: Layoutable,
        _ layoutable2: Layoutable,
        leftMargin: CGFloat = 0,
        rightMargin: CGFloat = 0
    ) -> Self {
        assert(layoutable1.parent === parent, "Stretching between layoutables with different parents")
        assert(layoutable2.parent === parent, "Stretching between layoutables with different parents")
        let (leftLayoutable, rightLayoutable) = layoutable1.frame.left < layoutable2.frame.left
            ? (layoutable1, layoutable2)
            : (layoutable2, layoutable1)
        return place(toTheRightOf: leftLayoutable, margin: leftMargin)
            .set(width: rightLayoutable.frame.left - leftLayoutable.frame.right - leftMargin - rightMargin)
    }

    @discardableResult
    func stretchVertically(
        between layoutable1: Layoutable,
        _ layoutable2: Layoutable,
        topMargin: CGFloat = 0,
        bottomMargin: CGFloat = 0
    ) -> Self {
        assert(layoutable1.parent === parent, "Stretching between layoutables with different parents")
        assert(layoutable2.parent === parent, "Stretching between layoutables with different parents")
        let (topLayoutable, bottomLayoutable) = layoutable1.frame.top < layoutable2.frame.top
            ? (layoutable1, layoutable2)
            : (layoutable2, layoutable1)
        return place(below: topLayoutable, margin: topMargin)
            .set(height: bottomLayoutable.frame.top - topLayoutable.frame.bottom - topMargin - bottomMargin)
    }
}
