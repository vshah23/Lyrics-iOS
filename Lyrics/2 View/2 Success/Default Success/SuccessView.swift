//
//  SuccessView.swift
//  Lyrics
//
//  Created by Vikas Shah on 8/6/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

class SuccessView: UIView {
    @IBOutlet weak var albumArtImageView: UIImageView!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var lyricsTextView: UITextView!
    
    static func initWith(lyrics: Lyrics) -> SuccessView {
        let view = initFromNib()
        view.setColorsBasedOn(image: lyrics.albumArt)
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

extension SuccessView {
    func setColorsBasedOn(image: UIImage?) {
        //TODO
//        guard let image = image else {
//            setColorsWithoutImage()
//            return
//        }
    }
    
    func setColorsWithoutImage() {
        //TODO
    }
}
