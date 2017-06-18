//
//  VSLoadableViewController.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/1/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

class VSLoadableViewController: UIViewController {
    public var dataSource: VSLoadableDatasourceProtocol
    
    init(dataSource: VSLoadableDatasourceProtocol) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        dataSource = VSLoadableDatasource()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //kick off data fetch
    }
    
    func reloadData() {
        
    }
}
