//
//  Responsable.swift
//  Or-rock-Nari-lock
//
//  Created by 황지웅 on 2/16/24.
//

import Foundation

protocol ResponseRequestable: Requestable {
    associatedtype Response

    var responseDecoder: ResponseDecoder { get }
}
