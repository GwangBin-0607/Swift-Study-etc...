import Foundation
/*class Client{
    let service = Service()
    func getService(){service.getCoffee()}
    
    
}
class Service{
    func getCoffee(){}
    
}*/



//Dependency Inversion---------------------------------------



/*class Client{
    let service:ServiceProtocol = Service()
    func getService(){service.getCoffee()}
    
    
}
protocol ServiceProtocol{
    func getCoffee()
}
class Service:ServiceProtocol{
    func getCoffee(){}
    
}*/


//Dependency Injection-------------------------------------
print("start")
DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: UInt64(3.0)), execute: {
    print("complete")
})
print("end")



class Client{
    let service:ServiceProtocol = Service()
    func getService(){service.getCoffee()}
    
    
}
protocol ServiceProtocol{
    func getCoffee()
}
class Service:ServiceProtocol{
    func getCoffee(){}
    
}

let clientProperty = Client()




