//
//  LYRLoadableDatasource.swift
//  Lyrics
//
//  Created by Vikas Shah on 7/31/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

class LYRLoadableDatasource {
    weak var viewController: LYRMainViewController?
    var dataAdapter: LYRDataAdapter?
    private var loadingContent: Bool = false
    
    init(viewController: LYRMainViewController, dataAdapter: LYRDataAdapter?=nil) {
        self.viewController = viewController
        self.dataAdapter = dataAdapter ?? LYRDataAdapter()
    }
}

//MARK: - Data adapter interaction methods

extension LYRLoadableDatasource {
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
    
    private func adapterStatusUpdated(_ status: LYRDataAdapterResponseStatus) {
        switch status {
        case .Loading:
            contentLoading()
        case .Success,
             .NetworkUnavailable,
             .SomethingWentWrong,
             .NothingPlaying,
             .NoLyricsFound:
            contentFinishedLoading(status)
        }
    }
    
    private func contentLoading() {
//        let view = contentView(for: .Loading)
        
    }
    
    private func contentFinishedLoading(_ status: LYRDataAdapterResponseStatus) {
        loadingContent = false
        
//        let view = contentView(for: status)œ
//        replaceView(with: view)
    }
    
    func stopLoadingContent() {
        //TODO: this
    }
}

//MARK: - View update methods.

extension LYRLoadableDatasource {
    func contentView(for status: LYRDataAdapterResponseStatus) -> UIView {
        switch status {
        case .Loading:
            return loadingView()
        case .Success(let response):
            return successView(for: response)
        case .NetworkUnavailable:
            return noConnectionView()
        case .SomethingWentWrong:
            return genericFailureView()
        case .NothingPlaying:
            return nothingPlayingView()
        case .NoLyricsFound:
            return noLyricsFoundView()
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
    
    func nothingPlayingView() -> UIView {
        return UIView()
    }
    
    func noLyricsFoundView() -> UIView {
        return UIView()
    }
}
