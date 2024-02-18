//
//  ViewController.swift
//  Or-rock-Nari-lock
//
//  Created by 박동재 on 2/13/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let session = URLSession.shared
        let provider = APIProvider(session: session)
        
        let endpoint: EndPoint<StockDTO> = EndPoint<StockDTO>(
            path: "/uapi/domestic-stock/v1/quotations/inquire-price", method: .GET
        )
        
        provider.request(with: endpoint) { result in
            switch result {
            case .failure(let error):
                dump(error)
            case .success(let data):
                dump(data)
            }
        }
    }


}

