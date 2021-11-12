//: A UIKit based Playground for presenting user interface
import Foundation
import UIKit
class firstClass{

    init() {
        print("init")
        Classfirst(){[weak self] _,_ in // []는 캡쳐리스트를 뜻한다.
            true
        }
    }
    deinit {
        print("deinit")
    }
    func Classfirst(_ closure:(_ text: String,_ second:String)->Bool){
        closure("22","33")
    }
    
}

let testClass = firstClass()

func first(_ closure:(_ text: String,_ second:String)->Bool){
    closure("22","33")
}
/*func first(_ closure:(_ text: String,_ second:String)->Bool,test:String){
    closure("22","33")
}*/ // -> 58번 함수 에러
func second(closure:(_ text: String,_ second:String)->Bool){
    closure("22","33")
}

first({ (tex1t:String,second:String) -> Bool in
    print(tex1t)
    print(second)
    print("end")
    return true
    
})
second(closure:{ (tex1t:String,second:String) -> Bool  in
    print(tex1t)
    print(second)
    print("end")
    return true
    
})
second() {_,_ in
    return true
}

first({  please,text in
    print(text)
    print(please)
    print("end")
    return true
    
})
first(){
    testOne,testTwo in
    
     true
}
first(){
    testOne,testTwo in
    
    return true
}
first({  please,text in
    true
    
})
first({
    return $0.count > $1.count
    // $ 을 사용해서 _,_ in 이 필요없따!
})

/*struct asd{
    init() {
        print("init")
    }
    deinit {
        print("22")
    } //-> error struct는 deinit 불가하다.값 유형이기 때문.
}*/

protocol testProtocol{
  
    func action()
}
 protocol testSecondProtocol{
  
    func actionSecond()
}
extension testSecondProtocol{
    func actionSecond(){
        
    }
}
typealias testType = testProtocol&testSecondProtocol


struct protocolTestStruct:Codable{
    func action() {
        
    }
    
    func actionSecond() {
        
    }
    
    
}
var protocolTest:Codable? = [protocolTestStruct()] //가능

struct _protocolTestStruct:testType{
    func action() {
        
    }

    
}
var _protocolTest:testType? = [_protocolTestStruct()]//불가능

class medicines:testType{
  
    
 
    func actionSecond() {
        
    }
    
    func action() {
        
    }
}
var medicine:[medicines]=[]
func checkGenericAndProtocol<T:testType>(type:T.Type,data:[T]){
    print(type)
    
}
checkGenericAndProtocol(type: medicines.self,data: medicine)
//checkGenericAndProtocol(type: testType.self,data: medicine)
//Protocol 'testType' (aka 'testProtocol & testSecondProtocol') as a type cannot conform to 'testProtocol'
/*class aa{
    
}
class bb:aa{
    
}
func cc() -> bb{
    return aa()
}*/
