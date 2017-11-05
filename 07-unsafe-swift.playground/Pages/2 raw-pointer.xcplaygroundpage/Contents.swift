//: [Previous](@previous)

let count = 2
let stride = MemoryLayout<Int>.stride
let alignment = MemoryLayout<Int>.alignment
let byteCount = stride * count

let pointer = UnsafeMutableRawPointer.allocate(bytes: byteCount, alignedTo: alignment)
defer {
    pointer.deallocate(bytes: byteCount, alignedTo: alignment)
}

pointer.storeBytes(of: 42, as: Int.self)
pointer.advanced(by: stride).storeBytes(of: 6, as: Int.self)
// or (pointer+stride).storeBytes(of: 6, as: Int.self)

pointer.load(as: Int.self)
pointer.advanced(by: stride).load(as: Int.self)
// or (pointer+stride).load(as: Int.self)

let bufferPointer = UnsafeRawBufferPointer(start: pointer, count: byteCount)
for (offset, byte) in bufferPointer.enumerated() {
    print("byte \(offset): \(byte)")
}

//: [Next](@next)
