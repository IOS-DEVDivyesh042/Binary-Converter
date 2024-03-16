import UIKit

class NOR: UIViewController {
    
    private let binaryTextField1: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Binary 1"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.backgroundColor = .yellow
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let binaryTextField2: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Binary 2"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.backgroundColor = .yellow
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let norButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate NOR", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
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
        view.addSubview(norButton)
        view.addSubview(resultLabel)
        
        norButton.addTarget(self, action: #selector(calculateNOR), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            binaryTextField1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            binaryTextField1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            binaryTextField1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            binaryTextField1.heightAnchor.constraint(equalToConstant: 100),
            
            binaryTextField2.topAnchor.constraint(equalTo: norButton.bottomAnchor, constant: 20),
            binaryTextField2.leadingAnchor.constraint(equalTo: binaryTextField1.leadingAnchor),
            binaryTextField2.trailingAnchor.constraint(equalTo: binaryTextField1.trailingAnchor),
            binaryTextField2.heightAnchor.constraint(equalToConstant: 140),
            
            norButton.topAnchor.constraint(equalTo: binaryTextField1.bottomAnchor, constant: 20),
            norButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            norButton.widthAnchor.constraint(equalToConstant: 150),
            norButton.heightAnchor.constraint(equalToConstant: 100),
            
            resultLabel.topAnchor.constraint(equalTo: binaryTextField2.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func calculateNOR() {
        guard let binaryText1 = binaryTextField1.text, !binaryText1.isEmpty,
              let binaryText2 = binaryTextField2.text, !binaryText2.isEmpty,
              let binaryNumber1 = Int(binaryText1, radix: 2),
              let binaryNumber2 = Int(binaryText2, radix: 2) else {
            resultLabel.text = "Invalid Binary Numbers"
            return
        }
        
        let norResult = ~(binaryNumber1 | binaryNumber2)
        resultLabel.text = "Result: \(String(norResult, radix: 2))"
    }
}
