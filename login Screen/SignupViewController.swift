//
//  SignupViewController.swift
//  login Screen
//
//  Created by Admin on 12/11/22.
//

import UIKit

class SignupViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestuer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecgnizer:)))
       // imageProfile.isUserInteractionEnabled = true -> we can enable it using story board
        imageProfile.addGestureRecognizer(tapGestuer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageProfile.layer.masksToBounds = true
        imageProfile.layer.cornerRadius = imageProfile.frame.height / 2
        
    }
    
    @objc func imageTapped(tapGestureRecgnizer: UITapGestureRecognizer){
        openGallery()
    }
    
      
                                                
                
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    @IBAction func signupButton(_ sender: UIButton) {
        let imageSystem = UIImage(systemName: "person.crop.circle.badge.plus")
        
        if imageProfile.image?.pngData() != imageSystem?.pngData() {
           // profile image selected
            if let email = emailField.text, let password = passwordField.text, let username = userNameField.text, let confpassword = confirmPasswordField.text{
                
                if username == ""{
                    print("please enter user name")
                    openAlert(title: "Alert", message: "Please enter user name", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                }
                else if !email.validateEmailId(){
                    openAlert(title: "Alert", message: "Please enter valid email", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                }else if !password.validatePassword(){
                    
                }else{
                    if confpassword == "" {
                        print("enter password again")
                    }
                    else{
                        if confpassword == password {
                            // Navigation code
                        }else{
                            print("WRONG INPUT")
                        }
                    }
                }
                
            }else{
                print("please fill everything")
            }
        }else{
            openAlert(title: "Alert", message: "Please select profile", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
        }
        
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
   
}

extension SignupViewController{
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UIScreen.main.bounds.height
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tableViewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        
        let conteringInsert = ( tableViewHeight - contentHeight ) / 2.0
        let topInsert = max(conteringInsert, 0.0)
        
        self.tableView.contentInset = UIEdgeInsets(top: topInsert, left: 0.0, bottom: 0.0, right: 0.0)
    }
}

extension SignupViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .savedPhotosAlbum
            present(picker, animated: true )
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageProfile.image = image
        }
        dismiss(animated: true)
    }
}
