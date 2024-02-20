//
//  ViewController.swift
//  Or-rock-Nari-lock
//
//  Created by 박동재 on 2/13/24.
//

import UIKit

class ViewController: UIViewController {
    // Test
    // private let backgroundQueue: DataTransferDispatchQueue = DispatchQueue.global(qos: .userInitiated)

    override func viewDidLoad() {
        super.viewDidLoad()
        /* Test Code
        let dataTransfer: DataTransfer = APIDataTransfer()
        let endPoint: EndPoint<StockDTO> = EndPoint<StockDTO>(path: "/uapi/domestic-stock/v1/quotations/inquire-price", method: .GET)
        dataTransfer.request(with: endPoint, on: backgroundQueue) { result in
            switch result {
            case .success(let responseDTO):
                print(responseDTO)
            case .failure(let error):
                print(error)
            }
        }
         */
    }


}

