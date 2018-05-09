//
//  ContactUsViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 4/26/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ContactUsViewController: BaseViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    let contactScreenVM : ContactUsScreenViewModel = ContactUsScreenViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contactScreenVM.viewController = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sendButtonPressed(_ sender: Any) {
        
        contactScreenVM.sendContactBusinessRequest()
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

extension ContactUsViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailAddressTextField
        {
            phoneTextField.becomeFirstResponder()
        }
        else if textField == phoneTextField
        {
            messageTextField.becomeFirstResponder()
        }
        else
        {
            textField.resignFirstResponder()
        }
    
        
        return true
    }
}
