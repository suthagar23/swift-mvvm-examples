//
//  viewModel.swift
//  MVVM-Try-Login
//
//  Created by Kailayapathy Suthagar on 4/1/19.
//  Copyright © 2019 Kailayapathy Suthagar. All rights reserved.
//

import Foundation

struct textConcatViewModel {
    
    var model = textFieldModel()
    
    var valueA = Dynamic<String>("") {
        didSet {
            model.valueA = self.valueA.value
        }
    }
    var valueB = Dynamic<String>("") {
        didSet {
            model.valueB = self.valueB.value
        }
    }
    
    var outputText = Dynamic<String>("")
    var outputLargeText = Dynamic<String>("")
    
    
    mutating func updateTextFields(a textFieldA: String, b textFieldB: String) {
        valueA = Dynamic<String>(textFieldA)
        valueB = Dynamic<String>(textFieldB)
        updateOutput()
        updateOutputLarge()
    }
    
    mutating func updateOutput() {
        outputText = Dynamic<String>(model.valueA + " - " + model.valueB)
    }
    
    mutating func updateOutputLarge() {
        outputLargeText = Dynamic<String>(model.valueB.capitalized + " $ " + model.valueA.capitalized)
    }
}
