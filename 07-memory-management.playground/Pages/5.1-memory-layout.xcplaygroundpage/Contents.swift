/*:
 ## Session 5: Memory Management
 ### 5.1 Memory Layout
 */

/* Speaker Notes
 In Unsafe Swift, you are responsible for the life cycle of memory to avoid undefined behaviour or leaks.
 - You should deallocate and deinitialize memory to avoid leaks.
 - You should not return the pointer when using withUsafeBytes outside the closure to prevent undefined behaviour.
 - You should only bind one type at a time.
 
 As we are dealing with memory directly, first we need to understand the memory layout.
 
 Memory Layout of the type describe its
 - size
 - alignment
 - stride
 */

/// Types
MemoryLayout<Int>.size
MemoryLayout<Int>.alignment
MemoryLayout<Int>.stride

MemoryLayout<Bool>.size
MemoryLayout<Bool>.alignment
MemoryLayout<Bool>.stride

/* Speaker Notes
 Lets look at the structs, An Empty struct has a size of 0 but the alignment and stride is 1 because if we store an instance of empty struct in an array, it needs to have a unique reference to it.
 
 And the struct with stuff inside it has a size of 5 and alignment of 4 which means if we want to pack these things together, they need to be on 4 byte boundaries and stride of 8 which means if we want to pack them together, the best we can do with this alignment is 8.
 */

/// Empty Struct
struct EmptyStruct {}
MemoryLayout<EmptyStruct>.size
MemoryLayout<EmptyStruct>.alignment
MemoryLayout<EmptyStruct>.stride

/// Some Struct
struct SomeStruct {
    let number: Int32
    let flag: Bool
}
MemoryLayout<SomeStruct>.size
MemoryLayout<SomeStruct>.alignment
MemoryLayout<SomeStruct>.stride

/* Speaker Notes
 Lets look at the classes, As we know classes are reference types and an empty class and a class with stuff inside it have the same memory layout.
 
 It doesnt really give us much information into the internal structure on what this reference is refering to and I can even do things like make it an Objective-C Type and derive from NSObject but the memory layout still remains the same.
 */

/// Empty Class
class EmptyClass {}
MemoryLayout<EmptyClass>.size
MemoryLayout<EmptyClass>.alignment
MemoryLayout<EmptyClass>.stride

/// Some Class
class SomeClass {
    var number: Int64 = 0
    var flag: Bool = false
}
MemoryLayout<EmptyClass>.size
MemoryLayout<EmptyClass>.alignment
MemoryLayout<EmptyClass>.stride
