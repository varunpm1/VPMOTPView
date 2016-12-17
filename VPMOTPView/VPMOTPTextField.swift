//
//  VPMOTPTextField.swift
//  VPMOTPView
//
//  Created by Varun P M on 14/12/16.
//  Copyright © 2016 Varun P M. All rights reserved.
//

import UIKit

class VPMOTPTextField: UITextField {
    /// Border color info for field
    var borderColor: UIColor = UIColor.black
    
    /// Border width info for field
    var borderWidth: CGFloat = 2
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initalizeUI(forFieldType type: VPMOTPView.DisplayType) {
        switch type {
        case .circular:
            layer.cornerRadius = bounds.size.width / 2
        case .square:
            layer.cornerRadius = 0
        }
        
        // Basic UI setup
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        autocorrectionType = .no
        textAlignment = .center
    }
}
