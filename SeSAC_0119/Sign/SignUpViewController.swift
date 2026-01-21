//
//  SignUpViewController.swift
//  SeSAC_0119
//
//  Created by Gucci on 1/20/26.
//

import UIKit

import SnapKit

class SignUpViewController: UIViewController {
    let emailTextField          = PurpleTextField(placeholder: "enter email", keyboard: .emailAddress, isSecure: false)
    let passwordTextField       = PurpleTextField(placeholder: "enter password", keyboard: .asciiCapable, isSecure: true)
    let ageTextField            = PurpleTextField(placeholder: "enter age", keyboard: .decimalPad, isSecure: false)

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureView()
    }
}

extension SignUpViewController: ViewDesignProtocol {
    // attribute
    func configureView() {
        view.backgroundColor = .white
        emailTextField.backgroundColor = .yellow
        passwordTextField.backgroundColor = .red
        ageTextField.backgroundColor = .blue

//        emailTextField.placeholder = "이메일을 작성해보세요"
//        passwordTextField.placeholder = "비밀번호를 작성해보세요"
//        ageTextField.placeholder = "나이를 작성해보세요"
    }

    // snapkit
    func configureLayout() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }

        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }

        ageTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
    }

    // add subview
    func configureHierarchy() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(ageTextField)
    }
}
