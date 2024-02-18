//
//  StockDTO.swift
//  Or-rock-Nari-lock
//
//  Created by 박동재 on 2/18/24.
//

import Foundation

struct StockDTO: Decodable {
    let output: [String: String]?
    let rtCD, msgCD, msg1: String
    enum CodingKeys: String, CodingKey {
        case output
        case rtCD = "rt_cd"
        case msgCD = "msg_cd"
        case msg1
    }
}
