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
    private weak var loadable: VSLoadableProtocol? {
        didSet {
            guard loadable == nil else { return }
            
            //TODO: stop any current data adapter operations
            
            
        }
    }
    private var loadingContent: Bool = false
    
    public required init(with adapter: VSDataAdapterProtocol, for loadable: VSLoadableProtocol) {
        self.adapter = adapter
        self.loadable = loadable
    }
    
    public init(loadable: VSLoadableProtocol) {
        self.adapter = VSDataAdapter()
        self.loadable = loadable
    }
    
    public func loadContent() {
        weak var weakSelf = self
        
        loadingContent = true
        adapter.fetchData { data in
            weakSelf?.contentFinishedLoading(data)
        }
    }
    
    private func contentFinishedLoading(_ data: Any?) {
        loadingContent = false
        
        
        
        
    }
    
    public func view(for data: Any) -> UIView {
        return UIView()
    }
}
