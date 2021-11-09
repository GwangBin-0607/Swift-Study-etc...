import Foundation
/*class testOne:NSObject,testProtocol{
    func test() {
        print("test")
    }
    
  let mainProperty = main()
    override init() {
        super.init()
        mainProperty.delegate = self
    }
    
}
protocol testProtocol:NSObject {
    func test() -> Void
}

class main:NSObject{
    weak var delegate:testProtocol?
    weak var test:testOne?
    override init() {
        super.init()
        test = testOne()
        
    }
}*/
/*let test = DispatchQueue(label: "zedd")
let babb = DispatchQueue(label: "asd")

    test.async {
        for i in 0..<500 {
            print(i)
        }
    }
    babb.async {
        for i in 1000..<1100{
            print(i)
        }
    }
    test.async {
        for i in 500..<1000{
            print(i)
        }
        GID.good()
    }


class GID{
    static func good(){
        print("good")
    }
    init() {
        print("========================")
    }
}
GID()*/
func nickname(nickname:String){
    print("server...\(nickname)")
    let url:URL! = URL(string: "https://randombox.site/nicknameCheck")
        var request = URLRequest(url:url)
        request.httpMethod = "POST"

        let json: [String: Any] = ["nickname":nickname]
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do { // request body에 전송할 데이터 넣기
            request.httpBody = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        } catch {
            print(error.localizedDescription)
        }
    let session = URLSession.shared
        session.dataTask(with: request){
            (data,response,error) in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:String]
            
           guard  let status = responseJSON?["result"] else{
                return
            }
            
            print("Server End....\(nickname)")
           
            
        }.resume()
    let mainOper = OperationQueue.main
    print(mainOper)
    print(session.delegateQueue)
}
let customQueue = OperationQueue()
let firstOperation = firstOper()
let secondOperation = secondOper()
let thirdOperation = thirdOper()
let fourthOperation = fourthOper()

thirdOperation.addDependency(fourthOperation)
secondOperation.addDependency(thirdOperation)
firstOperation.addDependency(secondOperation)


customQueue.addOperation(firstOperation)
customQueue.addOperation(secondOperation)
customQueue.addOperation(thirdOperation)
customQueue.addOperation(fourthOperation)
/*DispatchQueue.global().async {
    nickname(nickname: "안팀장")
    nickname(nickname: "안녕")
    nickname(nickname: "브로")
    nickname(nickname: "굿")
}*/
class firstOper:Operation{
    
    override func main() {
        //super.main()
        nickname(nickname: "test1")
        /*for i in 0..<100{
            print(i)
        }*/
    }
}
class secondOper:Operation{
    override func main() {
        nickname(nickname: "test2")
        for i in 100..<200{
            print(i)
        }
    }
}
class thirdOper:Operation{
    override func main() {
        nickname(nickname: "test3")
        /*for i in 200..<300{
            print(i)
        }*/
    }
}
class fourthOper:Operation{
    override func main() {
        nickname(nickname: "test4")
        /*for i in 300..<400{
            print(i)
        }*/
    }
}
