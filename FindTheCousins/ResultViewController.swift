//
//  ResultViewController.swift
//  FindTheCousins
//
//  Created by Raul de Medeiros on 15/03/23.
//

import UIKit

class ResultViewController: UIViewController {

    var listNumbers : [Int] = []
    
    private let titleResult : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.text = Constants.Intl.resultLabel
        return label
    }()
    
    private let resultDescrioptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.textColor = .systemCyan
        label.textAlignment = .center
        label.text = "The result"
        return label
    }()
    
    lazy var returnButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Return", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.addAction(UIAction(handler: { UIAction in
            self.didReturnTapped()
        }), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupParentView()
        findTheCousins()
    }
    
    private func setupParentView() {
        view.backgroundColor = .white
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        view.addSubview(titleResult)
        view.addSubview(resultDescrioptionLabel)
        view.addSubview(returnButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleResult.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleResult.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleResult.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            resultDescrioptionLabel.topAnchor.constraint(equalTo: titleResult.bottomAnchor, constant: 30),
            resultDescrioptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            resultDescrioptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            returnButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            returnButton.widthAnchor.constraint(equalToConstant: 150),
            returnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func didReturnTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func findTheCousins() {
        resultDescrioptionLabel.text = FindTheCousins.createPhrase(numbers: listNumbers)
    }
}
