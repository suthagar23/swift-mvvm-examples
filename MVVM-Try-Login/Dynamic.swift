//
//  DynamicString.swift
//  MVVM-Try-Login
//
//  Created by Kailayapathy Suthagar on 4/2/19.
//  Copyright © 2019 Kailayapathy Suthagar. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind(listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
