//
//  Lyrics.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/3/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

public struct Lyrics {
    private(set) public var albumArt: UIImage?
    public let songTitle: String
    public let artistName: String
    public let albumTitle: String?
    public let lyrics: String
    
    init(albumArt: UIImage?, albumTitle: String?, songTitle: String, artistName: String, lyrics: String) {
        self.albumArt = albumArt
        self.albumTitle = albumTitle
        self.songTitle = songTitle
        self.artistName = artistName
        self.lyrics = lyrics
    }
}
