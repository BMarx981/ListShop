//
//  LoginViewController.swift
//  ListShop
//
//  Created by Marx, Brian on 11/24/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailOutlet.text!, password: passwordOutlet.text!,
                           completion: { (user, error) in
                            if error != nil {
                                print("There was an error \(String(describing: error))")
                            } else {
                                print("Login Success!")
                                
                                self.performSegue(withIdentifier: "loginSegue", sender: self)
                            }
            })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
