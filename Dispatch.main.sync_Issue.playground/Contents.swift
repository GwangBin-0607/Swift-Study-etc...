import UIKit
import Foundation
//
//func hihi(){
//    var list:[Int] = [1,2,34,5,2,5]
//
//    DispatchQueue.main.asyncAfter(deadline:.now() + 2.0, execute: {
//        print(list[5])
//           })
//    list = [1,3]
//}
//hihi()
for i in 0..<500{
    print(i)
}
DispatchQueue.main.sync {
    print("complete")
}
for i in 500..<1000{
    print(i)
}
class number{
    var numberCheck:Int?
}
print(class_getInstanceSize(number.self))//Byte
let concurrent = DispatchQueue(label: "hello",attributes: .concurrent)
let serial = DispatchQueue(label: "hello")

serial.async {
    print("one Serial Task Start")
    serial.asyncAfter(deadline:.now() + 3.0, execute: {
        print("one Serial Task Complete")
    })
}
serial.async {
    print("two Serial Task Start")
    serial.asyncAfter(deadline:.now() + 2.0, execute: {
        print("two Serial Task Complete")
    })
}


let startDate = Date()
print("start")
concurrent.sync {
    
    print("one concurrent Task Complete")
    
    concurrent.sync {
        
        print("two concurrent Task Complete")
        
    }
    
}
concurrent.sync {
    print("concurrent complete")
}
serial.sync {
    
    print("one Task Complete")
    
    serial.sync {
        
        print("two Task Complete")
        
    }
    
}
serial.sync {
    print("complete")
}



print(Date().timeIntervalSince(startDate))






class parameter{
    static var methodNumber = 50
}

func returnFunction(){
    print("start")
    guard parameter.methodNumber>100 else{
        return returnFunction()
    }
    print("complete")
}
DispatchQueue.global().async {
    returnFunction()
    parameter.methodNumber = 500
    print("comcom")
}

func database(complete:@escaping ()->Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
        complete()
    })
}
for i in 0..<10{
    print(i)
    database(complete: {
        print(i)
        print("complete")
    })
    
}



class Service{
    let name:String
    init(Name:String) {
        name = Name
    }
    func getServiceName(){
        DispatchQueue.global().sync {
            print(name,"Service")
        }
        
    }
}
let serviceProperty = Service(Name: "coffee")
serviceProperty.getServiceName()


returnFunction()//이게 끝나지 않는 이상
parameter.methodNumber = 500//이거 안넘어감
