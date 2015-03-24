//
//  ViewController.swift
//  week6
//
//  Created by John Griffiths on 2015-03-24.
//  Copyright (c) 2015 John Griffiths. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayTimeLabel: UILabel!
    
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordConfirmText: UITextField!
    
    @IBAction func signupAction(sender: UIButton) {
        var usernameCount = usernameText.text.utf16Count
        var passwordCount = passwordText.text.utf16Count
        var passwordConfirmCount = passwordConfirmText.text.utf16Count
        var validationPassed: Bool = true
        
        if passwordText.text != passwordConfirmText.text {
            signupLabel.text = "Passwords do not match."
            validationPassed = false
        }
        
        if usernameCount <= 6 {
            signupLabel.text = "Username needs to be above 6 characters."
            validationPassed = false
        }
        if passwordCount <= 6 {
            signupLabel.text = "password needs to be above 6 characters."
            validationPassed = false
        }
        if passwordConfirmCount <= 6 {
            signupLabel.text = "confirm password needs to be above 6 characters."
            validationPassed = false
        }
        
        if validationPassed {
            signupLabel.text = "Excellent, validation passed!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        displayTimeLabel.text = "00:00:00"
        signupLabel.text = "Please fill in this here form."
        
        //let cSelector : Selector = "reset:"
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: "swipeRight")
        rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
        view.addGestureRecognizer(rightSwipe)

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: "swipeLeft")
        leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
        view.addGestureRecognizer(leftSwipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func swipeRight() {
        displayTimeLabel.text = "Swipe to the Right!"
    }

    func swipeLeft() {
        displayTimeLabel.text = "Swipe to the Left!"
    }
    
}

