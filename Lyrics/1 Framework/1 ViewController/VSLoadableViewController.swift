//
//  VSLoadableViewController.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/1/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

public class VSLoadableViewController: UIViewController {
    public var dataSource: VSLoadableDatasourceProtocol?
    
    init(dataSource: VSLoadableDatasourceProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = dataSource
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.dataSource = VSLoadableDatasource(loadable: self)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //kick off data fetch
        dataSource?.loadContent()
    }
}

extension VSLoadableViewController: VSLoadableProtocol {
    public func replaceView(with newView: UIView) {
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
