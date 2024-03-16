import UIKit

class multiplication: UIViewController {

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
    
    private let multiplyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Multiply", for: .normal)
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
        view.addSubview(multiplyButton)
        view.addSubview(resultLabel)
        
        multiplyButton.addTarget(self, action: #selector(multiplyBinaryNumbers), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            binaryTextField1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            binaryTextField1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            binaryTextField1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            binaryTextField2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            
            binaryTextField1.heightAnchor.constraint(equalToConstant: 50),
            binaryTextField2.heightAnchor.constraint(equalToConstant: 50),
            binaryTextField2.topAnchor.constraint(equalTo: binaryTextField1.bottomAnchor, constant: 20),
            binaryTextField2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            multiplyButton.topAnchor.constraint(equalTo: binaryTextField2.bottomAnchor, constant: 20),
            multiplyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            multiplyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            multiplyButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            resultLabel.topAnchor.constraint(equalTo: multiplyButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc private func multiplyBinaryNumbers() {
        guard let binaryText1 = binaryTextField1.text, !binaryText1.isEmpty,
              let binaryText2 = binaryTextField2.text, !binaryText2.isEmpty,
              let binaryNumber1 = Int(binaryText1, radix: 2),
              let binaryNumber2 = Int(binaryText2, radix: 2) else {
            resultLabel.text = "Invalid Binary Numbers"
            return
        }

        let product = binaryNumber1 * binaryNumber2
        resultLabel.text = "Result: \(String(product, radix: 2))"
    }
}

// Usage: BinaryMultiplicationViewController()
