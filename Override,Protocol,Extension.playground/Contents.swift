import UIKit
class OverrideTest{
    var name:String?
    var age:Int?
    var hobby_return:String?
    var hobby:String?{
        get{
            return "Hi"
        }
    }
 
}
extension OverrideTest{
    //name = "hi" -> Error Extensions must not contain stored properties
}
class OverridingClass:OverrideTest{
    var name_Override:String?
    //override var name: String? = "Hi" -> Error Cannot override with a stored property 'name'
    override var name: String?{
        get{
            return name_Override
        }set{
            name_Override = newValue
        }
    }
    /*override var hobby: String?{
        get{
            return "bye"
        }/*set{
            
        }*///1
    }*/
    override init() {
        super.init()
        //hobby = "nice" //1 -> Error Cannot assign to property: 'hobby' is a get-only property
        hobby_return = "soccer"
    }
}
let OverrideProperty = OverridingClass()
print(OverrideProperty.hobby)

protocol ProtocolTest{
    var name:String?{get set} // get,set을 모두 선언해야한다.
    var age:Int?{get} // get만 선언해'도' 된다
    var hobby:String?{get set}
    var ball:String{get}
    func showName()
}
extension ProtocolTest{
    func showName(){
        
    }
    var name:String?{
        get{
            return "Hi"
        }set{
            
        }
    }
    var hobby:String?{
        get{
            return "bye"
        }set{
            
        }//2 set을 지우면 Error - > protocol의 hobby와는 다른 hobby로 인식 되어 ProtocolClass에 hobby를 생성해줘야 한다.
    }
    var ball:String{
        get{
            return "ball"
        }
    }
}
class ProtocolClass:ProtocolTest{
    var age: Int? = 100
}
