//
//  CustomButton.swift
//  PixelWorld
//
//  Created by Mac on 9/6/25.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var roundedButton : Bool = false {
        didSet {
            if roundedButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundedButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
