//
//  VSLoadableViewController.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/1/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

class VSLoadableViewController: UIViewController {
    public var dataSource: VSLoadableDatasource?
    
    init(dataSource: VSLoadableDatasource) {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = VSLoadableDatasource(viewController: self)
    }
}

extension VSLoadableViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //kick off data fetch
        dataSource?.loadContent()
    }
}

extension VSLoadableViewController {
    func replaceView(with newView: UIView) {
        guard let superview = self.view else {
            assertionFailure("VSLoadableViewController: ViewController's view was nil")
            return
        }
        
        superview.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
        superview.addSubview(newView)
        newView.pinToSuperView()
    }
}
