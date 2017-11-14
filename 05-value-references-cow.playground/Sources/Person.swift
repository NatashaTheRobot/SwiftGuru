import Foundation

@objc class Person: NSObject, NSCopying {

    public var name: String
    public var points: Int
    
    public init(name: String, points: Int) {
        self.name = name
        self.points = points
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return Person(name: name, points: points)
    }
    
    override public var description: String {
        return "\(name): \(points)"
    }
    
}
