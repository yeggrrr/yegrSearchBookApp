//
//  SearchViewController.swift
//  yegrSearchBookApp
//
//  Created by YJ on 5/7/24.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let bookListTableView = UITableView()
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupSearchBar()
        
        bookListTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        bookListTableView.delegate = self
        bookListTableView.dataSource = self
        setupConstraints()
    }
    
    func setupConstraints() {
        view.addSubview(searchBar)
        view.addSubview(bookListTableView)
        view.backgroundColor = .systemGray
        
        let safeArea = view.safeAreaLayoutGuide
        searchBar.snp.makeConstraints {
            $0.leading.trailing.top.equalTo(safeArea)
            $0.bottom.equalTo(bookListTableView.snp.top).offset(-10)
        }
        
        bookListTableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(safeArea)
        }
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
            textField.backgroundColor = .lightGray
        }
        
        // 플레이스홀더 컬러
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.attributedPlaceholder = NSAttributedString(string: "책 이름을 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        // 네비게이션 바에 넣기
        // navigationItem.titleView = searchBar
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = "책 이름"
        cell.titleLabel.textColor = .black
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
