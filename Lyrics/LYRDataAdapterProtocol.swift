//
//  LYRDataAdapterProtocol.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/16/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

enum LYRDataAdapterResponseStatus {
    case Loading
    case Success(Lyrics)
    case NetworkUnavailable
    case SomethingWentWrong
    case NoLyricsFound
    case NothingPlaying
}

protocol LYRDataAdapterProtocol {
    var description: String { get }
    func fetchLyrics(_ completion: (LYRDataAdapterResponseStatus) -> Void)
}

extension LYRDataAdapterProtocol {
    var description: String {
        return ""
    }
    
    func fetchLyrics(_ completion: (LYRDataAdapterResponseStatus) -> Void) {
        //TODO: get the below data from the currently playing song
        fetchLyrics(albumArt: nil,
                    songTitle: "",
                    artistName: "",
                    albumTitle: "",
                    completion)
    }
    
    private func fetchLyrics(albumArt: UIImage?,
                             songTitle: String,
                             artistName: String,
                             albumTitle: String?,
                             _ completion: (LYRDataAdapterResponseStatus) -> Void) {
        completion(.SomethingWentWrong)
    }
}
