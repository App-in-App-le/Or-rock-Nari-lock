//
//  StockInformationCollectionViewCell.swift
//  Or-rock-Nari-lock
//
//  Created by 황지웅 on 2/24/24.
//

import UIKit

final class StockInformationCollectionViewCell: UICollectionViewCell {
    private let stockTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "애플"
        return label
    }()

    private let stockSubTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .systemGray
        label.text = "애플 주식"
        return label
    }()

    private let priceLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "100"
        return label
    }()

    private let changeLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "10"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }

    func setContent(_ stockInformation: StockInformation) {
        stockTitleLabel.text = stockInformation.name
        stockSubTitleLabel.text = stockInformation.engName
        priceLabel.text = String(stockInformation.price)
        setChangeLabel(stockInformation.previousDayVarianceSign)
    }

    private func setChangeLabel(_ previousDayVarianceSign: PreviousDayVarianceSign) {
        switch previousDayVarianceSign {
        case .upperLimit:
            changeLabel.textColor = .green
            changeLabel.text = "+\(changeLabel.text ?? "")"
        case .increase:
            changeLabel.textColor = .blue
            changeLabel.text = "+\(changeLabel.text ?? "")"
        case .noChange:
            changeLabel.textColor = .black
        case .lowerLimit:
            changeLabel.textColor = .yellow
            changeLabel.text = "-\(changeLabel.text ?? "")"
        case .decrease:
            changeLabel.textColor = .red
            changeLabel.text = "-\(changeLabel.text ?? "")"
        }
    }

    private func setUI() {
        stockTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        stockSubTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        changeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stockTitleLabel)
        self.addSubview(stockSubTitleLabel)
        self.addSubview(priceLabel)
        self.addSubview(changeLabel)
        NSLayoutConstraint.activate([
            stockTitleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            stockTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            stockTitleLabel.bottomAnchor.constraint(equalTo: stockSubTitleLabel.topAnchor, constant: -5),

            stockSubTitleLabel.topAnchor.constraint(equalTo: stockTitleLabel.bottomAnchor, constant: 3),
            stockSubTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            stockSubTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),

            priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),

            changeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 0),
            changeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
}

#Preview {
    InterestStocksViewController()
}
