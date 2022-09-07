//
//  BaseRequest.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import Foundation

protocol BaseRequestProtocol {
    var parameter : [String:Any]? {get}
    var httpMethod : HttpMethod {get}
    var baseUrl : String {get}
    var pathExtension : String? {get}
    func getApiUrl()->URL
}

enum HttpMethod {
    case Get,Post,Put,Delete
}

class BaseRequest : BaseRequestProtocol {
    var pathExtension: String?
    var parameter: [String : Any]?
    var httpMethod: HttpMethod
    init(httpMethod:HttpMethod){
        self.httpMethod = httpMethod
    }
}






extension BaseRequestProtocol {
    var baseUrl : String {
        return "https://jsonplaceholder.typicode.com/"
    }
    func getApiUrl()->URL{
        let url : URL! = URL.init(string: baseUrl + (pathExtension ?? ""))
        return url
    }
}
