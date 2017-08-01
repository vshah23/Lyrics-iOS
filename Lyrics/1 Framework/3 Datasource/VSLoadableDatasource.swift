//
//  VSLoadableDatasource.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/17/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

public class VSLoadableDatasource: VSLoadableDatasourceProtocol {
    private let adapter: VSDataAdapterProtocol
    private let loadable: VSLoadableProtocol
    
    public required init(with adapter: VSDataAdapterProtocol, for loadable: VSLoadableProtocol) {
        self.adapter = adapter
        self.loadable = loadable
    }
    
    public init(loadable: VSLoadableProtocol) {
        self.adapter = VSDataAdapter()
        self.loadable = loadable
    }
    
    public func loadContent() {
        
    }
    
    public func view(for data: Any) -> UIView {
        return UIView()
    }
}
