//
//  ViewController.swift
//  HelloWorldTest
//
//  Created by Simeonov, Ivan (Associate Software Developer) on 08/08/2016.
//  Copyright © 2016 Simeonov, Ivan (Associate Software Developer). All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class ViewController: UIViewController, GCDAsyncUdpSocketDelegate, ResponseDelegate  {
    
    
    var socketConnection : SocketConnection!
    var httpManager: HttpManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func stopConnection(sender: AnyObject) {
        socketConnection.stopConnection()
        
        let alert = UIAlertController(title: "Alert", message: "You killed the Socket!!", preferredStyle:UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func searchButton(sender: AnyObject) {
        
        socketConnection = SocketConnection()
        socketConnection.responseDelegate = self
        //get ip address of device you want to connect to 
        //connect to the device and send command to the box
        
    }
    
    func didReceiveResponse(data:String) {
        print("Recieved data:\(data)")
        
        let trimmedString = data.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )

        httpManager = HttpManager(urls: trimmedString)
        httpManager.callGetInfoEndPoint()
        
    }
    
    @IBAction func upButton(sender: AnyObject) {
        if (httpManager != nil)
        {
         httpManager.callKeyUpPoint()
        }
    }
    
    @IBAction func downButton(sender: AnyObject) {
        if (httpManager != nil)
        {
            httpManager.callKeyDownEndPoint()
        }

    }
    func socket(sock: GCDAsyncSocket!, didConnectToHost host: String!, port: UInt16) {
        print("didConnectToHost")
    }
    
    
    func socketDidDisconnect(sock: GCDAsyncSocket!, withError err: NSError!) {
        print("socketDidDisconnect")
    }
    



}

