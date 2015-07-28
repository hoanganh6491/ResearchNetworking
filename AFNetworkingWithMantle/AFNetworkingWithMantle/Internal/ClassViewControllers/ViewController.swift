//
//  ViewController.swift
//  AFNetworkingWithMantle
//
//  Created by  on 7/28/15.
//  Copyright (c) 2015 Framgia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfURLInput: UITextField!
    @IBOutlet weak var btnRequestStart: UIButton!
    

    @IBOutlet weak var lblResponseTitle: UILabel!
    
    @IBOutlet weak var lblResponseItemsTitle: UILabel!
    @IBOutlet weak var lblResponseItemsUserName: UILabel!
    
    @IBOutlet weak var lblResponseMoreItemsTitle: UILabel!
    @IBOutlet weak var lblResponseMoreItemsID: UILabel!
    

    @IBOutlet weak var lblResponseMoreItemsTitle2nd: UILabel!
    @IBOutlet weak var lblResponseMoreItemsID2nd: UILabel!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: 
    @IBAction func btnRequestStartDidTap(sender: AnyObject) {
        //cast value to request obj
        var request: ResearchNetworkingRequest = ResearchNetworkingRequest()
        request.requestURL = self.tfURLInput.text
        
        //HUD
        SVProgressHUD.show()
        
        //Calling API
        APIController.callApiSomething(request, callBack: { (success: Bool, result: AnyObject!) -> Void in
            //response
            SVProgressHUD.dismiss()
            
            //get object to use
            var thisObject: ResearchNetworkingModel = result as! ResearchNetworkingModel
            
            self.lblResponseTitle.text = thisObject.title
            
            var items: NSArray = thisObject.items
            var firstItem: ResearchNetworkingItems = items.objectAtIndex(0) as! ResearchNetworkingItems
            self.lblResponseItemsTitle.text = String(format: "%.0f", firstItem.iDProperty)
            self.lblResponseItemsUserName.text = firstItem.userName
            
            var moreitems: NSArray = firstItem.moreItems
            var firstMoreItem: ResearchNetworkingMoreItems = moreitems.objectAtIndex(0) as! ResearchNetworkingMoreItems
            self.lblResponseMoreItemsTitle.text = firstMoreItem.title
            self.lblResponseMoreItemsID.text = String(format: "%.0f", firstMoreItem.iDProperty)
            
            var secondMoreItem: ResearchNetworkingMoreItems = moreitems.objectAtIndex(1) as! ResearchNetworkingMoreItems
            self.lblResponseMoreItemsTitle2nd.text = secondMoreItem.title
            self.lblResponseMoreItemsID2nd.text = String(format: "%.0f", secondMoreItem.iDProperty)
        })
    }

}

