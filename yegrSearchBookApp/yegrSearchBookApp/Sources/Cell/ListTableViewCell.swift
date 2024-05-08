//
//  ListTableViewCell.swift
//  yegrSearchBookApp
//
//  Created by YJ on 5/8/24.
//

import UIKit
import SnapKit

class ListTableViewCell: UITableViewCell {
    static let identifier = "ListTableViewCell"
   
    let titleLabel = UILabel()
    let titleImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.image = UIImage(named: "Fubao")
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        contentView.addSubview(titleImageView)
        contentView.addSubview(titleLabel)
        
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        titleImageView.snp.makeConstraints {
            $0.top.leading.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            $0.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(5)
            $0.height.equalTo(80)
            $0.width.equalTo(80)
        }
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "아기 판다 푸바오"
        titleLabel.font = .systemFont(ofSize: 20)
        titleLabel.textColor = .black
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(titleImageView.snp.trailing).offset(40)
            $0.trailing.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(10)
        }
    }
}

