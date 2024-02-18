//
//  EndPoint.swift
//  Or-rock-Nari-lock
//
//  Created by 박동재 on 2/18/24.
//

import Foundation

final class EndPoint<R>: Requestable&Responsable {
    typealias Response = R
    
    var baseURL: String
    var path: String
    var method: HTTPMethod
    var queryParameters: Encodable?
    var bodyParameters: Encodable?
    var headers: [String : String]?
    
    init(baseURL: String = "https://openapivts.koreainvestment.com:29443",
         path: String,
         method: HTTPMethod,
         queryParameters: Encodable? = nil,
         bodyParameters: Encodable? = nil,
         headers: [String : String]? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
        self.headers = headers
    }
    
}
