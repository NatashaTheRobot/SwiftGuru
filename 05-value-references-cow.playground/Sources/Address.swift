import Foundation

public func address(of o: UnsafeRawPointer) -> String {
    let addr = Int(bitPattern: o)
    return String(format: "%p", addr)
}

public func address<T: AnyObject>(of o: T) -> String {
    let addr = unsafeBitCast(o, to: Int.self)
    return String(format: "%p", addr)
}
