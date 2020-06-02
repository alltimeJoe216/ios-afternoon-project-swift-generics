import UIKit

struct CountedSet<Element: Hashable>: ExpressibleByArrayLiteral {

    var dictionary = [Element: Int]()

    init(arrayLiteral elements: Element...) {
        for element in elements {
            insert(element)
        }
    }

    mutating func insert(_ element: Element) {
        dictionary[element] = (dictionary[element] ?? 0) + 1
    }

    mutating func remove(_ element: Element) -> Int {

        var count = dictionary[element] ?? 0

        if count > 0 {
            dictionary[element] = count - 1
            count -= 1
        }

        return count
    }

    func count() -> Int {
        return dictionary.count
    }

    subscript(_ member: Element) -> Int {
        return dictionary[member] ?? 0
    }

    private var countedSet: [Element] = []
}


// MARK: - Testing

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver}

// Counted set of Arrow Type
var aCountedSet = CountedSet<Arrow>()

aCountedSet[.iron]

// Further tests
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron]
myCountedSet.remove(.iron)
myCountedSet.remove(.dwarvish)
myCountedSet.remove(.magic)
