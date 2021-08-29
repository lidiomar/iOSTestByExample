import UIKit

class ChangePasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    lazy var passwordChanger: PasswordChanging = PasswordChanger()
    var securityToken = ""
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor(red: 55/255.0, green: 147/255.0, blue: 251/255.0, alpha: 1).cgColor
        submitButton.layer.cornerRadius = 0
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
    }
    
    @IBAction private func cancel() {
        oldPasswordTextField.resignFirstResponder()
        newPasswordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        dismiss(animated: true)
    }
    
    @IBAction private func changePassword() {
        if oldPasswordTextField.text?.isEmpty ?? true {
            oldPasswordTextField.becomeFirstResponder()
            return
        }
        
        if newPasswordTextField.text?.isEmpty ?? true {
            let alertController = UIAlertController(title: nil,
                                                    message: "Please enter a new password",
                                                    preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                self?.newPasswordTextField.becomeFirstResponder()
            }
            
            alertController.addAction(okButton)
            alertController.preferredAction = okButton
            self.present(alertController, animated: true)
            return
        }
        
        if newPasswordTextField.text?.count ?? 0 < 6 {
            let alertController = UIAlertController(title: nil,
                                                    message: "The new password should have at least 6 characters",
                                                    preferredStyle: .alert)
            
            let okButton = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                self?.newPasswordTextField.text = ""
                self?.confirmPasswordTextField.text = ""
                self?.newPasswordTextField.becomeFirstResponder()
            }
            
            alertController.addAction(okButton)
            alertController.preferredAction = okButton
            self.present(alertController, animated: true)
            return
        }
        
        if newPasswordTextField.text != confirmPasswordTextField.text {
            let alertController = UIAlertController(title: nil,
                                                    message: "The new password and the confirmation password dont match. Please try again",
                                                    preferredStyle: .alert)
            
            let okButton = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                self?.newPasswordTextField.text = ""
                self?.confirmPasswordTextField.text = ""
                self?.newPasswordTextField.becomeFirstResponder()
            }
            
            alertController.addAction(okButton)
            alertController.preferredAction = okButton
            self.present(alertController, animated: true)
            return
        }
        
        oldPasswordTextField.resignFirstResponder()
        newPasswordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        cancelBarButton.isEnabled = false
        view.backgroundColor = .clear
        view.addSubview(blurView)
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blurView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        activityIndicator.startAnimating()
        
        passwordChanger.change(
            securityToken: securityToken,
            oldPassword: oldPasswordTextField.text ?? "",
            newPassword: newPasswordTextField.text ?? "",
            onSuccess: { [weak self] in
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.removeFromSuperview()
                
                let alertController = UIAlertController(
                    title: nil,
                    message: "Your password has been successfully changed.",
                    preferredStyle: .alert
                )
                
                let okButton = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                    self?.newPasswordTextField.text = ""
                    self?.confirmPasswordTextField.text = ""
                    self?.newPasswordTextField.becomeFirstResponder()
                }
                
                alertController.addAction(okButton)
                alertController.preferredAction = okButton
                self?.present(alertController, animated: true)
                
            },
            onFailure: { [weak self] message in
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.removeFromSuperview()
                
                let alertController = UIAlertController(
                    title: nil,
                    message: "Fail",
                    preferredStyle: .alert
                )
                
                let okButton = UIAlertAction(
                    title: "OK",
                    style: .default) { [weak self] _ in
                    self?.oldPasswordTextField.text = ""
                    self?.newPasswordTextField.text = ""
                    self?.confirmPasswordTextField.text = ""
                    self?.oldPasswordTextField.becomeFirstResponder()
                    self?.view.backgroundColor = .white
                    self?.blurView.removeFromSuperview()
                    self?.cancelBarButton.isEnabled = true
                }
                
                alertController.addAction(okButton)
                alertController.preferredAction = okButton
                self?.present(alertController, animated: true)
            }
        )
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == oldPasswordTextField {
            newPasswordTextField.becomeFirstResponder()
        } else if textField == newPasswordTextField {
            confirmPasswordTextField.becomeFirstResponder()
        } else if textField == confirmPasswordTextField {
            changePassword()
        }
        return true
    }
}
