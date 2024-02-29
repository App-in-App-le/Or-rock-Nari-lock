//
//  InterestStocksViewModel.swift
//  Or-rock-Nari-lock
//
//  Created by 황지웅 on 2/28/24.
//

import Foundation
import RxSwift

final class InterestStocksViewModel {
    private let loadInterestStocksUseCase: LoadInterestStocksUseCase

    struct Input {
        let viewDidLoadEvent: Observable<Void>
    }

    struct Output {
        let stockNames: [String]
    }

    init(loadInterestStocksUseCase: LoadInterestStocksUseCase = DefaultLoadInterestStocksUseCase()) {
        self.loadInterestStocksUseCase = loadInterestStocksUseCase
    }

    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        let output = createViewModelOutput()
        input.viewDidLoadEvent.subscribe(
            onNext: { [weak self] _ in
                guard let self = self else { return }
            }
        )
        .disposed(by: disposeBag)
        return output
    }
}

private extension InterestStocksViewModel {
    func createViewModelOutput() -> Output {
        let names: [String] = loadInterestStocksUseCase.execute()
        return Output(stockNames: names)
    }
}
