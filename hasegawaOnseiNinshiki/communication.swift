//
//  communication.swift
//  hasegawaOnseiNinshiki
//
//  Created by Yousuke Hasegawa on 2021/11/09.
//

import Alamofire
import Foundation

class Communication{
    var component = URLComponents()
    let scheme = "http"
    let host = "192.168.2.108"
    let port = 8000
    var id = "id"
    var postText = "データなし"
    
    
    func postData(_ savedText:String){
        component.scheme = scheme
        component.host = host
        component.port = port
        component.path = "/api/token/"
        guard let url = component.url else {
            return
        }
        postText = savedText
        
        
        let headers: HTTPHeaders = [
            "Content-type": "application/json"
        ]
        
        let parameters = [
            "id": id,
            "text": postText
        ]
        
        print(parameters)
        
        AF.request(url,
        method: .post,
        parameters: parameters,
        encoding: JSONEncoding.default, headers: headers)
        .responseJSON { response in
            if (response.value as? [String: Any]) != nil {
                if (response.response?.statusCode) != nil {
//                    self.islogin = true
//                    UserDefaults.standard.set(self.islogin, forKey: "islogin")
//                    self.token = (result["access"] as? String ?? "")
//                    UserDefaults.standard.set(self.token, forKey: "token")
//                    print(self.token)
                }else{
                    print("error occurred")
                }
            }
        }
    }
}
