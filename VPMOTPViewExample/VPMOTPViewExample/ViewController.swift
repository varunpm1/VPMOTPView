//
//  ViewController.swift
//  VPMOTPView
//
//  Created by Varun P M on 14/12/16.
//  Copyright © 2016 Varun P M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var otpView: VPMOTPView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        otpView.otpFieldsCount = 5
        otpView.otpFieldDefaultBorderColor = UIColor.blue
        otpView.otpFieldEnteredBorderColor = UIColor.red
        otpView.otpFieldBorderWidth = 2
        otpView.delegate = self
        
        // Create the UI
        otpView.initalizeUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: VPMOTPViewDelegate {
    func shouldBecomeFirstResponderForOTP(otpFieldIndex index: Int) -> Bool {
        return true
    }
    
    func hasEnteredAllOTP(hasEntered: Bool) {
        print("Has entered all OTP? \(hasEntered)")
    }
    
    func enteredOTP(otpString: String) {
        print("OTPString: \(otpString)")
    }
}
