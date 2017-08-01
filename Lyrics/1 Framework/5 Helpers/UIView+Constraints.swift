//
//  UIView+Constraints.swift
//  Lyrics
//
//  Created by Vikas Shah on 7/31/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

internal extension UIView {
    internal func pinToSuperView() {
        guard let superview = superview else {
            assertionFailure("UIView Extension: No superview to pin to")
            return
        }
        
        self.topAnchor.constraint(equalTo: superview.topAnchor)
        self.leftAnchor.constraint(equalTo: superview.leftAnchor)
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        self.rightAnchor.constraint(equalTo: superview.rightAnchor)
    }
}
