/*:
 ## Session 3: Generics and Protocols
 ### 3.3 Protocols with Associated Type
 */

//5.1 Create a stackable protocol that has array of items as a property requirement and has mutating method requirements to push and pop an integer
protocol Stackable {
    associatedtype Item
    mutating func push(_ item: Item)
    mutating func pop() -> Item?
}

//5.2 Create a generic struct Stack and adopt the Stackable protocol
struct Stack<Element>: Stackable {
    typealias Item = Element
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element? {
        return items.removeLast()
    }
}

var intStack = Stack<Int>()
intStack.push(3)
intStack.push(2)
intStack.push(1)
intStack.push(0)
intStack.pop()

//5.3 Extending Existing Types
//5.3.1 Array
extension Array: Stackable {
    typealias Item = Element
    mutating func push(_ item: Element) {
        self.append(item)
    }
    mutating func pop() -> Element? {
        return self.removeLast()
    }
}

var arrayStack = Array<String>()
arrayStack.push("3")
arrayStack.push("2")
arrayStack.push("1")
arrayStack.push("0")
arrayStack.pop()

//5.3.2 LinkedList
extension LinkedList: Stackable {
    typealias Item = Element
    mutating func push(_ item: Element) {
        let node = LinkedListNode(value: item)
        let current = head
        head = node
        node.next = current
    }
    mutating func pop() -> Element? {
        let current = head
        head = head?.next
        return current?.value
    }
}

var llStack = LinkedList<String>()
llStack.push("3")
llStack.push("2")
llStack.push("1")
llStack.push("0")
llStack.pop()

//5.4 Extend Stackable to provide additional functionality
//5.4.1 Find the Top Element
extension Stackable where Self: Collection, Item == Self.Element {
    func peek() -> Item? {
        return isEmpty ? nil : self[startIndex]
    }
}
arrayStack.peek()


//5.4.2 Check if isPeak at a given number
extension Stackable where Self: Collection, Item == Self.Element, Item: Equatable {
    func isPeek(at number: Item) -> Bool {
        return peek() == number
    }
}
arrayStack.isPeek(at: "3")
arrayStack.isPeek(at: "1")

//5.4.2 Find the largest item
extension Stackable where Self: Collection, Item == Self.Element, Item: Comparable {
    func largest() -> Item? {
        guard let first = self.first else { return nil }
        return reduce(first) { $0 > $1 ? $0 : $1 }
    }
}
arrayStack.largest()

//5.4.2 Existing Functionality of Protocols automatically adopted
arrayStack.contains("3")
llStack.contains("1")
