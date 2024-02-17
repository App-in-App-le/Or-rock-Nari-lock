//
//  DataTransferQueue.swift
//  Or-rock-Nari-lock
//
//  Created by 황지웅 on 2/17/24.
//

import Foundation

protocol DataTransferDispatchQueue {
    func asyncExecute(work: @escaping () -> Void)
}

extension DispatchQueue: DataTransferDispatchQueue {
    func asyncExecute(work: @escaping () -> Void) {
        async(group: nil, execute: work)
    }
}
