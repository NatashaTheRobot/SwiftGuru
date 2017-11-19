/*:
 ## Session 5: Memory Management
 ### 5.2 Raw Pointers
 */

/* Speaker Notes
 Swift has given us various ways to access memory in Swift through unsafe pointers.
 
 Unsafe{Mutable|Raw|Buffer}Pointer<Pointee>
 
 - Mutable or Not Mutable
 - Raw bytes or Specific Type
 - Buffer of values or a single value
 */

let count = 2
let size = MemoryLayout<Int16>.size
let alignment = MemoryLayout<Int16>.alignment
let stride = MemoryLayout<Int16>.stride

let bytes = count * stride
let rawPointer = UnsafeMutableRawPointer.allocate(bytes: bytes, alignedTo: alignment)
defer {
    rawPointer.deallocate(bytes: bytes, alignedTo: alignment)
}

rawPointer.storeBytes(of: 1_000, as: Int16.self)
(rawPointer+stride).storeBytes(of: 2_000, as: Int16.self)
var value = rawPointer.load(as: Int16.self)
var value2 = (rawPointer+stride).load(as: Int16.self)

withUnsafeBytes(of: &value) { (bytes: UnsafeRawBufferPointer) in
    bytes.forEach({ (byte: UInt8) in
        print(byte)
    })
}

withUnsafeBytes(of: &value2) { (bytes: UnsafeRawBufferPointer) in
    bytes.forEach({ (byte: UInt8) in
        print(byte)
    })
}

let bufferRawPointer = UnsafeRawBufferPointer(start: rawPointer, count: bytes)
for (offset, byte) in bufferRawPointer.enumerated() {
    print(offset, byte)
}
