//
//  LYRDataAdapterProtocol.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/16/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import Foundation

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
    func fetchLyrics(songTitle: String,
                     artistName: String,
                     albumTitle: String?,
                     _ completion: (LYRDataAdapterResponseStatus) -> Void)
}

extension LYRDataAdapterProtocol {
    var description: String {
        return ""
    }
    
    func fetchLyrics(_ completion: (LYRDataAdapterResponseStatus) -> Void) {
        //TODO: implement below
//        fetchLyrics(songTitle: <#T##String#>, artistName: <#T##String#>, albumTitle: <#T##String?#>, <#T##completion: (LYRDataAdapterResponseStatus) -> Void##(LYRDataAdapterResponseStatus) -> Void#>)
    }
    
    func fetchLyrics(songTitle: String,
                     artistName: String,
                     albumTitle: String?,
                     _ completion: (LYRDataAdapterResponseStatus) -> Void) {
        completion(.SomethingWentWrong)
    }
}
