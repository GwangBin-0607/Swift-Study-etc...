import UIKit
class hello{
    var number = 50
    deinit {
        print("deinit!")
    }
}

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    let helloProperty:hello? = hello()
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    func property() -> Int {
        helloProperty!.number += amount
        print(CFGetRetainCount(helloProperty))
        return helloProperty!.number
    }
    return property
}
let proRetain = makeIncrementer(forIncrement: 10)

proRetain()

proRetain()

proRetain()

let retain = makeIncrementer(forIncrement: 10)
retain()
retain()
retain()


/*var helloProperty:hello? = hello()
//let test = helloProperty
print(CFGetRetainCount(helloProperty))
let other:()->Void = {
    helloProperty?.number += 100
    
}
print(CFGetRetainCount(helloProperty))
other()
print(helloProperty?.number)
print(CFGetRetainCount(helloProperty))
other()
print(helloProperty?.number)
helloProperty = nil
other()
print(helloProperty?.number)*/

