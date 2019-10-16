//
//  Extensions.swift
//  Movie Search App
//  Copyright © 2019 Samuel Kudadji. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init!(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
}

extension UIImage {
    enum ImageCatalogue : String {
        case twitter = "twitter"
        case placeHolder = "pH"
    }
    
    convenience init!(imageCatalogue: ImageCatalogue) {
        self.init(named: imageCatalogue.rawValue)
    }
}

private let imageCache = NSCache<NSString,NSData>()
extension UIImageView {
    func setupView() {
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
    
    func getCachedImages(_ url: URL?) {
        var imageData = Data()
        
        // check if image is cached, then retrieve it
        if let absoluteString = url?.absoluteString, let data = imageCache.object(forKey: absoluteString as NSString) as Data? {
            imageData = data
        }
        else {
            
            // if not, then set placeholder & download image
             DispatchQueue.main.async {
                self.image = .init(imageCatalogue: .placeHolder)
            }
            makeAPICall(url!) { data in
                guard let urlString = url?.absoluteString else {
                    return
                }
                imageData = data
                imageCache.setObject(imageData as NSData, forKey: urlString as NSString)
            }
        }
        
        //set image to data content
        DispatchQueue.main.async {
            self.image = UIImage.init(data: imageData)
        }
    }
}

extension UILabel {
    func setupLabel(font fontAndSize: UIFont, color textColor: UIColor) {
        self.font = fontAndSize
        self.textColor = textColor
        self.textAlignment = .left
        self.numberOfLines = 10
        self.clipsToBounds = true
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?,  bottom: NSLayoutYAxisAnchor? , padding: UIEdgeInsets, size: CGSize) {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
