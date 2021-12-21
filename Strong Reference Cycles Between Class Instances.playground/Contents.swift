import UIKit
protocol bookDelegate:NSObjectProtocol{
    
}
protocol personDelegate:NSObjectProtocol{
    
}
class Appdelegate:NSObject,bookDelegate{
    var bookId:String?
    var person:personDelegate?
    override init() {
        print("book Init")
    }
    deinit {
        print("book Deinit")
    }
}
class MainViewController:NSObject,personDelegate{
    //weak var book:Book?
    var book:bookDelegate?
    override init() {
        print("person Init")
    }
    deinit {
        print("person Deinit")
    }
}

var bookProperty:Appdelegate? = Appdelegate()
var personProperty:MainViewController? = MainViewController()

bookProperty?.person = personProperty
personProperty?.book = bookProperty

bookProperty = nil
personProperty = nil


