import Foundation

class person{
    let name:String? //어떠한 개체에 종속된 프로퍼티
    init(Name:String) {
        self.name = Name
    }
}
let test:String = "Hello" // 어떠한 개체에 종속되지 않은 프로퍼티 일반적인 전역변수
