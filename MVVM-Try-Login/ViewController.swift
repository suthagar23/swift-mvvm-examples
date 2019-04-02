//
//  ViewController.swift
//  MVVM-Try-Login
//
//  Created by Kailayapathy Suthagar on 4/1/19.
//  Copyright © 2019 Kailayapathy Suthagar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var outputLargeLabel: UILabel!
    @IBOutlet weak var textFieldA: UITextField!
    @IBOutlet weak var textFieldB: UITextField!
    @IBOutlet weak var finalTextFieldA: UITextField!
    @IBOutlet weak var finalTextFieldB: UITextField!
    
    var viewModel = textConcatViewModel() {
        didSet {
            viewModel.outputText.bindAndFire {
                [unowned self] in
                self.outputLabel.text = $0
            }
            viewModel.outputLargeText.bindAndFire {
                [unowned self] in self.outputLargeLabel.text = $0
            }
            viewModel.valueA.bindAndFire {
                [unowned self] in
                self.textFieldA.text = $0
                self.finalTextFieldA.text = $0
            }
            viewModel.valueB.bindAndFire {
                [unowned self] in
                self.textFieldB.text = $0
                self.finalTextFieldB.text = $0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
   
    @IBAction func textFieldOnChange(_ sender: UITextField) {
        viewModel.updateTextFields(a: textFieldA.text!, b: textFieldB.text!)
    }
    

    @IBAction func finalTextFieldOnChange(_ sender: UITextField) {
        viewModel.updateTextFields(a: finalTextFieldA.text!, b: finalTextFieldB.text!)
    }
    
}

