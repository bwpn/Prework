//
//  ViewController.swift
//  Prework
//
//  Created by Brandon Tran on 8/20/21.
//

import UIKit

let defaults = UserDefaults.standard

class ViewController: UIViewController {
    
    // Required
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    // Bonus
    @IBOutlet weak var splittingTextField: UITextField!
    @IBOutlet weak var splittingAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.becomeFirstResponder()
        billAmountTextField.keyboardType = UIKeyboardType.numberPad
        splittingTextField.keyboardType = UIKeyboardType.numberPad
        configureCalculateButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        billAmountTextField.becomeFirstResponder()
        tipPercentageTextField.text = defaults.string(forKey: "default tip")
        billAmountTextField.keyboardType = UIKeyboardType.numberPad
        tipPercentageTextField.keyboardType = UIKeyboardType.numberPad
        splittingTextField.keyboardType = UIKeyboardType.numberPad
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Quick tip
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Get amount for each person when splitting
        var splittingAmongAmount = total / (Double(splittingTextField.text!) ?? 1.0)
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update total amount
        totalLabel.text = String(format: "$%.2f", total)
        
        // Update splitting amount label
        splittingAmountLabel.text = String(format: "$%.2f", splittingAmongAmount)
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        // Deselect segmented control
        tipControl.selectedSegmentIndex = UISegmentedControl.noSegment
        
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Custom tip
        let tip = bill * (Double(tipPercentageTextField.text!) ?? 0) * 0.01
        let total = bill + tip
        
        // Get amount for each person when splitting
        var splittingAmongAmount = total / (Double(splittingTextField.text!) ?? 1.0)
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update total amount
        totalLabel.text = String(format: "$%.2f", total)
        
        // Update splitting amount label
        splittingAmountLabel.text = String(format: "$%.2f", splittingAmongAmount)
    }
    
    func configureCalculateButton() {
        calculateButton.layer.cornerRadius = 10
    }
    
}
