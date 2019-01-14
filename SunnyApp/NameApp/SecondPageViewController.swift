//
//  SecondPageViewController.swift
//  NameApp
//
//  Created by 鄭羽辰 on 2019/1/14.
//  Copyright © 2019 鄭羽辰. All rights reserved.
//

import UIKit

class SecondPageViewController: UIViewController {

    var nameFromViewOne:String?
    var passwordFromViewOne:String?
    var phoneFromViewOne:String?
    var emailFromViewOne:String?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameFromViewOne
        passwordLabel.text = passwordFromViewOne
        phoneLabel.text = phoneFromViewOne
        emailLabel.text = emailFromViewOne
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
