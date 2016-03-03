//
//  NWWaiverViewController.swift
//  Waiver
//
//  Created by Lee, Daniel (ETW) on 3/1/16.
//  Copyright © 2016 Lee, Daniel (ETW). All rights reserved.
//

import UIKit

public protocol NWWaiverCompletedDelegate{
    func customerDidAccept(userProfile: UserProfileProtocol)
    func customerDidDecline()
}

public class NWWaiverViewController: UIViewController {

    public var delegate: NWWaiverCompletedDelegate! = nil
    var waiverUrl: String! = nil
    var locale: String! = nil
    var userProfile: UserProfileProtocol! = nil

    @IBOutlet weak var waiverWebview: UIWebView!
    
    public override func viewDidLoad() {
        self.title = "Waiver"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    public override func viewDidAppear(animated: Bool) {
        self.loadWaiverWebview()
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - IB outlets
    @IBAction func declineBtnTapped(sender: AnyObject) {
        if(delegate != nil){
            delegate.customerDidDecline()
        }
        self.dismissSelf()
    }

    @IBAction func acceptBtnTapped(sender: AnyObject) {
        if(delegate != nil){
            delegate.customerDidAccept(self.userProfile)
        }
        self.dismissSelf()
    }
    
    func dismissSelf(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    //MARK: - public interface
    
    /**
     * Create this controller from the bundle Xib file.
     * This is a helper method to get the View Controller with default interface.
     */
    public static func fromBundleXib()->NWWaiverViewController{
        let bundle = NSBundle(forClass: self)
        let vc = NWWaiverViewController(nibName: "NWWaiverViewController", bundle: bundle)

        return vc
    }
    

    /**
    * Set the set the location of the waiver as well as the locale for display.
    */
    public func setWaiverUrlAndLocale(url: String, locale: String){
        self.waiverUrl = url
        self.locale = locale
    }

    /**
    * Set the user profile so we can get user information.
    */
    public func setUserProfile(userProfile: UserProfileProtocol){
        self.userProfile = userProfile
    }

    // MARK: - Helper
    private func loadWaiverWebview(){
        let url = NSURL(string: self.waiverUrl)
        let request = NSURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 3600000)
        self.waiverWebview.loadRequest(request)
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
