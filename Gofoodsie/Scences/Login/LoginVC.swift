//
//  LoginVC.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var phonecodeBtn: UIButton!
    @IBOutlet weak var loginFormView: UIStackView!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var selectedCountry: CountryCode?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.shared.getCountryCodesRequest{ response in
            countriesCodesList = response.data ?? []
            if countriesCodesList.count > 0 {
                self.selectedCountry = countriesCodesList[0]
                self.phonecodeBtn.setTitle(self.selectedCountry?.flag, for: .normal)
            }
        }
        
        loginFormView.isHidden = true
    }
    
    @IBAction func phoneCode(_ sender: Any) {
        var optionsArray: [String] = []
        for country in countriesCodesList {
            optionsArray.append(country.flag ?? "")
        }
        
        let alert = UIAlertController(style: .actionSheet, title: title, message: "")
        let pickerViewSelectedValue: [PickerViewViewController.Index] = [(column: 0, row:0)]
        alert.addPickerView(values: [optionsArray], initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            DispatchQueue.main.async {
                self.selectedCountry = countriesCodesList[picker.selectedRow(inComponent: 0)]
                self.phonecodeBtn.setTitle(self.selectedCountry?.flag, for: .normal)
            }
        }
        
        alert.addAction(title: "تراجع", style: .cancel)
        alert.show()
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        
    }
    
    @IBAction func login(_ sender: Any) {
        if loginFormView.isHidden {
            loginFormView.isHidden = false
        } else {
            validateLoginForm()
        }
    }
    
    func validateLoginForm() {
        if phoneTextField.text == "" || passwordTextField.text == "" {
            general.showAlertDialog("","يرجى إدخال بيانات الدخول")
            return;
        }
        
        loginRequest(phoneTextField.text ?? "", passwordTextField.text ?? "");
    }
    
    func loginRequest(_ phone: String, _ password: String){
        let postParams: [String: Any] = [
            "phone": phone,
            "country_code_lookup_id": selectedCountry?.id ?? 0,
            "password": password
        ]

        API.shared.loginRequest(postParams){ response in
            if response.status_code == 200 {
                self.goToHome()
            } else if response.status_code == 600 {
                general.showAlertDialog("خطأ",response.data?.validation_errors?[0].error ?? "")
            }  else if response.status_code == 601 {
                general.showAlertDialog("خطأ",response.data?.message ?? "")
            }
        }
    }
    
    func goToHome(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.switchRootViewController(vc, UIView.AnimationOptions.transitionFlipFromRight)
    }
    
    @IBAction func facebook(_ sender: Any) {
        
    }
    
    @IBAction func createAccount(_ sender: Any) {
        
    }
    
    @IBAction func home(_ sender: Any) {
        loginRequest("1122334455", "Qweasd123");
    }
}

