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
    private let tableView: UITableView = UITableView()
    private let indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private var results: [Result] = []
    var viewModel: IRickMortyViewModel = RickMortyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        viewModel.setDelegate(outPut: self)
        viewModel.fetchItems()
    }
    
// MARK: -
    private func config() {
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        drawDesign()
        makeTableView()
        makeLabel()
        makeIndicator()
        }
    private func drawDesign() {
        tableView.dataSource = self
        tableView.delegate = self
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.labelTitle.text = "Rick & Morty"
            self.indicator.color = .red
        }
        
        indicator.startAnimating()
    }

}
// MARK: - Extensions
extension RickMortyViewController {
    private func makeTableView() {
        tableView.snp.makeConstraints { make in
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

extension RickMortyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = results[indexPath.row].name ?? ""
        return cell
    }
    
     
}

extension RickMortyViewController: RickMortyOutPut {
    func changeLoading(isLoad: Bool) {
//        isLoad ? indicator.startAnimating() : indicator.stopAnimating()
        if isLoad == true {
            indicator.startAnimating()
        }else {
            indicator.stopAnimating()
        }
    }
    
    func saveDatas(values: [Result]) {
        results = values
        tableView.reloadData()
    }
    
     
}

// MARK: - Protocols
protocol RickMortyOutPut {
    func changeLoading(isLoad: Bool)
    func saveDatas(values: [Result])
}
