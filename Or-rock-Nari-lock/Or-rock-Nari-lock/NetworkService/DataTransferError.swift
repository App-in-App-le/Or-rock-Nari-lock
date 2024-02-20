//
//  DataTransferError.swift
//  Or-rock-Nari-lock
//
//  Created by 황지웅 on 2/17/24.
//

import Foundation

enum DataTransferError: Error {
    case noResponse
    case parsing(Error)
    case networkFailure(NetworkError)
    case resolvedNetworkFailure(Error)
}
