//
//  UIImageView+extensions.swift
//  FolledoUserAuth
//
//  Created by Macbook Pro 15 on 10/12/19.
//  Copyright © 2019 SamuelFolledo. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(fromURL url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) { //method that will download its own image from a url
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                //let mimeType = response?.mimeType, mimeType.hasPrefix("image"), //error here
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
                DispatchQueue.main.async() {
                    self.image = image
                }
            }.resume()
    }
    func downloaded(fromLink link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) { //method that will download its own image from a url
        guard let url = URL(string: link) else { return }
        downloaded(fromURL: url, contentMode: mode)
    }
    func rounded(){
        self.layer.cornerRadius = self.frame.height / 2 //half of the imageView to make it round
        self.layer.masksToBounds = true
    }
}
