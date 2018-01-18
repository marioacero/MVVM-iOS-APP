//
//  NSObjectExtension.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation
import UIKit

extension NSObject {
    
    // Name Of class
    class var stringRepresentation: String {
        let name = String(describing: self)
        return name
    }
}


extension UITableView {
    /// Register a XIB file with UITableView
    internal func registerNib(_ nibName: String) {
        let cellNib = UINib.init(nibName: nibName, bundle: nil)
        register(cellNib, forCellReuseIdentifier: nibName)
    }
}

extension UICollectionView {
    /// use to register nibs in view
    internal func registerNib(_ nibName: String) {
        let cellNib = UINib.init(nibName: nibName, bundle: nil)
        register(cellNib, forCellWithReuseIdentifier: nibName)
    }
}

protocol CreateFromArray {
    
    init?(json: JsonDictionay )
}

extension CreateFromArray {
    
    ///Create array of items from json
    static func createRequiredInstances(from json: JsonDictionay , key:String) -> [Self]? {
        guard let jsonDictionaries = json[key] as? [[String: Any]] else { return nil }
        var array = [Self]()
        for jsonDictionary in jsonDictionaries {
            guard let instance = Self.init(json: jsonDictionary) else { return nil }
            array.append(instance)
        }
        return array
    }
}
