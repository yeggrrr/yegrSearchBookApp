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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalTo(contentView.safeAreaLayoutGuide).offset(10)
            $0.trailing.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(10)
        }
    }
}
