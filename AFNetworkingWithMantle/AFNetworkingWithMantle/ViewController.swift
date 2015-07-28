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
    
    @IBOutlet weak var txtvReturnResponse: UITextView!

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
    }

}

