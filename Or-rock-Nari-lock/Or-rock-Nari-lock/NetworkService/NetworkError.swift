//
//  NetworkError.swift
//  Or-rock-Nari-lock
//
//  Created by 황지웅 on 2/15/24.
//

import Foundation

enum NetworkError: Error {
    case apiFail
    case urlRequestError
    case serverError

    var description: String {
        switch self {
        case .apiFail:
            return "API호출에 실패했습니다."
        case .urlRequestError:
            return "잘못된 URLRequest입니다."
        case .serverError:
            return "서버가 응답하지 않습니다."
        }
    }
}
