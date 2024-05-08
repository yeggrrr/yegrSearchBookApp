//
//  ListViewController.swift
//  yegrSearchBookApp
//
//  Created by YJ on 5/7/24.
//

import UIKit

class ListViewController: UIViewController {
    
    let removeAllButton = UIButton()
    let addListTableView = UITableView()
    let label = UILabel()
    
    override func viewDidLoad() {
           super.viewDidLoad()
        view.backgroundColor = .black
        addListTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        addListTableView.delegate = self
        addListTableView.dataSource = self
        setupConstraints()
       }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(removeAllButton)
        removeAllButton.setTitle("전체 삭제", for: .normal)
        removeAllButton.titleLabel?.textColor = .white
        removeAllButton.backgroundColor = .systemGray
        removeAllButton.layer.cornerRadius = 10
        removeAllButton.snp.makeConstraints {
            $0.leading.equalTo(safeArea).offset(20)
            $0.top.equalTo(safeArea).offset(10)
        }
        
        view.addSubview(addListTableView)
        view.backgroundColor = .white
        
        
        
        addListTableView.snp.makeConstraints {
            $0.top.equalTo(removeAllButton.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalTo(safeArea)
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(AddBookListViewController(), animated: true)
    }
}
