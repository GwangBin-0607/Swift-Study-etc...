import UIKit

var greeting = "Hello, playground"

class firstClass{
    let name = "first"
    lazy var closure:(()->Void)? = {
        print(self.name)
    }
    deinit{
        print("first DEINIT")
    }
}
var firstProperty:firstClass? = firstClass()

print(CFGetRetainCount(firstProperty))
firstProperty?.closure!()//2 -> Deinit not called
print(CFGetRetainCount(firstProperty))
firstProperty?.closure = nil//3 -> Deinit called
print(CFGetRetainCount(firstProperty))
firstProperty = nil//1 -> Deinit called
