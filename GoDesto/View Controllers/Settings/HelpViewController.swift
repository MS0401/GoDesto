//
//  HelpViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 4/26/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HelpViewController: BaseViewController, TopBarDelegate {

    @IBOutlet weak var webViewHelp:UIWebView!
    @IBOutlet weak var mainImgV:UIImageView!
    let helpScreenVM : HelpScreenViewModel = HelpScreenViewModel()

    
    func createRequestMessage() -> RequestMessage {
        
        let request = RequestMessage()
        return request
    }

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        helpScreenVM.viewController = self
        helpScreenVM.getAppHelp()
    }
    
    func CallHelpAPIToPopulateData() {
        
        let headers = [
            "Cache-Control": "no-cache"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://www.godesto.com/AdminApps/app_help")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in

        })
        
        dataTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer{
            container.navigationbarHeight.constant = 44
            container.lblTitle.text = "Help"
            container.lblSubTitle.text = ""
            container.lblTitle.textColor = UIColor.white
            container.lblSubTitle.textColor = UIColor.white
            container.delegate = self
            container.btnMap.isHidden = true
            container.btnMenu.isHidden = false

        }
    }
    func actionCallBackMoveBack() {
        if let container = self.mainContainer{
            container.bottomViewHeight.constant = 60
        }
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
