//
//  EndPoint.swift
//  Or-rock-Nari-lock
//
//  Created by 황지웅 on 2/16/24.
//

import Foundation


final class EndPoint<R>: ResponseRequestable {

    typealias Response = R

    var baseURL: String
    var path: String
    var method: HTTPMethod
    var queryParameters: Encodable?
    var bodyParameters: Encodable?
    var headers: [String: String]?
    let responseDecoder: ResponseDecoder

    init(baseURL: String = "https://openapivts.koreainvestment.com:29443",
         path: String,
         method: HTTPMethod,
         queryParameters: Encodable? = nil,
         bodyParameters: Encodable? = nil,
         headers: [String: String]? = ["Content-Type": "application/json"],
         responseDecoder: ResponseDecoder = JSONResponseDecoder()
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
        self.headers = headers
        self.responseDecoder = responseDecoder
    }
}
