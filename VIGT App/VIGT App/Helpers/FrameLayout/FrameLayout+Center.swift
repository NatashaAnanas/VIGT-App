import CoreGraphics

// MARK: - Center Single Layoutable

public extension FrameLayout {
    // MARK: Center In Parent

    @discardableResult
    func centerHorizontally(offset: CGFloat = 0) -> Self {
        guard let parent else {
            return self
        }
        return set(left: (parent.bounds.width - bounds.width + offset) / 2)
    }

    @discardableResult
    func centerVertically(offset: CGFloat = 0) -> Self {
        guard let parent else {
            return self
        }
        return set(top: (parent.bounds.height - bounds.height + offset) / 2)
    }

    @discardableResult
    func center() -> Self {
        centerHorizontally()
            .centerVertically()
    }

    // MARK: Center In Interval / Rect

    @discardableResult
    func centerHorizontally(in interval: ClosedRange<CGFloat>) -> Self {
        set(left: interval.lowerBound + (interval.upperBound - interval.lowerBound - bounds.width) / 2)
    }

    @discardableResult
    func centerVertically(in interval: ClosedRange<CGFloat>) -> Self {
        set(top: interval.lowerBound + (interval.upperBound - interval.lowerBound - bounds.height) / 2)
    }

    @discardableResult
    func center(in rect: CGRect) -> Self {
        centerHorizontally(in: rect.horizontalInterval)
            .centerVertically(in: rect.verticalInterval)
    }
}

// MARK: - Center Layoutable Group

public extension Sequence where Iterator.Element == Layoutable {
    // MARK: Center In Parent

    @discardableResult
    func centerHorizontally(offset: CGFloat = 0) -> Self {
        guard let parent = compactMap(\.parent).first else {
            return self
        }
        return centerHorizontally(in: 0 ... parent.bounds.width, offset: offset)
    }

    @discardableResult
    func centerVertically(offset: CGFloat = 0) -> Self {
        guard let parent = compactMap(\.parent).first else {
            return self
        }
        return centerVertically(in: 0 ... parent.bounds.height, offset: offset)
    }

    @discardableResult
    func center(horizontalOffset: CGFloat = 0, verticalOffset: CGFloat = 0) -> Self {
        centerHorizontally(offset: horizontalOffset)
            .centerVertically(offset: verticalOffset)
    }

    // MARK: Center In Interval / Rect

    @discardableResult
    func centerHorizontally(in interval: ClosedRange<CGFloat>, offset: CGFloat = 0) -> Self {
        assertSameParents()

        guard let leftmost = sorted(by: { $0.frame.left < $1.frame.left }).first else {
            return self
        }

        let groupWidth = frameUnion.size.width
        let delta = interval.lowerBound
            + (interval.upperBound - interval.lowerBound - groupWidth) / 2
            - leftmost.frame.left
        let coordinates = map { $0.frame.origin.x + delta + offset }
        enumerated().forEach { index, item in
            item.frame.origin.x = coordinates[index]
        }

        return self
    }

    @discardableResult
    func centerVertically(in interval: ClosedRange<CGFloat>, offset: CGFloat = 0) -> Self {
        assertSameParents()

        guard let topmost = sorted(by: { $0.frame.top < $1.frame.top }).first else {
            return self
        }

        let groupHeight = frameUnion.size.height
        let delta = interval.lowerBound
            + (interval.upperBound - interval.lowerBound - groupHeight) / 2
            - topmost.frame.top
        let coordinates = map { $0.frame.origin.y + delta + offset }
        enumerated().forEach { index, item in
            item.frame.origin.y = coordinates[index]
        }

        return self
    }

    @discardableResult
    func center(in rect: CGRect) -> Self {
        centerHorizontally(in: rect.horizontalInterval)
            .centerVertically(in: rect.verticalInterval)
    }
}

// MARK: - Implementation

private
extension Sequence where Iterator.Element == Layoutable {
    var frameUnion: CGRect {
        map(\.frame).union
    }

    func assertSameParents() {
        let parents = map(\.parent)

        if (parents.contains { $0 == nil }) {
            assertionFailure("Can't manipulate layoutables without parent")
        }

        let haveDifferentParents = parents.first.map { first in
            parents.contains { $0 !== first }
        } ?? false
        if haveDifferentParents {
            assertionFailure("Can't manipulate layoutables with different parents")
        }
    }
}
