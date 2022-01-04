import UIKit

var greeting = "Hello, playground"

class ReferenceType{
    @objc func timerAction(){
        print("action!")
    }
}
let property = ReferenceType()
print(CFGetRetainCount(property))
let timer = Timer.scheduledTimer(timeInterval: 2.0, target: property, selector: #selector(property.timerAction), userInfo: nil, repeats: false)
Timer.scheduledTimer(timeInterval: 2.0, target: property, selector: #selector(property.timerAction), userInfo: nil, repeats: false)
print(timer)
print(CFGetRetainCount(property))
timer.invalidate()
print(timer)
print(CFGetRetainCount(property))

NotificationCenter.default.addObserver(property, selector: #selector(property.timerAction), name: UIResponder.keyboardWillShowNotification, object: nil)
print(CFGetRetainCount(property))
let te = UITextField()
te.inputView = UIView()
