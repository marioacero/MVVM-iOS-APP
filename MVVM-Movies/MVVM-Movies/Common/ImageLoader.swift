//
//  ImageLoader.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/17/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation
import UIKit

class ImageLoader: NSObject {
    
    class func path(name: String) -> String {
        let finalPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        return finalPath + name
    }
    
    class func getImagen(name: String, round: Bool, width: Int, height: Int, completion: @escaping(UIImage) -> Void) {
        guard let localImage = UIImage(contentsOfFile: self.path(name: name)) else {
            let url = AppConstants.domainImage + "w" + String(width) + String(name)
            let qos = DispatchQoS(qosClass: .userInitiated, relativePriority: 0)
            DispatchQueue.global(qos: qos.qosClass).async(execute: {
                let imagenData = NSData(contentsOf: NSURL(string: url)! as URL)
                DispatchQueue.main.async( execute: {
                    imagenData?.write(toFile: self.path(name: name), atomically: true)
                    if imagenData != nil{
                        let finalImage = UIImage(data: imagenData! as Data)
                        completion(finalImage!)
                    }
                })
            })
            return
        }
        completion(localImage)
    }
}
