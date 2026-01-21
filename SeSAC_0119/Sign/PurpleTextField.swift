//
//  PurpleTextField.swift
//  SeSAC_0119
//
//  Created by Gucci on 1/20/26.
//

import UIKit

class Mentor {

}

class Jack: Mentor {
    
}

final class PurpleTextField: UITextField {

//    convenience init(color: UIColor) {
//        self.init(frame: .zero)
//
//        layer.borderColor = color.cgColor
//    }

    convenience init(placeholder: String,
         keyboard: UIKeyboardType,
         isSecure: Bool) {

        self.init(frame: .zero)

        print("코드 베이스 custom init")

        self.placeholder = placeholder
        self.keyboardType = keyboard
        self.isSecureTextEntry = isSecure
    }



    override init(frame: CGRect) {
        super.init(frame: frame)
        borderStyle = .none
        layer.borderWidth = 1
        layer.borderColor = UIColor.purple.cgColor
        layer.cornerRadius = 8
        font = .boldSystemFont(ofSize: 14)
        tintColor = .systemPurple
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
