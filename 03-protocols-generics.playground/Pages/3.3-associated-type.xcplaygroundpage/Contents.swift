/*:
 ## Session 3: Protocols and Generics
 ### 3.3 Protocols with Associated Type
 */

//5.1 Create a stackable protocol that has array of items as a property requirement and has mutating method requirements to push and pop an element

//5.2 Create a generic struct Stack and adopt the Stackable protocol
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
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

//var arrayStack = Array<Int>()
//arrayStack.push(3)
//arrayStack.push(2)
//arrayStack.push(1)
//arrayStack.push(0)
//arrayStack.pop()

//5.3.2 LinkedList

//var llStack = LinkedList<String>()
//llStack.push("foooo")
//llStack.push("bazz")
//llStack.push("bar")
//llStack.push("buzzzz")
//llStack.pop()
//
//llStack.count

//5.4 Extend Stackable to provide additional functionality
//5.4.1 Find the peek
//arrayStack.peek() //3
//llStack.peek() //bar

//5.4.2 Check if isPeak at a given element
//arrayStack.isPeek(at: 3) //true
//arrayStack.isPeek(at: 1) //false
//llStack.isPeek(at: "bar") //true

//5.4.2 Find the largest item
//arrayStack.largest() //3
//llStack.largest() //foooo

