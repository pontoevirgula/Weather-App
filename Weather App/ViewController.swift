//
//  ViewController.swift
//  Weather App
//
//  Created by Carlos Santos on 02/08/25.
//

import UIKit

class ViewController: UIViewController {
    
    private let PRIMARY_COLOR_BLUE = "primaryColorBlue"
    private let WHITE_COLOR = "constrastColor"

    private lazy var backgroundView  : UIView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var headerView : UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named:WHITE_COLOR )
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var cityLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(named:PRIMARY_COLOR_BLUE )
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rio de Janeiro"
        return label
    }()
    
    private lazy var temperaturaLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor(named: PRIMARY_COLOR_BLUE)
        label.font = UIFont.systemFont(ofSize: 70, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25ºC"
        return label
    }()
    
    private lazy var weatherIcon : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iconSol")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var humidityLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Umildade"
        label.font = UIFont.systemFont(ofSize:12, weight: .semibold)
        label.textColor = UIColor(named: WHITE_COLOR)
        return label
    }()
    
    private lazy var humidityValueLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1000mm"
        label.font = UIFont.systemFont(ofSize:12, weight: .semibold)
        label.textColor = UIColor(named: WHITE_COLOR)
        return label
    }()
    
    private lazy var humidityStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityLabel, humidityValueLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var humidityLabelWinter : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vento"
        label.font = UIFont.systemFont(ofSize:12, weight: .semibold)
        label.textColor = UIColor(named: WHITE_COLOR)
        return label
    }()
    
    private lazy var humidityValueLabelWinter : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10km/h"
        label.font = UIFont.systemFont(ofSize:12, weight: .semibold)
        label.textColor = UIColor(named: WHITE_COLOR)
        return label
    }()
    
    private lazy var windStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityLabelWinter, humidityValueLabelWinter])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var statsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityStackView, windStackView])
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(named: "softGray")
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top:12, leading:24,bottom:12,trailing:24)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .red
        setHierarchy()
        setupConstraintView()
    }
    
    private func setHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(headerView)
      
        view.addSubview(statsStackView)

        
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperaturaLabel)
        headerView.addSubview(weatherIcon)
  
    }
    
    private func setupConstraintView() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            headerView.heightAnchor.constraint(equalToConstant: 169)
        ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
            cityLabel.heightAnchor.constraint(equalToConstant: 20),
            temperaturaLabel.topAnchor.constraint(equalTo: cityLabel.topAnchor, constant: 21),
            temperaturaLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 26),
            weatherIcon.heightAnchor.constraint(equalToConstant: 86),
            weatherIcon.widthAnchor.constraint(equalToConstant: 86),
            weatherIcon.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -26),
            weatherIcon.centerYAnchor.constraint(equalTo: temperaturaLabel.centerYAnchor),
            weatherIcon.leadingAnchor.constraint(equalTo: temperaturaLabel.trailingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            statsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            statsStackView.widthAnchor.constraint(equalToConstant: 206),
            statsStackView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
        ])
    }

}

