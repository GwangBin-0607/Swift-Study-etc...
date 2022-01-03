import UIKit
import Foundation

func hihi(){
    var list:Int? = 100
    DispatchQueue.main.asyncAfter(deadline:.now() + 5.0, execute: {
        print(list) // -> nil 지역변수로서 참조를 하나보다 -> 메서드도 참조유형이므로 메서드가 끝나기전에 값을 바꾸면 바뀐 값이 캡쳐가 된다.
//            [list] in
//            //캡쳐리스트 할때와 안할때 차이가 있다 값 유형이라도.
//            print(list)
        //print -> 100
    })
    list = nil
}



class ser{
    var number = 10
}
class test{
    let serpro = ser() //1
    lazy var second = serpro //2
    lazy var clo = {
        [serpro] in //3
        print(serpro)
    }
   
}

let pro  = test()
pro.clo()
print(CFGetRetainCount(pro))
print(pro.second)
print("\(CFGetRetainCount(pro.serpro))===========")//4
print("\(pro.serpro.number)===========")
pro.serpro.number = 100
print("\(pro.serpro.number)===========")


func databaseQuery(closure:@escaping ()->Void){
    DispatchQueue.main.asyncAfter(deadline:DispatchTime(uptimeNanoseconds: UInt64(2.0)), execute: {
        closure()
    })
    //closure()
    
}
func basicPrint(number:Int){
    print("BASIC========\(number)")
}
for i in 0..<10{
    print(i)
    basicPrint(number: i)
    DispatchQueue.main.async {
        databaseQuery {
            print("Query=============\(i)")
        }
    }
   
}






