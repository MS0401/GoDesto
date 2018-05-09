//
//  LandingViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 16/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var colllectionViewTop: NSLayoutConstraint!
    @IBOutlet weak var pageControl:UIPageControl!
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var btnRegister:UIButton!
    @IBOutlet weak var btnLogin:UIButton!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblSubtitle:UILabel!
    
    
    var isFromSideMenu:Bool = false
    var isComingFromDishDetail:Bool? = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.btnLogin.layer.cornerRadius = 10
        self.btnRegister.layer.cornerRadius = 10
        
        if let splash = Global.shared.splashInfo{
            self.pageControl.numberOfPages = splash.landingImages.count
        }else{
            self.pageControl.numberOfPages = 0
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func actionLogin(_ sender:UIButton){
        let storyboard = UIStoryboard.init(name: StoryboardName.Registration, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.LoginViewController) as? LoginViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func actionRegister(_ sender:UIButton){
        let storyboard = UIStoryboard.init(name: StoryboardName.Registration, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.SignupViewController) as? SignUpViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func actionSkip(_ sender:UIButton){
        let storyboard = UIStoryboard.init(name: StoryboardName.Main, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.RevealViewController) as? SWRevealViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
extension LandingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let splash = Global.shared.splashInfo{
                  return splash.landingImages.count//UserLogin.foodingAdds.count
        }else{
            return 0
        }
  
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height+20)
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
        cell.configure(image: Global.shared.splashInfo!.landingImages[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let indexPath = self.collectionView.indexPathsForVisibleItems.first{
            self.pageControl.currentPage = indexPath.item
        }
        
    }
    
}

