import UIKit

var greeting = "Hello, playground"

let classTypeProperty = ClassType() //Error init -> public 해줘야함 ///ErrorCode :error: MemorySize.playground:5:12: error: 'ClassType' initializer is inaccessible due to 'internal' protection level
//let subClassTypeProperty = classTypeProperty.SubClassType() //-> Error Code:Static Member 'SubClassType' cannot be used on instance of type 'ClassType'
let subClassTypeProperty = ClassType.SubClassType()

MemoryLayout.size(ofValue: classTypeProperty)
MemoryLayout.size(ofValue: subClassTypeProperty)

classTypeProperty.out()
ClassType.out(classTypeProperty)


///Value Type - complieTime,Reference Type  - run Time
///스택과 힙.스택은 정적 메모리 할당에 사용되고 힙은 동적 메모리 할당에 사용되며 둘 다 컴퓨터의 RAM에 저장됩니다.스택에 할당된 변수는 메모리에 직접 저장되며 이 메모리에 대한 액세스는 매우 빠르며 프로그램이 컴파일될 때 할당이 결정됩니다. 함수나 메소드가 다른 함수를 호출하고 다른 함수를 차례로 호출하는 등의 경우, 모든 함수의 실행은 맨 마지막 함수가 값을 반환할 때까지 일시 중단된 상태로 유지됩니다. 스택은 항상 LIFO 순서로 예약되며 가장 최근에 예약된 블록은 항상 해제될 다음 블록입니다. 이것은 스택을 추적하는 것을 정말 간단하게 만듭니다. 스택에서 블록을 해제하는 것은 포인터 하나를 조정하는 것에 불과합니다.
///힙에 할당된 변수는 런타임에 메모리가 할당되며 이 메모리에 액세스하는 것은 약간 느리지만 힙 크기는 가상 메모리 크기에 의해서만 제한됩니다. 힙의 요소는 서로 종속성이 없으며 언제든지 무작위로 액세스할 수 있습니다. 언제든지 블록을 할당하고 언제든지 해제할 수 있습니다. 이로 인해 주어진 시간에 할당되거나 해제된 힙 부분을 추적하는 것이 더 복잡해집니다


/*class A{
    init(name:String) {
        print(name)
    }
    func test(){
        
    }
}
class B:A{
    let age:Int?
    init(age:Int) {
        print(age)
        
        super.init(name: String(age))
        self.age = age
    }
    func test(name:String){
        
    }
 
 //Reference Type : Class,Function,Closure
}*/
