//
//  VSLoadableDatasourceProtocol.swift
//  Lyrics
//
//  Created by Vikas Shah on 6/17/17.
//  Copyright © 2017 Vikas Shah. All rights reserved.
//

import UIKit

public protocol VSLoadableDatasourceProtocol {
    init(with adapter: VSDataAdapterProtocol, for loadable: VSLoadableProtocol)
    func loadContent()
    func view(for data: Any) -> UIView
}
