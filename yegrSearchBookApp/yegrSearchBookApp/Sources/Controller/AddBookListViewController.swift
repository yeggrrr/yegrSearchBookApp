//
//  AddBookListViewController.swift
//  yegrSearchBookApp
//
//  Created by YJ on 5/8/24.
//

import UIKit
import SnapKit

class AddBookListViewController: UIViewController {
    // Top informations
    let bookNameLabel = UILabel()
    let authorNameLabel = UILabel()
    let titleImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.image = UIImage(named: "Fubao")
        view.backgroundColor = .lightGray
        view.contentMode = .scaleToFill
        return view
    }()
    let priceLabel = UILabel()
    
    // Description
    let descriptionScrollView = UIScrollView()
    let descriptionView = UIView()
    let bookDescriptionLabel = UILabel()
    
    // Bottom buttons
    let buttonStackView = UIStackView()
    let backButton = UIButton()
    let addButton = UIButton()
    
    override func viewDidLoad() {
           super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
        configure()
        
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
       }
    
    @objc func backButtonClicked(_ backButton: UIButton) {
        self.dismiss(animated: true)
    }
    
    func configure() {
        
        // bookNameLabel
        bookNameLabel.text = "아기 판다 푸바오"
        bookNameLabel.font = .systemFont(ofSize: 30)
        bookNameLabel.textColor = .black
        
        // authorNameLabel
        authorNameLabel.text = "에버랜드 동물원"
        authorNameLabel.font = .boldSystemFont(ofSize: 20)
        authorNameLabel.textColor = .darkGray
        
        // priceLabel
        priceLabel.text = "₩ 18000"
        priceLabel.font = .boldSystemFont(ofSize: 15)
        priceLabel.textColor = .black
        
        // bookDescriptionLabel
        bookDescriptionLabel.text = "에버랜드 동물원 아기 판다 푸바오의 성장기를 담은 포토 에세이 아기는 무조건 사랑스럽습니다. 사람이든 동물이든 갓 태어난 아기는 모든 이의 마음을 무장 해제시킵니다. 하물며 어른이 되어서도 특유의 귀여움으로 사랑받는 동물인 자이언트판다의 아기는 어떨까요? 태어날 때부터 세간의 관심과 주목을 받은 아기 판다! 에버랜드 동물원의 판다 커플인 아이바오(♀)와 러바오(♂) 사이에서 태어난 판다입니다. 국내에서 처음 태어난 1호 아기 판다라는 점에서 우리에게 더 큰 의미로 다가옵니다. 이름도 전 국민을 대상으로 공모를 하고, 투표 이벤트를 거쳐 지어졌습니다. 그 이름은 바로 푸바오! ‘행복을 주는 보물’이라는 뜻입니다. 이름처럼 푸바오는 태어난 순간부터 지금까지 많은 이들에게 행복을 주고 있습니다."
        bookDescriptionLabel.font = .systemFont(ofSize: 15)
        bookDescriptionLabel.numberOfLines = 0
        bookDescriptionLabel.textColor = .darkGray
        bookDescriptionLabel.textAlignment = .justified
        
        // backButton
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 50, weight: .regular, scale: .large)
        let xImage = UIImage(systemName: "xmark.app", withConfiguration: symbolConfiguration)
        
        backButton.setImage(xImage, for: .normal)
        backButton.tintColor = .systemBrown
        backButton.imageView?.contentMode = .scaleAspectFit

        // buttonStackView
        buttonStackView.alignment = .center
        buttonStackView.spacing = 10
        
        // addButton
        addButton.setTitle("담기 취소", for: .normal)
        addButton.backgroundColor = .systemBrown
        addButton.tintColor = .white
        addButton.layer.cornerRadius = 10
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    }
    
    func setupConstraints() {
        // Add subviews
        [bookNameLabel, authorNameLabel ,titleImageView, priceLabel, descriptionScrollView, buttonStackView].forEach {
            view.addSubview($0)
        }
        
        descriptionScrollView.addSubview(descriptionView)
        descriptionView.addSubview(bookDescriptionLabel)
        
        buttonStackView.addArrangedSubview(backButton)
        buttonStackView.addArrangedSubview(addButton)
        
        // Set constraints
        let safeArea = view.safeAreaLayoutGuide
        bookNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.top.equalTo(safeArea).offset(20)
        }
        
        authorNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.top.equalTo(bookNameLabel.snp.bottom).offset(10)
        }
        
        titleImageView.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.top.equalTo(authorNameLabel.snp.bottom).offset(20)
            $0.height.equalTo(350)
            $0.width.equalTo(300)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.top.equalTo(titleImageView.snp.bottom).offset(10)
        }
        
        descriptionScrollView.snp.makeConstraints {
            $0.leading.equalTo(safeArea.snp.leading).offset(20)
            $0.trailing.equalTo(safeArea.snp.trailing).offset(-20)
            $0.top.equalTo(priceLabel.snp.bottom).offset(15)
            $0.bottom.equalTo(addButton.snp.top).offset(-10)
        }
        
        let scrollViewFrame = descriptionScrollView.frameLayoutGuide
        let scrollViewContent = descriptionScrollView.contentLayoutGuide
        descriptionView.snp.makeConstraints {
            $0.leading.equalTo(scrollViewFrame.snp.leading)
            $0.trailing.equalTo(scrollViewFrame.snp.trailing)
            $0.top.equalTo(scrollViewContent.snp.top)
            $0.bottom.equalTo(scrollViewContent.snp.bottom)
        }
        
        bookDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(descriptionView.snp.leading).offset(20)
            $0.trailing.equalTo(descriptionView.snp.trailing).offset(-20)
            $0.top.equalTo(descriptionView.snp.top).offset(20)
            $0.bottom.equalTo(descriptionView.snp.bottom).offset(-20)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(safeArea.snp.leading).inset(10)
            $0.trailing.equalTo(safeArea.snp.trailing).inset(10)
            $0.top.equalTo(descriptionScrollView.snp.bottom).offset(10)
            $0.bottom.equalTo(safeArea.snp.bottom).inset(10)
            $0.height.equalTo(50)
        }
        
        backButton.snp.makeConstraints {
            $0.height.equalTo(backButton.snp.width)
        }
    }

}

