

import UIKit

class LoginViewController: UITableViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
       inputValidation()
    }
    
    @IBAction func signupButton(_ sender: UIButton) {
        if let signup = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController{
            self.navigationController?.pushViewController(signup, animated: true)
        }
    }
    
    }

extension LoginViewController{
    
//   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       return UIScreen.main.bounds.height
//   }
//    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tableViewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        
        let conteringInsert = ( tableViewHeight - contentHeight ) / 2.0
        let topInsert = max(conteringInsert, 0.0)
        
        self.tableView.contentInset = UIEdgeInsets(top: topInsert, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    
    fileprivate func inputValidation(){
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            if email == "" {
                openAlert(title: "Alert", message: "Please Add Email id", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{_ in
                    print("empty text field")
                }])
            }else if password == "" {
                openAlert(title: "Alert", message: "Please Insert password", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{_ in
                    print("empty text field")
                }])
            }
            
            if !email.validateEmailId(){
                openAlert(title: "Alert", message: "Invalid Email id", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{_ in
                    print("invalid email")
                }])
                
            }else if !password.validatePassword(){
                openAlert(title: "Alert", message: "Invalid password", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{_ in
                    print("invalid password")
                }])
                
            }else{
                // navigation -> home screen
                
            }
        }else{
            // when textField is nill
            openAlert(title: "Alert", message: "Please Add details", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{_ in
                print("empty text field")
            }])
            
        }
        
    }
    
    //for dismissing keyboard
    func hideKeyBoardTapArround(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
