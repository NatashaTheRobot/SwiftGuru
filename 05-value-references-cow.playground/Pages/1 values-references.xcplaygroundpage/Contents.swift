/*:
 ## Session 4: Value & References and Copy On Write
 ### 4.1 Value & References
 - Be able to
 */

// A struct implementation of Point
struct PointStruct: CustomStringConvertible {
    var x, y: Int
    
    var description: String {
        return "(\(x), \(y))"
    }
    
    mutating func transpose() {
        (y, x) = (x, y)
    }
}

// A class implementation of Point
class PointClass: CustomStringConvertible {
    var x, y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    var description: String {
        return "(\(x), \(y))"
    }
    
    func transpose() {
        (y, x) = (x, y)
    }
}

//////////////////////////////////////////////////////////////////////

var ps1 = PointStruct(x: 10, y: 100)
var ps2 = ps1
ps1.x = 200
ps1
ps2

var pc1 = PointClass(x: 10, y: 100)
var pc2 = pc1
pc1.x = 200
pc1
pc2

var arrayOfPointStruct: [PointStruct] = [] {
    didSet {
        print(arrayOfPointStruct)
    }
}

print("Struct Array")
arrayOfPointStruct.append(ps1)
arrayOfPointStruct.append(ps2)
arrayOfPointStruct.append(PointStruct(x: 123, y: 124))
ps1.x = 500
arrayOfPointStruct[0].x = 25
arrayOfPointStruct[1].transpose()

var arrayOfPointClass: [PointClass] = [] {
    didSet {
        print(arrayOfPointClass)
    }
}

print("Class Array")
arrayOfPointClass.append(pc1)
arrayOfPointClass.append(pc2)
arrayOfPointClass.append(pc1)

print("What prints?")
// Nope
pc1.x = 1000
print("Forced", arrayOfPointClass)
// Nope
arrayOfPointClass[0].x = -300
// Nope
arrayOfPointClass[1].transpose()
print("Forced", arrayOfPointClass)

//: [Next](@next)
