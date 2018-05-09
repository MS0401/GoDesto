//
//  PreviewMenuCollectionViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class PreviewMenuCollectionViewCell: BaseCollectionViewCell,UIScrollViewDelegate {
    
    @IBOutlet weak var imgMenu: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = 3
        self.scrollView.contentInset = .zero
        self.scrollView.scrollIndicatorInsets = .zero
        self.scrollView.contentOffset = CGPoint(x: 0.0, y: 0.0)
        
        
    }
    func configure(image:String)  {
        self.setImageWithUrl(imageView: self.imgMenu, url: BASE_PHOTO_URL + image)
        //self.imgMenu.image = UIImage(named: image)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imgMenu
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return  self.imgMenu
    }
    
}
