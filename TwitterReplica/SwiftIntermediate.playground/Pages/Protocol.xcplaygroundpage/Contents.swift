import Foundation


//MARK: Syntax

protocol someProtocol {
    //some stuff goes here
}

//MARK: - Enum example

protocol Describable {
    var description : String { get }
}

enum AccountType : Describable {
    case pro
    case basic
    case advanced
    
    var description: String{
        switch self {
            case .advanced:
                return "Advanced"
            case .basic:
                return "Basic"
            case .pro:
                return "Pro"
        }
    }
}





//MARK: Example

protocol Identifiable {
    var id : String { get }
}

struct User : Identifiable {
    var id: String
    let name : String
    let age : Int
    let accountType : AccountType
}

let user1 = User(id: NSUUID().uuidString, name: "Nitin", age: 12,accountType: .basic)
let user2 = User(id: NSUUID().uuidString, name: "Rohan", age: 21,accountType: .pro)

print(user1.accountType.description)
print(user2.accountType.description)

struct Product : Identifiable {
    var id : String
}


protocol Shape {
    var name : String { get }
    var numberOfSides : Int { get }
    
    func area () -> Int
}


struct Rectangle : Shape {
    let name: String
    let length : Int
    let width : Int
    var numberOfSides: Int
    
    func area() -> Int {
        return length * width
    }
    
    
}

struct Square : Shape {
    var name: String
    let side : Int
    var numberOfSides: Int
    
    func area() -> Int {
        return side * side
    }
}

var shapes = [Shape]()
let rectt = Rectangle(name: "Rectangle", length: 33, width: 9, numberOfSides: 4)
let sqrr = Square(name: "Square", side: 4, numberOfSides: 4)


shapes.append(rectt)
shapes.append(sqrr)

for shape in shapes {
    print("The name of the shape : \(shape.name) and the side of the shape is : \(shape.area())")
}


