//
//  VPMOTPTextField.swift
//  VPMOTPView
//
//  Created by Varun P M on 14/12/16.
//  Copyright © 2016 Varun P M. All rights reserved.
//

import UIKit

class VPMOTPTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initalizeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initalizeUI()
    }
    
    fileprivate func initalizeUI() {
        layer.cornerRadius = bounds.size.width / 2
        layer.borderColor = UIColor.red.cgColor
        layer.borderWidth = 2
        
        autocorrectionType = .no
        textAlignment = .center
    }
}
