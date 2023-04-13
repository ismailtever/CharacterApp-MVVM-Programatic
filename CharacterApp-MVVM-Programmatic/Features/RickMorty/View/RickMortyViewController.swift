//
//  RickMortyViewController.swift
//  CharacterApp-MVVM-Programmatic
//
//  Created by Ismail Tever on 13.04.2023.
//

import UIKit
import SnapKit

final class RickMortyViewController: UIViewController {
    
// MARK: - UI Elements
    private let labelTitle: UILabel = UILabel()
    private let box: UIView = UIView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
// MARK: -
    private func config() {
        view.addSubview(labelTitle)
        view.addSubview(box)
        view.addSubview(indicator)
        drawDesign()
        makeBox()
        makeLabel()
        makeIndicator()
        }
    private func drawDesign() {
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.box.backgroundColor = .red
            self.labelTitle.text = "text label"
            self.indicator.color = .red
        }
        
        indicator.startAnimating()
    }

}
// MARK: - Extensions
extension RickMortyViewController {
    private func makeBox() {
        box.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(30) //box labeltitle ın altından 30 padding aşağıda
            make.bottom.equalToSuperview()
            make.left.right.equalTo(labelTitle)
        }
    }
    private func makeLabel() {
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.right.equalTo(view).offset(-10)
            make.left.equalTo(view).offset(10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    private func makeIndicator() {
        indicator.snp.makeConstraints { make in
            make.height.equalTo(labelTitle)
            make.right.equalTo(labelTitle).offset(-5)
            make.top.equalTo(labelTitle)
        }
    }
}
