//
//  ViewController.swift
//  NameApp
//
//  Created by 鄭羽辰 on 2019/1/14.
//  Copyright © 2019 鄭羽辰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFoeld: UITextField!
    @IBOutlet weak var wrongPasswordLabel: UILabel!
    @IBOutlet weak var wrongEmailLabel: UILabel!
    @IBAction func confirmButton(_ sender: UIButton) {
        wrongPasswordLabel.isHidden = true
        wrongEmailLabel.isHidden = true
        
        if nameTextField.text == "" || phoneTextField.text == "" || passwordTextFoeld.text == "" || emailTextField.text == ""{
            let emptyAlert = UIAlertController(title: "Wrong Input", message: "No empty", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            emptyAlert.addAction(okAction)
            present(emptyAlert, animated: true)
        }else if let inputName = nameTextField.text, let inputPassword = passwordTextFoeld.text, let inputPhone = phoneTextField.text, let inputEmail = emailTextField.text{
                if inputName == "Andy" && inputPassword == "666666" && inputEmail == "xxx@gmail.com" && inputPhone == "123456789"{
                    performSegue(withIdentifier: "toSecondPage", sender: Any?.self)
                }else{
                    let myAlert = UIAlertController(title: "Wrong Input", message: "Please Try Again", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    myAlert.addAction(okAction)
                    present(myAlert, animated: true)
                    if isValidEmail(email: inputEmail) == false{
                        print("not valid email")
                        wrongEmailLabel.isHidden = false
                    }
                    checkPassword(password: inputPassword)
                }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }
        func viewWillAppear(){
            super.viewWillAppear(true)
            becomeFirstResponder()
        }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondPage"{
            if let SecondVC = segue.destination as? SecondPageViewController{
                SecondVC.nameFromViewOne = nameTextField.text
                SecondVC.phoneFromViewOne = phoneTextField.text
                SecondVC.emailFromViewOne = emailTextField.text
                SecondVC.passwordFromViewOne = passwordTextFoeld.text
            }
        }
    }
    func checkPassword(password:String){
        if password.characters.count < 6 || password.characters.count > 12{
            print("password is not a valid format")
            wrongPasswordLabel.isHidden = false
            
        }
    }

    func isValidEmail(email:String) -> Bool{
        let emailRegEx = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with:email)
        
    }
}

