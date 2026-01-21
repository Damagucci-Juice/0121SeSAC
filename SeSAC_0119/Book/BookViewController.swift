//
//  BookViewController.swift
//  SeSAC_0119
//
//  Created by Gucci on 1/20/26.
//

import UIKit

import Alamofire
import SnapKit
import Toast

class BookViewController: UIViewController {

    lazy var tableView = {
        let result = UITableView()
        result.backgroundColor = .lightGray

        result.backgroundView = {
            let result = UILabel()
            result.text = "TableView"
            return result
        }()

        result.register(BookTableViewCell.self,
                        forCellReuseIdentifier: BookTableViewCell.identifier)

        result.dataSource = self
        result.rowHeight = 130
        return result
    }()

    let searchBar = UISearchBar()

    var list = [BookInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureView()
        callRequest(query: "찬호")
    }

    // 고려해 볼 것 -> 문서화 해서 어필 포인트로 나타냄
    ///  1. 검색어 이전과 동일하면, 동일한 결과여도 네트워크를 탈 거임
    ///  2. 비어있는 결과도 요청을 하고 있음
    ///  3. 콜 요청은 반드시 명시적으로 사용자 액션을 받아라
    ///  4. 10초 동안 100번의 요청이 있다면 블락해버리자.
    ///  5. 요청이 몰리거나 응답이 느려져서 로딩 오래 걸리면 어떻게 할거지? 액티비티 컨트롤러 언제 띄워주지? Skeleton View 심리적인 기획
    func callRequest(query: String) {
        let url = "https://dapi.kakao.com/v3/search/book"

        let header: HTTPHeaders = [
            HTTPHeader(name: "Authorization", value: "KakaoAK 7bee9a53c660dda8a20b2764e0e4978d"),
        ]

        let parameter: Parameters = ["query": query]

        AF.request(url,
                   method: .get,
                   parameters: parameter,
                   encoding: URLEncoding.queryString,
                   headers: header)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Book.self) { response in
                if response.response?.statusCode == 401 {
                    print("인증키가 만료되었습니다.")
                } else if response.response?.statusCode == 500 {
                    print("서버 이슈")
                }
                switch response.result {
                case .success(let value):
                    self.list = value.documents
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error.errorDescription ?? "")

                }
            }
    }
}

extension BookViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text?.replacingOccurrences(of: " ", with: "") else { return }
        if query.isEmpty {
            view.makeToast("공란 입니다.")
            return
        } // 2번 해결
        if searchBar.text!.count > 2 {
            callRequest(query: searchBar.text!)
        } else {
            view.makeToast("2글자 이상 입력해주세요")
        }
    }
}

extension BookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier,
                                                       for: indexPath) as? BookTableViewCell
        else { return UITableViewCell() }
        cell.configure(list[indexPath.row])
        return cell
    }
}

extension BookViewController: ViewDesignProtocol {
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }

    func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }

        tableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom)
        }

    }

    func configureView() {
        view.backgroundColor = .white
        searchBar.placeholder = "도서를 검색해보세요"
        searchBar.delegate = self
    }
}

//struct Coin: Decodable {
//    let market: String
//    let korean_name: String
//    let english_name: String
//}

/**

 "market": "BTC-BERA",
 "korean_name": "베라체인",
 "english_name": "Berachain"
 },
 */
