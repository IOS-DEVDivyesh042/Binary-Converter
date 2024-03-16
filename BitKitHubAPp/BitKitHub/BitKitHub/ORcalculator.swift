import UIKit

class ORcalculator: UIViewController {

    private let binaryTextField1: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Binary"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.backgroundColor = .yellow
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 4
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let binaryTextField2: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Binary"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.backgroundColor = .yellow
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 4
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let orButton: UIButton = {
        let button = UIButton()
        button.setTitle("OR", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .white

        view.addSubview(binaryTextField1)
        view.addSubview(binaryTextField2)
        view.addSubview(orButton)
        view.addSubview(resultLabel)
        
        orButton.addTarget(self, action: #selector(calculateOR), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            binaryTextField1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            binaryTextField1.heightAnchor.constraint(equalToConstant: 100),
            binaryTextField1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            binaryTextField1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            binaryTextField2.heightAnchor.constraint(equalToConstant: 140),
            binaryTextField2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            binaryTextField2.topAnchor.constraint(equalTo: orButton.bottomAnchor, constant: 20),
            binaryTextField2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            orButton.topAnchor.constraint(equalTo: binaryTextField1.bottomAnchor, constant: 20),
            orButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          //  orButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            orButton.widthAnchor.constraint(equalToConstant: 150),
            orButton.heightAnchor.constraint(equalToConstant: 100),
            
            
            resultLabel.topAnchor.constraint(equalTo: binaryTextField2.bottomAnchor, constant: 20),
            
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc private func calculateOR() {
        guard let binaryText1 = binaryTextField1.text, !binaryText1.isEmpty,
              let binaryText2 = binaryTextField2.text, !binaryText2.isEmpty,
              let binaryNumber1 = Int(binaryText1, radix: 2),
              let binaryNumber2 = Int(binaryText2, radix: 2) else {
            resultLabel.text = "Invalid Binary Numbers"
            return
        }

        let orResult = binaryNumber1 | binaryNumber2
        resultLabel.text = "Result: \(String(orResult, radix: 2))"
    }
}

// Usage: BinaryORViewController()
