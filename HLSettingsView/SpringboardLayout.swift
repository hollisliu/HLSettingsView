//
//  SpringboardLayout.swift
//  HLSettingsView
//
//  Created by Hanjie Liu on 9/10/16.
//  Copyright © 2016 Hanjie Liu. All rights reserved.
//

import UIKit

class SpringboardLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        
        self.scrollDirection = .horizontal
        
        self.itemSize = CGSize(width: 60, height: 80)
        self.minimumInteritemSpacing = 5
        self.minimumLineSpacing = 20
        self.sectionInset = UIEdgeInsetsMake(5,32,5,32)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
