//
//  ViewController.swift
//  SeSAC_0119
//
//  Created by Gucci on 1/19/26.
//

import UIKit

import Alamofire
import SnapKit

class ViewController: UIViewController {

    let label = {
        let result = UILabel()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .clear
        result.text = "코드로 레이블 추가"
        result.font = .systemFont(ofSize: 16, weight: .regular)
        result.textColor = .black
        return result
    }()

    private lazy var gucciButton = {
        let result = UIButton()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .clear
        result.setTitle("버튼", for: .normal)
        result.setTitleColor(.tintColor, for: .normal)
        result.addTarget(self, action: #selector(gucciButtonTapped), for: .touchUpInside)
        return result
    }()

    @objc private func gucciButtonTapped() {
        let vc = BookViewController()
        present(vc, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        callRequest()

        view.addSubview(label)
        view.addSubview(gucciButton)

        label.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
        }

        gucciButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    private func callRequest() {
        let url = URL(string: "https://picsum.photos/id/0/info")!
        AF.request(url, method: .get)
            .responseDecodable(of: PicsumImage.self) { [weak self] response in
                guard let self else { return }
                switch response.result {
                case .success(let value):
                    label.text = value.author
                case .failure(let error):
                    print(error.errorDescription ?? "")

                }
            }
    }
}

struct PicsumImage: Decodable {
    let author: String
    let width: Int
    let download_url: String
}
