/*:
 ## Session 7: Unsafe Swift
 ### 7.3 Typed Pointers
 - Be able to
 */

let count = 2

let pointer = UnsafeMutablePointer<Int>.allocate(capacity: count)
pointer.initialize(to: 0, count: count)
defer {
  pointer.deinitialize(count: count)
  pointer.deallocate(capacity: count)
}

pointer.pointee = 42
pointer.advanced(by: 1).pointee = 6 // or (pointer+1).pointee = 6
pointer.pointee
pointer.advanced(by: 1).pointee // or (pointer+1).pointee

let bufferPointer = UnsafeBufferPointer(start: pointer, count: count)
for (offset, value) in bufferPointer.enumerated() {
  print("value \(offset): \(value)")
}
