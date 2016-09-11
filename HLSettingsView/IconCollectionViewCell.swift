//
//  IconCollectionViewCell.swift
//  HLSettingsView
//
//  Created by Hanjie Liu on 9/10/16.
//  Copyright © 2016 Hanjie Liu. All rights reserved.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    var name = ""
    var imageName = ""{didSet{
        setup()
        }}
    
    func setup(){
        title.text = name
        iconImage.image = UIImage(named: imageName)
    }
    
}
