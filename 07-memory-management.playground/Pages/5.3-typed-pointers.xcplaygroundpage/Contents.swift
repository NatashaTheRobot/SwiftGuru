/*:
 ## Session 5: Memory Management
 ### 5.3 Typed unsafePointers
 */

let count = 2
let unsafePointer = UnsafeMutablePointer<Int16>.allocate(capacity: count)
unsafePointer.initialize(to: 0, count: count)
defer {
    unsafePointer.deinitialize(count: count)
    unsafePointer.deallocate(capacity: count)
}

unsafePointer.pointee = 1_000
(unsafePointer+1).pointee = 2_000

unsafePointer.pointee
(unsafePointer+1).pointee

let unsafeBufferPointer = UnsafeBufferPointer(start: unsafePointer, count: count)
for (offset, value) in unsafeBufferPointer.enumerated() {
    print(offset, value)
}
