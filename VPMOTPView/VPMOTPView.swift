//
//  VPMOTPView.swift
//  VPMOTPView
//
//  Created by Varun P M on 14/12/16.
//  Copyright © 2016 Varun P M. All rights reserved.
//

import UIKit

class VPMOTPView: UIView {
    enum KeyboardType: Int {
        case numeric
        case alphabet
        case alphaNumeric
    }
    
    /// Defines the number of otp field needed. Defaults to 4.
    var otpFieldsCount: Int = 4 {
        didSet {
            initalizeOTPFields()
        }
    }
    
    /// Defines the type of the data that can be entered into otp fields. Defaults to `numeric`
    var otpFieldType: KeyboardType = .alphabet
    
    /// Defines the size of otp field. Defaults to 60.
    var otpFieldSize: CGFloat = 60
    
    /// Space between 2 otp field. Defaults to 16.
    var otpFieldSeparatorSpace: CGFloat = 16
    
    /// If set, then editing can be done to intermediate fields. Else editing will take place from last filled text field only. Defaults to `true`.
    var shouldAllowIntermediateEditing: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initalizeOTPFields()
    }
    
    fileprivate func initalizeOTPFields() {
        for index in stride(from: 0, to: otpFieldsCount, by: 1) {
            var otpField = viewWithTag(index + 1) as? UITextField
            
            if otpField == nil {
                otpField = getOTPField(forIndex: index)
            }
            
            switch otpFieldType {
            case .numeric:
                otpField?.keyboardType = .numberPad
            case .alphabet:
                otpField?.keyboardType = .alphabet
            case .alphaNumeric:
                otpField?.keyboardType = .namePhonePad
            }
            
            self.addSubview(otpField!)
        }
    }
    
    fileprivate func getOTPField(forIndex index: Int) -> VPMOTPTextField {
        let otpField = VPMOTPTextField(frame: CGRect(x: CGFloat(index) * (otpFieldSize + otpFieldSeparatorSpace), y: 0, width: otpFieldSize, height: otpFieldSize))
        otpField.delegate = self
        otpField.tag = index + 1
        
        return otpField
    }
    
    fileprivate func isPreviousFieldsEntered(forTextField textField: UITextField) -> Bool {
        var isTextFilled = true
        
        for index in stride(from: textField.tag - 1, to: 0, by: -1) {
            let prevOTPField = viewWithTag(index) as? UITextField
            
            if let prevOTPFieldText = prevOTPField?.text, prevOTPFieldText.characters.count == 0 {
                isTextFilled = false
                
                break
            }
        }
        
        if !shouldAllowIntermediateEditing {
            var nextOTPField: UITextField?
            
            for index in stride(from: textField.tag + 1, to: otpFieldsCount + 1, by: 1) {
                let tempNextOTPField = viewWithTag(index) as? UITextField
                
                if let tempNextOTPFieldText = tempNextOTPField?.text, tempNextOTPFieldText.characters.count != 0 {
                    nextOTPField = tempNextOTPField
                }
            }
            
            if let nextOTPField = nextOTPField {
                nextOTPField.becomeFirstResponder()
                
                isTextFilled = false
            }
        }
        
        return isTextFilled
    }
}

extension VPMOTPView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return isPreviousFieldsEntered(forTextField: textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let replacedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        
        if otpFieldType == .alphabet && replacedText.rangeOfCharacter(from: .letters) == nil {
            return false
        }
        
        if replacedText.characters.count >= 1 {
            textField.text = string
            
            let nextOTPField = viewWithTag(textField.tag + 1)
            
            if let nextOTPField = nextOTPField {
                nextOTPField.becomeFirstResponder()
            }
            else {
                textField.resignFirstResponder()
            }
            
            return false
        }
        else if replacedText.characters.count == 0 {
            textField.text = ""
            
            let prevOTPField = viewWithTag(textField.tag - 1)
            
            if let prevOTPField = prevOTPField {
                prevOTPField.becomeFirstResponder()
            }
            
            return false
        }
        
        return true
    }
}
