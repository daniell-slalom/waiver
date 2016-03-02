//
//  NWWaiverViewController.swift
//  Waiver
//
//  Created by Lee, Daniel (ETW) on 3/1/16.
//  Copyright © 2016 Lee, Daniel (ETW). All rights reserved.
//

import UIKit

public class NWWaiverViewController: UIViewController {

    @IBOutlet weak var waiverWebview: UIWebView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.redColor()
        // Do any additional setup after loading the view.
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public static func fromBundleXib()->NWWaiverViewController{
        var bundle = NSBundle(forClass: self)
        var vc = NWWaiverViewController(nibName: "NWWaiverViewController", bundle: bundle)
        
        return vc
    }
    @IBAction func declineBtnTapped(sender: AnyObject) {
    }
    
    @IBAction func acceptBtnTapped(sender: AnyObject) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
