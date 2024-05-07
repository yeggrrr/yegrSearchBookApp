//
//  SearchViewController.swift
//  yegrSearchBookApp
//
//  Created by YJ on 5/7/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupSearchBar()
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "검색"
        searchBar.delegate = self
        
        // 텍스트필드 색상 변경
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = .black
            textField.backgroundColor = .white
        }
        
        // 플레이스홀더 컬러
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.attributedPlaceholder = NSAttributedString(string: "책 이름을 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        // 네비게이션 바에 넣기
        navigationItem.titleView = searchBar
    }
}
