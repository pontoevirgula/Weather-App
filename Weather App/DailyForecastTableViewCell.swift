//
//  DailyForecastTableViewCell.swift
//  Weather App
//
//  Created by Carlos Santos on 15/08/25.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell, UIViewFunction {
    
    static let reuseIdentifier = "DailyForecast"

    override init(style: UITableViewCell.CellStyle,reuseIdentifier : String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TER"
        label.textColor = UIColor.contrastColor
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var maxLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "max 28°C"
        label.textColor = UIColor.contrastColor
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var minLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "min 21°C"
        label.textColor = UIColor.contrastColor
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "cloud")
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dayLabel, iconImageView, maxLabel, minLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top:16, leading:16,bottom:16,trailing:16)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            dayLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 50)
        ])
    }
    
    func setupConstraints() {
        stackView.setConstraintsToParent(contentView)
    }
    

}
