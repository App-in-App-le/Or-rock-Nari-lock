//
//  NetworkError.swift
//  Or-rock-Nari-lock
//
//  Created by 황지웅 on 2/15/24.
//

import Foundation

enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
    case componentsError

    var isNotFoundError: Bool { return hasStatusCode(404) }

    func hasStatusCode(_ codeError: Int) -> Bool {
        switch self {
        case let .error(code, _):
            return code == codeError
        default: return false
        }
    }
}
