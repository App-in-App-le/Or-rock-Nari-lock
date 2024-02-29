//
//  StockCellViewModel.swift
//  Or-rock-Nari-lock
//
//  Created by 황지웅 on 2/29/24.
//

import Foundation
import RxSwift

final class StockCellViewModel {
    private let checkTodayPriceUseCase: CheckTodayPriceUseCase
    private var checkStockTask: Cancellable? { willSet { checkStockTask?.cancel() } }
    private let mainQueue: DispatchQueueType

    private var todayStockInformation: StockInformation?

    struct Input {
        let cellSetContent: Observable<String>
    }

    struct Output {
        let stockInformation: Observable<StockInformation?>
    }

    init(checkTodayPriceUseCase: CheckTodayPriceUseCase = DefaultCheckTodayPriceUseCase(), mainQueue: DispatchQueueType = DispatchQueue.main) {
        self.checkTodayPriceUseCase = checkTodayPriceUseCase
        self.mainQueue = mainQueue
    }

    func transform(from input: Input) -> Output {
        let stockInformation = input.cellSetContent
                .map { [weak self] stockName -> StockInformation? in
                    self?.checkTodayPrice(stockName: stockName)
                    return self?.todayStockInformation
                }
        return Output(stockInformation: stockInformation)
    }
}

private extension StockCellViewModel {
    func checkTodayPrice(stockName: String) {
        checkStockTask = checkTodayPriceUseCase.execute(stockName: stockName, completion: { [weak self] result in
            self?.mainQueue.async {
                switch result {
                case .success(let stockInformation):
                    self?.todayStockInformation = stockInformation
                case .failure(let error):
                    print(error)
                }
            }
        })
    }
}