class Person{
    var name:String!
    init(Name:String) {
        self.name = Name
    }
    func nameToServer(_ completion:@escaping()->Void){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(Int(2.0))) {
            //Server에서 값을 받는다는 가정 값을 받기까지 2.0초 걸린다.
            completion()
        }
    }
}
final class ServerManager{
 static let manager = ServerManager()
 var serverState:ServerState = .wait
 func serverWithPerson(url:UrlToServer,person:Person){
 person.nameToServer({
 //[serverState] in///현재 관점 case 2
 ///처음 관점 시작------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ///Case 1
 //print(url)
 ///Case 2 일단 전역변수는 self.를 해줘야한다 명확한 참조를 나타내기 위해서 안한다면 에러는 Reference to property 'serverState' in closure requires explicit use of 'self' to make capture semantics explicit
 ///Closure안에서 'serverState' 속성에 대한 참조는 캡처 의미를 명시적으로 만들기 위해 'self'를 명시적으로 사용해야 합니다.
 ///self.serverState 또는 Clsure Capture List에 self 참조
 //print(serverState)
 ///Case 3
 //print(person.name)
 ///처음 관점 끝------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 ///현재 관점 시작------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 ///case 1
 ///self.serverState 는 캡쳐리스트 [self] in 과 같다.이는 즉 serverState를 직접적으로 캡쳐하는게 아닌 self를 캡쳐한다는 말이다.
 ///self는 무엇인가?Class Reference Type이다.
 ///Reference Type을 참조하니 Reference Type인 ServerManager의 serverState값을 바꾼것이 출력되는 것이다. ->'run' 출력
 //print(self.serverState)
 ///case 2
 ///그렇다면 [self]가 아닌 [serverState]를 직접적으로 캡쳐하면 어떻게 될까
 ///serverState는 Value Type이다.즉 값 자체를 저장한다 ->값을 변경해도 클로저가 생성될 때에 serverState 값이 출력된다 -> 'wait' 출력
 //print(serverState)
 ///case 3 그렇다면 ServerManager자체를 struct로 바꿔보자 밑에 코드를 보자
 ///현재 관점 끝------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 })
 }
 }



/*struct ServerManager{ /// final을 사용 할 수 없음
    static var manager = ServerManager() ///var로 바꿔줘야한다. 여기서 ServerManager은 Value Type이다.serverState가 바뀐다는건 ServerManager() 이 자체가 바뀐다는 뜻이다.따라서 변할 수 있는 값 var로 바꿔줘야한다.
    var serverState:ServerState = .wait
    func serverWithPerson(url:UrlToServer,person:Person){
        person.nameToServer({
           
            
            ///현재 관점 시작------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            ///case 1
            ///self.serverState 는 캡쳐리스트 [self] in 과 같다.이는 즉 serverState를 직접적으로 캡쳐하는게 아닌 self를 캡쳐한다는 말이다.
            ///self는 무엇인가?Struct Value Type이다.주소를 캡쳐하는것이 아닌 값 자체를 캡쳐한다.
            ///'wait'출력
            //print(self.serverState)
            ///현재 관점 끝------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        })
    }
}*/
enum ServerState{
    case wait
    case run
}

struct UrlToServer{
    var url:String
}
let userProperty = Person(Name: "user") //Reference Type
var urlProperty = UrlToServer(url:"Naver") //Static Type
///처음 -> 매개변수 이냐 지역변수이냐에 따라서 클로저의 시점이 달라진다
///현재 -> 클로저의 시점은 달라지지 않는다 다만,Value Type 이냐 Reference Type이냐 그뿐(캡쳐리스트에 어떤 타입의 캡쳐를 할 것인지).클로저의 시점은 항상 생성될 때이다.

///처음 관점 시작------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
///case 1
///매개변수의 Closure Capture 시점
//ServerManager.manager.serverWithPerson(url: urlProperty, person: userProperty) //->실행시점에 urlProperty의 url은 "Naver"
//urlProperty.url = "Daum" //->실행 직후 Closure가 실행되기 전에 urlProperty의 url 값을 "Daum"으로 변경
///실행결과 UrlToServer(url: "Naver")

///case 2
///전역변수의 Closure Capture 시점
//ServerManager.manager.serverWithPerson(url: urlProperty, person: userProperty)//->실행시점에 serverState는 .wait
//ServerManager.manager.serverState = .run//->실행 직후 Closure가 실행되가 전에 serverState를 .run으로 변경
///실행결과 'run'
///case 1,2 모두 클로저가 실행되기전에 참조하는 값을 변경하였다. case 1은 변경전의 값을 캡쳐 했고 case 2는 변경후의 값을 캡쳐했다.
///case 1(지역변수)는 클로저가 생성될때 값을 캡쳐한다.
///case 2(전역변수)는 클로저가 실행될때 값을 캡쳐한다.

///case 3
///매개변수의 Closure Capture 시점
//ServerManager.manager.serverWithPerson(url: urlProperty, person: userProperty)//->실행시점에 userProperty.name = "user"
//userProperty.name = "root"//->실행 직후 Closure가 실행되가 전에 userProperty.name을 root로 변경
///실행결과 'root'
///매개변수이나 전역변수처럼 값이 변했다->매개변수여서 클로저가 생성될 때에 person이 캡쳐가 된다.그러나 person은 Reference Type이기때문에 값 자체가 아닌 주소를 캡쳐했다.
///따라서 클로저가 생성될때 캡쳐했더라도 캡쳐된 주소의 name 값이 변하니 출력값은 변하게 된다.
///처음 관점 끝------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





///현재 관점 시작------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
///이는 위에 클로저를 생성하는 부분을 집중해야한다.
ServerManager.manager.serverWithPerson(url: urlProperty, person: userProperty)//->Closure Capture 시점에 serverState는 .wait
ServerManager.manager.serverState = .run//Closure가 실행되기 전에 serverState를 'run'으로 바꾼다.
///현재 관점 끝------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------







//Strong Reference Cycles for Closures
/*class HTMLElement {
 let name: String
 let text: String?
 lazy var asHTML: () -> String = {
 [weak self] in
 guard let self = self else{
 return "none"
 }
 if let text = self.text {
 return "<\(self.name)>\(text)</\(self.name)>"
 } else {
 return "<\(self.name) />"
 }
 }
 init(name: String, text: String? = nil) {
 self.name = name
 self.text = text
 }
 deinit {
 print("\(name) is being deinitialized")
 }
 }
 var test:HTMLElement? = HTMLElement(name: "admin")
 //test?.asHTML() -> 실행시키지않으면 참조는 이뤄 지지 않는다 왜? lazy 키워드는 사용될 때 초기화 되기 때문이다.즉 asHTML()을 하지않으면 클로저도 생성이 되지 않는다-> self가 캡쳐가 되지않는다.
 test = nil*/

//중첩클로저

func beforeClosure(name:String,beforeCompletion:@escaping ()->Void){
    print("beforeTask Start")
    //print(beforeCompletion)
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(Int(2.0))) {
        //Server에서 값을 받는다는 가정 값을 받기까지 2.0초 걸린다.
        print("beforeTask Complete")
        //print(beforeCompletion)
        afterClosure(afterClosure: {
            (name) in
            beforeCompletion()
        })
        
      
    }
}
func afterClosure(afterClosure:@escaping (_ remainName:String)->Void){
    print("afterTask Start")
   // print(afterClosure)
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(Int(2.0))) {
        //Server에서 값을 받는다는 가정 값을 받기까지 2.0초 걸린다.
        print("afterTask Complete")
        //print(afterClosure)
        afterClosure("hello")
      
    }
}



