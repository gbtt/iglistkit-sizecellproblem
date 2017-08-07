//
//  CityCell.swift
//  iglistkit-sizecellproblem
//
//  Created by Giuseppe Bottiglieri on 04/08/17.
//  Copyright © 2017 GiuBot. All rights reserved.
//

import UIKit

class CityCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var item:CityModel? {
        didSet {
            self.setup()
        }
    }
    
    func setup() {
        let imageName = self.item?.imageName
        
        self.imageView.image = UIImage(named: imageName!)
        self.nameLabel.text  = self.item?.title
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        return label
    }()
    
    func setupViews() {
        
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.frame = CGRect(x: 0, y:  0, width: frame.width, height: frame.height)
        nameLabel.frame = CGRect(x: 0, y: 40, width: frame.width, height: frame.height)
    }
}
