//
//  MovieViewController.swift
//  SeSAC_0119
//
//  Created by Gucci on 1/21/26.
//

import UIKit

import Alamofire
import SnapKit

final class MovieViewController: UIViewController {

    func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(
            width: UIScreen.main.bounds.width,
            height: 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }

    private lazy var movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureView()
    }
}


extension MovieViewController: ViewDesignProtocol {
    func configureHierarchy() {
        view.addSubview(movieCollectionView)
    }
    
    func configureLayout() {
        movieCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureView() {
        view.backgroundColor = .white
        movieCollectionView.backgroundColor = .red
    }



}
