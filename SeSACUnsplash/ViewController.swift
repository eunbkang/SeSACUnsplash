//
//  ViewController.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        nicknameTextField.placeholder = NSLocalizedString("nickname_placeholder", comment: "")
        nicknameTextField.placeholder = "nickname_placeholder".localized

//        let value = NSLocalizedString("nickname_result", comment: "")
//        resultLabel.text = String(format: value, "고래밥")
        
        resultLabel.text = "age_result".localized(number: 9)
        
        
        // cmd + ctrl + e
        let searchBarIsGood = UISearchBar()
        searchBarIsGood.text = ""
        searchBarIsGood.placeholder = ""
        searchBarIsGood.showsCancelButton = false
        
        // option + 드래그
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function) // ctrl + shift
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function) // ctrl + shift
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function) // ctrl + shift
    }
}

