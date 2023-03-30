//
//  LogInViewController.swift
//  Navigation
//
//  Created by Anastasia Sokolova on 23.03.2023.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private var imageView: UIView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private var textField: UITextField = {
        let textField = UITextField()
        let paddingViewTextField = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.leftView = paddingViewTextField
        textField.leftViewMode = .always
        return textField
    }()

    private var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.gray
        lineView.translatesAutoresizingMaskIntoConstraints = false

        return lineView
    }()

    private var passwordField: UITextField = {
        let passwordField = UITextField()
        let paddingViewPasswordField = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: passwordField.frame.height))
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.autocapitalizationType = .none
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.leftView = paddingViewPasswordField
        passwordField.leftViewMode = .always
        return passwordField
    }()

    private var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.addTarget(nil, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Log in", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        loginButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        loginButton.alpha = 1
        loginButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .highlighted)
        loginButton.alpha = 0.8
        loginButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .selected)
        loginButton.alpha = 0.8
        loginButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .disabled)
        loginButton.alpha = 0.8
        return loginButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setup()
        textField.delegate = self
        passwordField.delegate = self
    }

    func setup() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [imageView, loginButton].forEach({ contentView.addSubview($0) })

        let stackView = UIStackView(arrangedSubviews: [textField, lineView, passwordField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        contentView.addSubview(stackView)
        contentView.addSubview(lineView)


        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true
        stackView.layer.borderWidth = 0.5
        stackView.backgroundColor = UIColor.systemGray6
        stackView.layer.borderColor = UIColor.lightGray.cgColor

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            imageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),

            textField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 50),


            lineView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),

            passwordField.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 0),
            passwordField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func loginButtonTapped() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}
