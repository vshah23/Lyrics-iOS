//
//  LYRMainViewController.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/17/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

class LYRMainViewController: UIViewController {
    public var dataSource: LYRLoadableDatasource?
    
    init(dataSource: LYRLoadableDatasource? = nil, dataAdapter: LYRDataAdapter? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = dataSource ?? LYRLoadableDatasource(viewController: self, dataAdapter: dataAdapter)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = LYRLoadableDatasource(viewController: self, dataAdapter: LYRGoogleMusicDataAdapter())
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
        
        // TODO: fade in the view
        superview.addSubview(newView)
        newView.pinToSuperView()
    }
}
