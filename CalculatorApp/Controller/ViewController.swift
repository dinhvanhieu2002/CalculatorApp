//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Mac on 8/7/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    private var isFinishTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(outputLbl.text!) else {
                fatalError("Cannot convert output label text to a Double")
            }
            
            return number
        }
        
        set {
            outputLbl.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func numberPressed(_ sender: CustomButton) {
        if let numValue = sender.currentTitle {
            if isFinishTypingNumber {
                outputLbl.text = numValue
                isFinishTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                outputLbl.text = outputLbl.text! + numValue
            }
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: CustomButton) {
        isFinishTypingNumber = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
        
    }


}

