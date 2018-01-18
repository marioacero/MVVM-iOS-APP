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
    
    static var images: Dictionary<String, UIImageView> = Dictionary()
    
    class func path(name: String) -> String {
        let finalPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        return finalPath + name
    }
    
    class func restriction(imageView:UIImageView){
        for (name, view) in self.images{
            if view == imageView{
                self.images[name] = UIImageView()
            }
        }
    }
    
    class func getImagen(name: String, imageView: UIImageView?, round: Bool, width: Int, height: Int) {
        guard let image = imageView else { return }

        let localImage = UIImage(contentsOfFile: self.path(name: name))
        let url = AppConstants.domainImage + "w" + String(width) + String(name)
        self.restriction(imageView: image)
        
        if localImage == nil{
            if self.images[name] == nil{
                self.images[name] = image
                let qos = DispatchQoS(qosClass: .userInitiated, relativePriority: 0)
                DispatchQueue.global(qos: qos.qosClass).async(execute: {
                    let imagenData = NSData(contentsOf: NSURL(string: url)! as URL)
                    DispatchQueue.main.async( execute: {
                        imagenData?.write(toFile: self.path(name: name), atomically: true)
                        if imagenData != nil{
                            let finalImage = UIImage(data: imagenData! as Data)
                            self.images[name]?.image = finalImage!
                        }
                        self.images.removeValue(forKey: name)
                    })
                })
            }
        }else{
            imageView?.image = localImage!
        }
    }
}
