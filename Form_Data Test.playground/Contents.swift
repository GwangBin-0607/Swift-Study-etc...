import UIKit


var greeting = "Hello, playground"

let serverURL = URL(string: "http://localhost:80/home")
let request = URLRequest(url: serverURL!)
let requestConfig = URLSessionConfiguration.default
requestConfig.waitsForConnectivity = true
URLSession(configuration: requestConfig).dataTask(with: request){
    (data,res,err) in
    guard let responseData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) else{
        
        return
    }
    print(responseData)
}.resume()

if let data = UIImage(named:"Group2")?.pngData() {
    print("image Upload")
    let imageServer:imageUpload = imageUpload(url: URL(string: "http://localhost:80/imageupload")!,image:data)
    imageServer.sessionResume()
}

