//
//  SuccessView.swift
//  Lyrics
//
//  Created by Vikas Shah on 8/6/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

class NoAlbumArtSuccessView: UIView {
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var lyricsTextView: UITextView!
    
    static func initWith(lyrics: Lyrics) -> NoAlbumArtSuccessView {
        let view = initFromNib()
        view.setColors()
        view.songTitleLabel.text = lyrics.songTitle
        view.artistNameLabel.text = lyrics.artistName
        view.albumTitleLabel.text = lyrics.albumTitle
        view.lyricsTextView.text = lyrics.lyrics
        return view
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension NoAlbumArtSuccessView {
    func setColors() {
        //TODO
    }
}
