//
//  SignInViewController.swift
//  LoginScreen
//
//  Created Oleksander on 14.03.2020.
//  Copyright © 2020 Zyma. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SignInViewController: UIViewController, SignInViewProtocol {

	var presenter: SignInPresenterProtocol?

    @IBOutlet weak var keyboardContainerViewHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var loginTextFild: UITextField!
    @IBOutlet weak var passwordTextFild: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var linkTextLabel: UILabel!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var buttonLoadView: UIView!
    @IBOutlet weak var errorTextLabel: UILabel!
    
    var hightCorrectFokusKeyb: CGFloat = 0
    var keyboadHeight: CGFloat = 0

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.clearUser()
        configLinkLabel()
        configTextFild()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigation()
        configLinkLabel()
        configTextFild()
    }
    
    func configTextFild() {
        loginTextFild.layer.borderColor = UIColor.red.cgColor
        passwordTextFild.layer.borderColor = UIColor.red.cgColor
        loginTextFild.layer.borderWidth = 0
        passwordTextFild.layer.borderWidth = 0
        buttonLoadView.isHidden = true
        passwordView.isHidden = true
        errorTextLabel.text = ""
        passwordTextFild.text = ""
        loginTextFild.text = ""
        errorTextLabel.isHidden = true
        registerForKeyboardNotifications()
        passwordTextFild.delegate = self
        loginTextFild.delegate = self
        passwordTextFild.restorationIdentifier = RestorationIdentifierTextField.password.string
        loginTextFild.restorationIdentifier = RestorationIdentifierTextField.login.string
    }
    
    func configNavigation() {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func configLinkLabel() {
        let textForLabelLink = "Sign up!"
        guard let linkURL = URL(string: "http://app.link.com") else { return }
        let attributedTextForLabel = NSMutableAttributedString(string: textForLabelLink, attributes: [NSAttributedString.Key.link: linkURL])
        linkTextLabel.attributedText = attributedTextForLabel
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLinkLabel))
        linkTextLabel.addGestureRecognizer(tap)
        linkTextLabel.isUserInteractionEnabled = true
    }
    
    @objc func tapLinkLabel(gesrure: UITapGestureRecognizer) {
        presenter?.openLink()
    }
    
    // MARK:  set tittle Button Show
    func setTittlePasswordButtonShow() {
        DispatchQueue.main.async {
            self.showPasswordButton.setTitle("🔓", for: .normal)
        }
    }

    // MARK:  set tittle Button Hide
    func setTittlePasswordButtonHide() {
        DispatchQueue.main.async {
            self.showPasswordButton.setTitle("🔒", for: .normal)
        }
    }
  
    // MARK:  click Button Show Password
    @IBAction func clickShowPasswordButton(_ sender: UIButton) {
        passwordTextFild.text = presenter?.changeStatusHidePassword()
    }
    
    // MARK: - finish edit TextField
    @IBAction func editingDidEndTextField(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    // MARK: - change TextField Login
    @IBAction func changedLoginTextField(_ sender: UITextField) {
        guard let login = sender.text else { return }
        presenter?.setLogin(login: login)
    }
    
    // MARK: -  change textField password
    @IBAction func changedPasswordTextField(_ sender: UITextField) {
        guard let passwordNew = sender.text else { return }
        presenter?.setPassword(password: passwordNew)
        guard let passwordShow = presenter?.getPasswordForShow() else { return }
        sender.text = passwordShow
    }
    
    // MARK: - click login Button
    @IBAction func clickLoginButton(_ sender: UIButton) {
        loginTextFild.resignFirstResponder()
        passwordTextFild.resignFirstResponder()
        presenter?.clickLogin()
    }
    
    func switchLoginButton(isHide: Bool, errorText: String) {
        guard let switchview = self.buttonLoadView else { return }
        guard let errorTextFild = self.passwordTextFild else { return }
        switchView(isHide: isHide, view: switchview, errorTextFild: errorTextFild, errorText: errorText)
    }

    func switchPasswordTextFild(isHide: Bool, errorText: String) {
        guard let switchview = self.passwordView  else { return }
        guard let errorTextFild = self.loginTextFild else { return }
        switchView(isHide: isHide, view: switchview, errorTextFild: errorTextFild, errorText: errorText)
    }
    
    func switchView(isHide: Bool, view: UIView, errorTextFild: UITextField, errorText: String) {
        DispatchQueue.main.async {
            if (isHide) {
                if (errorTextFild.text != nil && errorTextFild.text != "") {
                    errorTextFild.layer.borderWidth = 1
                }
                self.errorTextLabel.text = errorText
            }
            else{
                self.loginTextFild.layer.borderWidth = 0
                self.passwordTextFild.layer.borderWidth = 0
            }
            
            if (view.isHidden != isHide) {
                for view in view.subviews {
                    UIView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve, animations: { view.isHidden = isHide })
                }
                UIView.transition(with: view, duration: 0.2, options: .transitionCrossDissolve, animations: { view.isHidden = isHide }) { (result) in
                        if result {
                            self.animatErrorLabel(isHide: isHide, errorText: errorText)
                        }
                    }
            }
            else {
                self.animatErrorLabel(isHide: isHide, errorText: errorText)
            }
        }
    }
    
    func animatErrorLabel (isHide: Bool, errorText: String) {
        if (self.errorTextLabel.isHidden == isHide) {
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .transitionFlipFromLeft, animations:  {
                self.errorTextLabel.isHidden = !isHide
            })
        }
    }
    
    deinit {
        removeForKeyboardNotifications()
    }
}

extension SignInViewController: UITextFieldDelegate {
    
    // MARK: - correct fokus textField (before begin edit)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.passwordTextFild.layer.borderWidth = 0
        self.errorTextLabel.text = ""
        self.errorTextLabel.isHidden = true
        if (textField.restorationIdentifier == RestorationIdentifierTextField.password.string) {
            hightCorrectFokusKeyb = textField.frame.size.height
        }
        else {
            hightCorrectFokusKeyb = 0
        }
        if (keyboadHeight > 0) {
            changeKeyboardContainerViewHeightConstrain(keyboardHeight: keyboadHeight)
        }
        return true
    }
    
    // MARK: -  clouse keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - notification keyboad
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func removeForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - open keyboard
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userinfo = notification.userInfo else {return}
        guard let keyboadSize = (userinfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        keyboadHeight = keyboadSize.height
        changeKeyboardContainerViewHeightConstrain(keyboardHeight: keyboadHeight)
    }
    
    // MARK: - clouse keyboard
    @objc func keyboardWillHide() {
        keyboadHeight = 0
        changeKeyboardContainerViewHeightConstrain(keyboardHeight: keyboadHeight)
    }
    
    // MARK: - change fokus textFilde
    func changeKeyboardContainerViewHeightConstrain(keyboardHeight: CGFloat) {
        DispatchQueue.main.async {
            if (keyboardHeight > 0) {
                self.keyboardContainerViewHeightConstrain.constant = keyboardHeight + self.hightCorrectFokusKeyb
            }
            else {
                self.keyboardContainerViewHeightConstrain.constant = self.linkTextLabel.frame.size.height
            }
        }
    }
}
