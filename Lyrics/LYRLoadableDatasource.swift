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
    internal var loadingContent: Bool = false
    
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
        dataAdapter.fetchLyrics { status in
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
        guard let viewController = viewController else {
            assertionFailure("LYRLoadableDatasource: contentLoading() - No viewcontroller set.")
            return
        }
        
        let view = contentView(for: .Loading)
        viewController.replaceView(with: view)
    }
    
    private func contentFinishedLoading(_ status: LYRDataAdapterResponseStatus) {
        loadingContent = false
        
        guard let viewController = viewController else {
            assertionFailure("LYRLoadableDatasource: contentLoading() - No viewcontroller set.")
            return
        }
        
        let view = contentView(for: status)
        viewController.replaceView(with: view)
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
        case .Success(let lyrics):
            if let _ = lyrics.albumArt {
                return successView(for: lyrics)
            } else {
                return noAlbumArtSuccessView(for: lyrics)
            }
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
    
    func successView(for lyrics: Lyrics) -> UIView {
        return UIView()
    }
    
    func noAlbumArtSuccessView(for lyrics: Lyrics) -> UIView {
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
