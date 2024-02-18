//
//  NetworkError.swift
//  Or-rock-Nari-lock
//
//  Created by 박동재 on 2/17/24.
//

import Foundation

enum NetworkError: Error {
    
    case unknownError
    case queryParameterError
    case componentsError
    case urlRequestError
    case serverError
    case emptyData
    case parsingError
    case decodingError
    case badResponse
    
    var errorDescription: String {
        switch self {
        case .unknownError:
            "Unknown Error."
        case .queryParameterError:
            "Query Parameter toDictionary Failed"
        case .componentsError:
            "URL Components Error."
        case .urlRequestError:
            "URL Request Error."
        case .serverError:
            "Server Error."
        case .emptyData:
            "Empty Data."
        case .parsingError:
            "Parsing Error."
        case .decodingError:
            "Decoding Error."
        case .badResponse:
            "Bad Response."
        }
    }
    
}
