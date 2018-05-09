//
//  PreviewMenuViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class PreviewMenuViewController: UIViewController {

    @IBOutlet weak var collectionView:UICollectionView?
    @IBOutlet weak var lblImageCount:UILabel!
    
    var currentIndex:Int = 0
    var imageList:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        self.lblImageCount.text = "\(self.currentIndex + 1) / \(self.imageList!.count)"
       
        //self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
     
        GCD.async(.Main) {
            if self.currentIndex > 0 {
                let indexPath = IndexPath(item: self.currentIndex, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            }
        }
        
        
    }
    
    @IBAction func actionBack(_ sender:UIButton){
        if let container = self.mainContainer{
            container.navigationbarHeight.constant = 54
            container.bottomViewHeight.constant = 60
        }
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionNext(_ sender:UIButton){
//        if(self.currentIndex < UserLogin.foodingAdds.count - 1){
//            self.currentIndex = self.currentIndex + 1
//            let indexPath = IndexPath(item: self.currentIndex, section: 0)
//            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//
//            self.lblImageCount.text = "\(self.currentIndex + 1) / \(UserLogin.foodingAdds.count)"
//        }
    }
    @IBAction func actionPrevious(_ sender:UIButton){

//        if(self.currentIndex > 0 && UserLogin.foodingAdds.count > 0){
//            self.currentIndex = self.currentIndex - 1
//            let indexPath = IndexPath(item: self.currentIndex, section: 0)
//            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//            self.lblImageCount.text = "\(self.currentIndex + 1) / \(UserLogin.foodingAdds.count)"
//        }
    }

   
}
extension PreviewMenuViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let _ = self.imageList{
            return 1
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageList!.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.size.width, height: self.collectionView!.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.PreviewMenuCollectionViewCell, for: indexPath) as! PreviewMenuCollectionViewCell
        cell.configure(image: self.imageList![indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = self.collectionView?.indexPathsForVisibleItems.first{
            self.currentIndex = indexPath.item
             self.lblImageCount.text = "\(self.currentIndex + 1) / \(self.imageList!.count)"
        }
        
    }
   
    
}

