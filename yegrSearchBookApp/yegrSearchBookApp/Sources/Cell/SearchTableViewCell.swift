//
//  SearchTableViewCell.swift
//  yegrSearchBookApp
//
//  Created by YJ on 5/7/24.
//

import UIKit
import SnapKit

class SearchTableViewCell: UITableViewCell {
    static let identifier = "SearchTableViewCell"
   
    let titleLabel = UILabel()
    let titleImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Fubao")
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        titleLabel.text = "아기 판다 푸바오"
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.textColor = .black
    }
    
    func layout() {
        contentView.addSubview(titleImageView)
        contentView.addSubview(titleLabel)
        
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleImageView.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(5)
            $0.top.equalTo(contentView.snp.top).offset(5)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-5)
            $0.width.equalTo(100)
            $0.height.equalTo(titleImageView.snp.width)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(contentView.snp.trailing).inset(10)
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.bottom.equalTo(contentView.snp.bottom).inset(10)
        }
    }
}
