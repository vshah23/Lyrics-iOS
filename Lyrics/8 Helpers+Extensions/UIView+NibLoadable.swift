//
//  UIView+NibLoadable.swift
//  Lyrics
//
//  Created by Vikas Shah on 8/5/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

extension UIView {
    public class var nibName: String {
        return String(describing: self)
    }
    
    public class var nib: UINib? {
        guard let _ = Bundle.main.path(forResource: nibName, ofType: "nib") else {
            return nil
        }
        return UINib(nibName: nibName, bundle: nil)
    }
    
    public class func initFromNib(nibNameOrNil: String? = nil) -> Self {
        return initFromNib(nibNameOrNil: nibNameOrNil, type: self)!
    }
    
    public class func initFromNib<T: UIView>(nibNameOrNil: String? = nil, type: T.Type) -> T? {
        let nibName = nibNameOrNil ?? self.nibName
        
        guard let view = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as? T else {
            assertionFailure("No view of type \(type) found in nib \(nibName)")
            return nil
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
}
