//
//  BookTableViewCell.swift
//  SeSAC_0119
//
//  Created by Gucci on 1/20/26.
//

import UIKit

import Kingfisher
import SnapKit

final class BookTableViewCell: UITableViewCell {
    static let identifier = "BookTableViewCell"

    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let overviewLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureHierarchy()
        configureLayout()
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        thumbnailImageView.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
        overviewLabel.text = nil
    }

    func configure(_ item: BookInfo) {
        thumbnailImageView.kf.setImage(with: URL(string: item.thumbnail))
        titleLabel.text = item.title
        subtitleLabel.text = item.authors.first ?? "작자미상"
        overviewLabel.text = item.contents
    }
}

extension BookTableViewCell: ViewDesignProtocol {
    func configureHierarchy() {
        [thumbnailImageView, titleLabel, subtitleLabel, overviewLabel].forEach {
            contentView.addSubview($0)
        }
    }

    func configureLayout() {
        thumbnailImageView.snp.makeConstraints { make in
            make.leading.verticalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.width.equalTo(80)
        }

        titleLabel.snp.makeConstraints {
            $0.trailing.top.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(8)
            $0.height.equalTo(18)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(8)
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(18)
        }

        overviewLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(8)
            make.top.equalTo(subtitleLabel.snp.bottom)
        }
    }

    func configureView() {
//        thumbnailImageView.backgroundColor = .yellow
//        titleLabel.backgroundColor = .red
//        subtitleLabel.backgroundColor = .purple
//        overviewLabel.backgroundColor = .cyan

        thumbnailImageView.contentMode = .scaleAspectFill

        titleLabel.numberOfLines = 1
        subtitleLabel.numberOfLines = 1
        overviewLabel.numberOfLines = 0
    }


}
