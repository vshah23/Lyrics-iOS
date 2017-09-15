//
//  LYRDataAdapterProtocol.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/16/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit
import MediaPlayer

enum LYRDataAdapterResponseStatus {
    case Loading
    case Success(Lyrics)
    case NetworkUnavailable
    case SomethingWentWrong
    case NoLyricsFound
    case NothingPlaying
}

protocol LYRDataAdapterProtocol {
    func fetchLyrics(_ completion: @escaping (LYRDataAdapterResponseStatus) -> Void)
}

extension LYRDataAdapterProtocol {
    func fetchLyrics(_ completion: @escaping (LYRDataAdapterResponseStatus) -> Void) {
//        MPMediaLibrary.getNowPlayingInfo() {
//            OperationQueue.main.addOperation({ 
//                let player = MPMusicPlayerController.systemMusicPlayer()
//                print("playback state: \(player.playbackState.rawValue)")
//                guard let mediaItem = player.nowPlayingItem,
//                    let songTitle = mediaItem.value(forProperty: MPMediaItemPropertyTitle) as? String,
//                    let artistName = mediaItem.value(forProperty: MPMediaItemPropertyArtist) as? String else {
//                        completion(.NothingPlaying)
//                        return
//                }
//                let albumTitle = mediaItem.value(forProperty: MPMediaItemPropertyAlbumTitle) as? String
//                let albumArtwork = mediaItem.value(forProperty: MPMediaItemPropertyArtwork) as? MPMediaItemArtwork
//                let albumArt = albumArtwork?.image(at: CGSize(width: 500, height: 500))
//                
//                print("\(songTitle) by \(artistName) on \(albumTitle ?? "N/A")")
//                
//                self.fetchLyrics(albumArt: albumArt,
//                            songTitle: songTitle,
//                            artistName: artistName,
//                            albumTitle: albumTitle,
//                            completion)
//            })
//        }
        
//        guard let localClient = MRMediaRemoteOriginClientManager.localClient as? MRMediaRemoteOriginClient else {
//            return
//        }
        
        
    }
    
    func fetchLyrics(albumArt: UIImage?,
                     songTitle: String,
                     artistName: String,
                     albumTitle: String?,
                     _ completion: @escaping (LYRDataAdapterResponseStatus) -> Void) {
        completion(.SomethingWentWrong)
    }
}
