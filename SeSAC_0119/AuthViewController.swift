//
//  AuthViewController.swift
//  SeSAC_0119
//
//  Created by Gucci on 1/19/26.
//

import UIKit

import SnapKit

final class AuthViewController: UIViewController {

    let idTextField = {
        let result = UITextField()
        result.placeholder = "값을 입력해주세요"
        result.textColor = .black
        result.backgroundColor = .yellow
        return result
    }()

    let redView = {
        let result = UIView()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .red
        return result
    }()

    let greenView = {
        let result = UIView()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .green
        return result
    }()

    let blueView = {
        let result = UIView()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .blue
        return result
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        print(self, #function)
        view.backgroundColor = .white

        view.addSubview(idTextField)
        view.addSubview(blueView)
        blueView.addSubview(redView)
        redView.addSubview(greenView)

        idTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(36)
            make.height.equalTo(view.safeAreaLayoutGuide).dividedBy(20)
        }

        redView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }

        greenView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(100)
            make.size.equalTo(80)
        }

        blueView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.size.equalTo(400)
        }
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
