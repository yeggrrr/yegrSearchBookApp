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
    let menuLabel = UILabel()
    let barButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addListTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        addListTableView.delegate = self
        addListTableView.dataSource = self
        setupConstraints()
        setupMenu()
        
    }
    
    var items: [UIAction] {
        
        let save = UIAction(
            title: "추가",
            image: UIImage(systemName: "plus"),
            handler: { [unowned self] _ in
                self.menuLabel.text = "추가"
            })
        
        let delete = UIAction(
            title: "전체 삭제",
            image: UIImage(systemName: "trash"),
            handler: { [unowned self] _ in
                self.menuLabel.text = "전체 삭제"
            })
        
        let Items = [save, delete]
        
        return Items
    }

    func setupMenu() {
        let menu = UIMenu(title: "메뉴",
                          children: items)
        
        // UIBarButtonItem의 생성자를 통해 메뉴를 생성하기
        let barButton = UIBarButtonItem(title: nil,
                                        image: UIImage(systemName: "ellipsis.circle"),
                                        primaryAction: nil,
                                        menu: menu)
        
        navigationItem.rightBarButtonItem = barButton
        barButton.tintColor = .black
    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(addListTableView)
        view.backgroundColor = .systemBrown
        
        addListTableView.snp.makeConstraints {
            $0.leading.trailing.bottom.top.equalTo(safeArea)
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
        self.present(AddBookListDetailViewController(), animated: true)
    }
}
