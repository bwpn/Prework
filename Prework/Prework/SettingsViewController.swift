//
//  SettingsViewController.swift
//  Prework
//
//  Created by Brandon Tran on 8/21/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipTextField.becomeFirstResponder()
        defaultTipTextField.keyboardType = UIKeyboardType.numberPad
        configureCalculateButton()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        // Default tip percentage
        let defaultTipPercentage = (Double(defaultTipTextField.text!) ?? nil)
        defaults.setValue(defaultTipPercentage, forKey: "default tip")
    }
    
    func configureCalculateButton() {
        saveButton.layer.cornerRadius = 10
    }
}
