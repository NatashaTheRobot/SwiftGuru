/*:
 ## Session 5: Memory Management
 ### 5.1 Memory Layout
 */

/// Types
MemoryLayout<Int>.size
MemoryLayout<Int>.alignment
MemoryLayout<Int>.stride

MemoryLayout<Bool>.size
MemoryLayout<Bool>.alignment
MemoryLayout<Bool>.stride

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
