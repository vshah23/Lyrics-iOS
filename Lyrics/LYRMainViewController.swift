//
//  LYRMainViewController.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/17/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

class LYRMainViewController {
    public var dataSource: LYRLoadableDatasource?
    
    init(dataSource: LYRLoadableDatasource) {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = LYRLoadableDatasource(viewController: self)
    }
}

extension LYRMainViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //kick off data fetch
        dataSource?.loadContent()
    }
}

extension LYRMainViewController {
    func replaceView(with newView: UIView) {
        guard let superview = self.view else {
            assertionFailure("LYRMainViewController: ViewController's view was nil")
            return
        }
        
        superview.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        superview.addSubview(newView)
        newView.pinToSuperView()
    }
}
