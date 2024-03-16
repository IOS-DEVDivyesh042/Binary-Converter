import UIKit

class XORcalculator: UIViewController {

    private let binaryTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Binary"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.backgroundColor = .yellow
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let complementButton: UIButton = {
        let button = UIButton()
        button.setTitle("Two's Complement", for: .normal)
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

        view.addSubview(binaryTextField)
        view.addSubview(complementButton)
        view.addSubview(resultLabel)
        
        complementButton.addTarget(self, action: #selector(calculateTwosComplement), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            binaryTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            binaryTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            binaryTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            binaryTextField.heightAnchor.constraint(equalToConstant: 100),
            
            complementButton.topAnchor.constraint(equalTo: binaryTextField.bottomAnchor, constant: 20),
            complementButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            complementButton.widthAnchor.constraint(equalToConstant: 200),
            complementButton.heightAnchor.constraint(equalToConstant: 140),
            
            resultLabel.topAnchor.constraint(equalTo: complementButton.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc private func calculateTwosComplement() {
        guard let binaryText = binaryTextField.text, !binaryText.isEmpty,
              let binaryNumber = Int(binaryText, radix: 2) else {
            resultLabel.text = "Invalid Binary Number"
            return
        }

        let twosComplement = ~binaryNumber + 1
        resultLabel.text = "Two's Complement: \(String(twosComplement, radix: 2))"
    }
}
