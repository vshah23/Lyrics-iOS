//
//  UIView+NibLoadable.swift
//  Lyrics
//
//  Created by Vikas Shah on 8/5/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

extension UIView {
    static var nibName: String {
        return String(describing: type(of: self))
    }
    
//    class func initFromNib() -> Self {
//        let view = Bundle.main.loadNibNamed(nibName,
//                                            owner: nil,
//                                            options: nil)?.first
//        guard let view2 = view as? Self else {
//            assertionFailure("View is not of type \(String(description: self.Type))")
//            return nil
//        }
//
//        return view2
//    }
    
    static func fromNib<T : UIView>() -> T? {   // 2
        let nibName = String(describing: type(of: self))
        guard let view = Bundle.main.loadNibNamed(nibName,
                                                  owner: self,
                                                  options: nil)?[0] as? T else
        {
            // xib not loaded, or it's top view is of the wrong type
            assertionFailure("View is not of type \(nibName)")
            return nil
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
