//
//  CalculateViewController.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/13.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var tempLabel: UILabel!
    
    let viewModel = CalculateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.addTarget(self, action: #selector(changedFirstTextField), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(changedSecondTextField), for: .editingChanged)

        viewModel.firstNumber.bind { number in
            self.firstTextField.text = number
        }
        
        viewModel.secondNumber.bind { number in
            self.secondTextField.text = number
        }
        
        viewModel.resultText.bind { text in
            self.resultLabel.text = text
        }
        
        viewModel.tempText.bind { text in
            self.tempLabel.text = text
        }
    }
    
    @objc func changedFirstTextField() {
        viewModel.firstNumber.value = firstTextField.text
        viewModel.calculate()
        viewModel.presentNumberFormat()
    }
    
    @objc func changedSecondTextField() {
        viewModel.secondNumber.value = secondTextField.text
        viewModel.calculate()
    }
}
