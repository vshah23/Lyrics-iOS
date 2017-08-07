//
//  LYRLoadableDatasource.swift
//  Lyrics
//
//  Created by Vikas Shah on 7/31/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

class LYRLoadableDatasource {
    weak var viewController: VSLoadableViewController?
    var dataAdapter: VSDataAdapter?
    private var loadingContent: Bool = false
    
    init(viewController: VSLoadableViewController, dataAdapter: VSDataAdapter?=nil) {
        self.viewController = viewController
        self.dataAdapter = dataAdapter ?? VSDataAdapter()
    }
}

//MARK: - Adapter interaction methods

extension VSLoadableDatasource {
    func loadContent() {
        guard !loadingContent,
            let dataAdapter = dataAdapter else {
                return
        }
        loadingContent = true
        
        weak var weakSelf = self
        dataAdapter.fetchData { status in
            weakSelf?.adapterStatusUpdated(status)
        }
    }
    
    private func adapterStatusUpdated(_ status: VSDataAdapterResponseStatus) {
        switch status {
        case .Loading:
            contentLoading()
        case .Success,
             .NetworkUnavailable,
             .SomethingWentWrong:
            contentFinishedLoading(status)
        }
    }
    
    private func contentLoading() {
//        let view = contentView(for: .Loading)
        
    }
    
    private func contentFinishedLoading(_ status: VSDataAdapterResponseStatus) {
        loadingContent = false
        
//        let view = contentView(for: status)œ
//        replaceView(with: view)
    }
    
    func stopLoadingContent() {
        //TODO: this
    }
}

//MARK: - View update methods.

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
