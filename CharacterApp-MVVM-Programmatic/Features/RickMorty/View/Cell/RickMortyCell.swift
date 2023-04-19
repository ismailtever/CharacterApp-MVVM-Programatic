//
//  RickMortyCell.swift
//  CharacterApp-MVVM-Programmatic
//
//  Created by Ismail Tever on 18.04.2023.
//

import UIKit
import AlamofireImage

class RickMortyCell: UITableViewCell {

    private let customImageViewCell: UIImageView = UIImageView()
    private let title: UILabel = UILabel()
    private let customDescription: UILabel = UILabel()
    
    private let randomImage: String = "https://picsum.photos/200/300"
    
    
    enum Identifier: String {
        case custom = "vb10"
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        addSubview(title)
        addSubview(customDescription)
        addSubview(customImageViewCell)
        title.font = .boldSystemFont(ofSize: 18)
        customDescription.font = .italicSystemFont(ofSize: 10)
        
        customImageViewCell.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.top.equalTo(contentView)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(customImageViewCell.snp.bottom).offset(5)
            make.left.right.equalTo(contentView)
            
        }
        customDescription.snp.makeConstraints { make in
            make.top.equalTo(title).offset(5)
            make.left.right.equalTo(title)
            make.bottom.equalTo(title.snp.bottom).offset(20)
        }
    }
    func saveModel(model: Result) {
        title.text = model.name
        customDescription.text = model.status?.rawValue
        customImageViewCell.af.setImage(withURL: URL(string: model.image ?? randomImage) ?? URL(string: randomImage)!)
        
    }

}
