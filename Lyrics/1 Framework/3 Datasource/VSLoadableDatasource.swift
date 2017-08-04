//
//  VSLoadableDatasource.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/17/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

class VSLoadableDatasource {
    weak var viewController: VSLoadableViewController?
    var dataAdapter: VSDataAdapter?
    private var loadingContent: Bool = false
    
    init(viewController: VSLoadableViewController, dataAdapter: VSDataAdapter?=nil) {
        self.viewController = viewController
        self.dataAdapter = dataAdapter ?? VSDataAdapter()
    }
}

extension VSLoadableDatasource {
    func loadContent() {
        guard !loadingContent,
            let dataAdapter = dataAdapter else {
                return
        }
        loadingContent = true
        
        weak var weakSelf = self
        dataAdapter.fetchData { status in
            weakSelf?.contentFinishedLoading(status)
        }
    }
    
    private func contentFinishedLoading(_ data: VSDataAdapterResponseStatus) {
        loadingContent = false
        
//        let view = contentView(for: data)
//        replaceView(with: view)
    }
    
    func stopLoadingContent() {
        //TODO: this
    }
}

extension VSLoadableDatasource {
    func contentView(for status: VSDataAdapterResponseStatus) -> UIView {
        switch status {
        case .Loading:
            return loadingView()
        case .Success(let response):
            return successView(for: response)
        case .NetworkUnavailable:
            return noConnectionView()
        case .SomethingWentWrong:
            return genericFailureView()
        }
    }
    
    func loadingView() -> UIView {
        return UIView()
    }
    
    func successView(for data: Any?) -> UIView {
        return UIView()
    }
    
    func noConnectionView() -> UIView {
        return UIView()
    }
    
    func genericFailureView() -> UIView {
        return UIView()
    }
}
