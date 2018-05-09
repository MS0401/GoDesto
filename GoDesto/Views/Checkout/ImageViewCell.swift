//
//  ImageCollectionViewCell.swift
//  GoDesto
//
//  Created by Le Abid on 20/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ImageViewCell: BaseCollectionViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    func configureView(image:String)  {
        self.setImageWithUrl(imageView: self.imgView, url: image)
    }

}
