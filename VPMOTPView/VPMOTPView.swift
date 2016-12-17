//
//  VPMOTPView.swift
//  VPMOTPView
//
//  Created by Varun P M on 14/12/16.
//  Copyright © 2016 Varun P M. All rights reserved.
//

import UIKit

class VPMOTPView: UIView {
    /// Different input type for OTP fields
    enum KeyboardType: Int {
        case numeric
        case alphabet
        case alphaNumeric
    }
    
    /// Defines the number of otp field needed. Defaults to 4.
    var otpFieldsCount: Int = 4
    
    /// Defines the type of the data that can be entered into otp fields. Defaults to `numeric`
    var otpFieldType: KeyboardType = .numeric
    
    /// Defines the size of otp field. Defaults to `60`.
    var otpFieldSize: CGFloat = 60
    
    /// Space between 2 otp field. Defaults to `16`.
    var otpFieldSeparatorSpace: CGFloat = 16
    
    /// Color to be used for border of the OTP field. Defaults to `black` color.
    var otpFieldBorderColor: UIColor = UIColor.black
    
    /// Border width to be used, if border is needed. Defaults to `2`.
    var otpFieldBorderWidth: CGFloat = 2
    
    /// If set, then editing can be done to intermediate fields even though previous fields are empty. Else editing will take place from last filled text field only. Defaults to `true`.
    var shouldAllowIntermediateEditing: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Public functions
    /// Call this method to create the OTP field view. This method should be called at the last after necessary customization needed. If any property is modified at a later stage is simply ignored.
    func initalizeUI() {
        initalizeOTPFields()
    }
    
    //MARK: Private functions
    // Set up the fields
    fileprivate func initalizeOTPFields() {
        for index in stride(from: 0, to: otpFieldsCount, by: 1) {
            var otpField = viewWithTag(index + 1) as? VPMOTPTextField
            
            if otpField == nil {
                otpField = getOTPField(forIndex: index)
            }
            
            self.addSubview(otpField!)
        }
    }
    
    // Initalize the required OTP fields
    fileprivate func getOTPField(forIndex index: Int) -> VPMOTPTextField {
        let otpField = VPMOTPTextField(frame: CGRect(x: CGFloat(index) * (otpFieldSize + otpFieldSeparatorSpace), y: 0, width: otpFieldSize, height: otpFieldSize))
        otpField.delegate = self
        otpField.tag = index + 1
        
        // Set input type for OTP fields
        switch otpFieldType {
        case .numeric:
            otpField.keyboardType = .numberPad
        case .alphabet:
            otpField.keyboardType = .alphabet
        case .alphaNumeric:
            otpField.keyboardType = .namePhonePad
        }
        
        // Set the border values if needed
        otpField.borderColor = otpFieldBorderColor
        otpField.borderWidth = otpFieldBorderWidth
        
        // Finally create the fields
        otpField.initalizeUI()
        
        return otpField
    }
    
    // Check if previous text fields have been entered or not before textfield can edit the selected field. This will have effect only if
    fileprivate func isPreviousFieldsEntered(forTextField textField: UITextField) -> Bool {
        var isTextFilled = true
        var nextOTPField: UITextField?
        
        // If intermediate editing is not allowed, then check for last filled from the current field in forward direction.
        if !shouldAllowIntermediateEditing {
            for index in stride(from: textField.tag + 1, to: otpFieldsCount + 1, by: 1) {
                let tempNextOTPField = viewWithTag(index) as? UITextField
                
                if let tempNextOTPFieldText = tempNextOTPField?.text, tempNextOTPFieldText.characters.count != 0 {
                    nextOTPField = tempNextOTPField
                }
            }
            
            if let nextOTPField = nextOTPField {
                if nextOTPField != textField {
                    nextOTPField.becomeFirstResponder()
                }
                
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
        
        // Check since only alphabet keyboard is not available in iOS
        if replacedText.characters.count > 0 && otpFieldType == .alphabet && replacedText.rangeOfCharacter(from: .letters) == nil {
            return false
        }
        
        if replacedText.characters.count >= 1 {
            // If field has a text already, then replace the text and move to next field if present
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
            // If deleting the text, then move to previous text field if present
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
