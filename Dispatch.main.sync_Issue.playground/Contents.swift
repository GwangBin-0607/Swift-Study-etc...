import UIKit


func database(complete:@escaping ()->Void){
    DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: UInt64(2.0)), execute: {
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

class parameter{
    static var methodNumber = 50
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

func returnFunction(){
    print("start")
    guard parameter.methodNumber>100 else{
        return returnFunction()
    }
    print("complete")
}
returnFunction()
parameter.methodNumber = 500
