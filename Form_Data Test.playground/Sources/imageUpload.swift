import Foundation


public class imageUpload{
    let url:URL
    let data:Data
    public init(url:URL,image:Data) {
        self.url = url
        data = image
    }
    
    private func convertFormField(named name:String,value:String,using boundary: String)->String{
        var fieldString = "--\(boundary)\r\n"
        fieldString += "Content-Disposition:form-data;name=\"\(name)\"\r\n"
        fieldString += "\r\n"
        fieldString += "\(value)\r\n"
        return fieldString
    }
    private func convertFileData(fieldName:String,fileName:String,mimeType:String,fileData:Data,using boundary:String)->Data{
        let data = NSMutableData()
        
        data.appendString("--\(boundary)\r\n")
        data.appendString("Content-Disposition:form-data;name=\"\(fieldName)\";filename=\"\(fileName)\"\r\n")
        data.appendString("Content-Type:\(mimeType)\r\n\r\n")
        data.append(fileData)
        data.appendString("\r\n")
        
        return data as Data
    }
   public func sessionResume(){
  
       let boundary = "Boundary-\(UUID().uuidString)"
       var request:URLRequest{
           var requ = URLRequest(url: url)
           requ.httpMethod = "POST"
           requ.setValue("gwangbini", forHTTPHeaderField: "id")
           requ.setValue("multipart/form-data;boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
           let httpBody = NSMutableData()
           print(httpBody)
           let formField = ["name":"hihi"]
           for (key,value) in formField{
               httpBody.appendString(convertFormField(named: key, value: value, using: boundary))
           }
           httpBody.append(convertFileData(fieldName: "img", fileName: "Logo", mimeType: "image/png", fileData: self.data, using: boundary))
           httpBody.appendString("--\(boundary)--")
           requ.httpBody = httpBody as Data
           return requ
       }
       URLSession.shared.dataTask(with: request){
           (data,res,err) in
           guard let responseData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) else{
               
               return
           }
           print(responseData)
       }.resume()
       
       
//       do{
//           let test = try testThrow(number: 50)
//       }catch{
//           print(error)
//       }

    }
    private func testThrow(number:Int)throws{
        guard number>100 else{
            throw TypeError.testError
            /*throw NSError()file:///Users/ahn/Desktop/Form_Data%20Test.playground: error: Playground execution aborted: error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
                            The process has been left at the point where it was interrupted, use "thread return -x" to return to the state before expression evaluation.

                            */
            
        }
    }
}
extension NSMutableData{
    func appendString(_ string:String){
        if let data = string.data(using: .utf8){
            self.append(data)
        }
    }
}
enum TypeError:Error{
    case testError
}
