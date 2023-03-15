//
//  ViewController.swift
//  FindTheCousins
//
//  Created by Raul de Medeiros on 15/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: Variables
    
    private var lockButton : Bool = false {
        didSet {
            if lockButton {
                findButton.isEnabled = true
                findButton.backgroundColor = .systemBlue
            } else {
                findButton.isEnabled = false
                findButton.backgroundColor = .systemGray4
            }
        }
    }
    
    //MARK: Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.textColor = .systemBlue
        label.text = Constants.Intl.titleChallenge
        return label
    }()
    
    private let descriptionChallengeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .systemCyan
        label.text = Constants.Intl.descriptionChallenge
        return label
    }()
    
    lazy var findButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Find Cousins", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.addAction(UIAction(handler: { UIAction in
            self.didFindTapped()
        }), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let inputNumberTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray4
        textField.attributedPlaceholder = NSAttributedString(string: "systemBlue", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemCyan])
        textField.placeholder = Constants.Intl.exampleInput
        textField.keyboardType = .decimalPad
        textField.textAlignment = .center
        textField.textColor = .systemCyan
        textField.layer.cornerRadius = 18
        return textField
    }()
    
    //MARK: LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configParentView()
        initialConfig()
        setupTextFieldDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inputNumberTextField.text = ""
    }
    //MARK: Config Methods
    
    private func initialConfig() {
        lockButton = false
    }
    
    private func configParentView() {
        view.backgroundColor = .white
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionChallengeLabel)
        view.addSubview(inputNumberTextField)
        view.addSubview(findButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionChallengeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionChallengeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionChallengeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            inputNumberTextField.topAnchor.constraint(equalTo: descriptionChallengeLabel.bottomAnchor, constant: 65),
            inputNumberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputNumberTextField.widthAnchor.constraint(equalToConstant: 60),
            inputNumberTextField.heightAnchor.constraint(equalToConstant: 36),
            
            findButton.topAnchor.constraint(equalTo: inputNumberTextField.bottomAnchor, constant: 40),
            findButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            findButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
        ])
    }
    
    
    private func setupTextFieldDelegate(delegate : UITextFieldDelegate) {
        inputNumberTextField.delegate = delegate
    }
    
    //MARK: Methods
    
    private func didFindTapped() {
        let resultController = ResultViewController()
        guard let numString = inputNumberTextField.text else {return}
        resultController.listNumbers = FindTheCousins.findPrimes(number: numString)
        navigationController?.pushViewController(resultController, animated: true)
    }
}

extension HomeViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count ?? 0 > 0 {
            lockButton = true
        } else {
            lockButton = false
        }
    }
}

