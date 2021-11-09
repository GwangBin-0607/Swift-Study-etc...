

import Foundation
import UIKit

/*Stack,Heap // Value,Reference*/
 func address(of object: UnsafeRawPointer) -> String{
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}

class First:NSObject{
    
    var stringText:String?
    func testFirst(){
 
    }
}
class Second:First{

}


var first = First()
var second = first
var test = 123
var testTwo = 456
print(first.self)
print(second.self)
print(address(of: &first))
print(address(of: &second))
print(address(of: &test))
print(address(of: &testTwo))
print(MemoryLayout.size(ofValue:first))//Stack Size
print(class_getInstanceSize(First.self))//heap Size -> 기본적으로 8이 깔려있다


class classType{
    let resultProperty:Int
    init(ResultProperty:Int) {
        self.resultProperty = ResultProperty
    }
}

func StackProperty(x:Int,y:Int) -> classType{
    let firstInt = x
    let secondInt = y
    let result = firstInt*secondInt
    let classProperty = classType(ResultProperty: result)
    
    return classProperty
}




let classProperty = classType(ResultProperty: 456)
let resultInClass = classProperty.resultProperty



/*class First:UIView{
    init() {
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class caseOne:NSObject{
    
}
class caseTwo: caseOne {
    override init() {
        <#code#>
    }
    init(name:String){
        
    }
    required init?(age:Int){
        
    }
}*/



///Generic
/*func testFunc(a:inout Int?,b:inout Int!){
    a = 300
    b = 500
}
var testOne:Int? = 123
var testTwo:Int! = 456
testFunc(a: &testOne, b: &testTwo)

print(testOne)
print(testTwo)

var textString:String
var numberInt:Int

func Generic<T,H>(a:inout T,b:inout H){
    let temporaryA = a
    a = b as? T
    
}*/



/*struct HashTest{
    let Name:String
    let Age:Int
}
extension HashTest:Hashable{
    static func == (lhs:HashTest,rhs:HashTest)->Bool{
        return lhs.Name == rhs.Name && lhs.Age == rhs.Age
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(Name)
        hasher.combine(Age)
        
    }
}
let hashOne = HashTest(Name: "광빈", Age: 25)
let hashTwo = HashTest(Name: "광빈", Age: 36)

print(hashOne == hashTwo)*/




/*class dataA:NSObject{
    override func isEqual(_ object: Any?) -> Bool {
        print("equal")
        return true
    }
}
class inheritDataA:dataA{
    override func isEqual(_ object: Any?) -> Bool {
        print("equal Herit")
        return true
    }
}
let testPropertyA = dataA()
let testPropertyB = inheritDataA()

print(testPropertyA as? inheritDataA)*/

