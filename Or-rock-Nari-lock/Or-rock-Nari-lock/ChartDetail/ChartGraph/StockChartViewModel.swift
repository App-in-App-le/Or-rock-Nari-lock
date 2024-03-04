//
//  StockChartViewModel.swift
//  Or-rock-Nari-lock
//
//  Created by 박동재 on 2/29/24.
//

import Foundation

protocol StockChartViewModelProtocol {
    var chartDataSetVMs: [ChartDataSetVM] { get set }
}

final class StockChartViewModel: StockChartViewModelProtocol {
    public var chartDataSetVMs: [ChartDataSetVM]

    init(chartDataSetVMs: [ChartDataSetVM]) {
        self.chartDataSetVMs = chartDataSetVMs
    }
}
