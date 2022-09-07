//
//  Network.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import Foundation
import Alamofire

final class Network {
    static func getApiRequest<T:Decodable>(baseRequest:BaseRequest,responseType:T.Type,successHandler:@escaping (T)->(),errorHandler:@escaping (String)->()){
        AF.request(baseRequest.getApiUrl()).responseDecodable(of: responseType){ res in
            switch res.result {
            case .success(let res):
                successHandler(res)
            case .failure(let err):
                errorHandler(err.localizedDescription)
            }
        }
    }
}
