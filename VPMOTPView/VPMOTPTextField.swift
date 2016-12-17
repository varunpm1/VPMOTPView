//
//  VPMOTPTextField.swift
//  VPMOTPView
//
//  Created by Varun P M on 14/12/16.
//  Copyright © 2016 Varun P M. All rights reserved.
//

import UIKit

class VPMOTPTextField: UITextField {
    /// Border color and width info for field
    var borderColor: UIColor = UIColor.black
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
    
    func initalizeUI() {
        // Basic UI setup
        layer.cornerRadius = bounds.size.width / 2
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        
        autocorrectionType = .no
        textAlignment = .center
    }
}
