//
//  LYRMainViewController.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/17/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

class LYRMainViewController: VSLoadableViewController {
    init(dataSource: LYRLoadableDatasource) {
        super.init(dataSource: dataSource)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
