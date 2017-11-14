import Foundation

public final class SwiftReference<T> {
    var object: T
    init(_ object: T) {
        self.object = object
    }
}
