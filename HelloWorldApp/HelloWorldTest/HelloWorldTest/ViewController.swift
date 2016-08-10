//
//  ViewController.swift
//  HelloWorldTest
//
//  Created by Simeonov, Ivan (Associate Software Developer) on 08/08/2016.
//  Copyright © 2016 Simeonov, Ivan (Associate Software Developer). All rights reserved.
//

import UIKit
import CocoaAsyncSocket
import AEXML

class ViewController: UIViewController, GCDAsyncUdpSocketDelegate, ResponseDelegate  {
    
    
    @IBOutlet weak var rokuDeviceName: UILabel!
    var socketConnection : SocketConnection!
    var httpManager: HttpManager!
    var xmlParser: NSXMLParser!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        rokuDeviceName.text = "Connected to: " + data
        socketConnection.stopConnection()
        httpManager = HttpManager(urls: data)
        httpManager.responseDelegate = self
        httpManager.callGetInfoEndPoint()
        
    }
    
    func didReceiveXMLInfo(data: NSData){
        let xmlDoc = try! AEXMLDocument(xmlData: data)
        print("data:    " + xmlDoc.xmlString)
        print(xmlDoc.root["user-device-name"].value)
        rokuDeviceName.text = rokuDeviceName.text! + "\n Device name: " + xmlDoc.root["user-device-name"].value!
    }
    
    
    @IBAction func upButton(sender: AnyObject) {
        if (httpManager != nil)
        {
            httpManager.sendRequest("UP")
        }
    }
    
    @IBAction func downButton(sender: AnyObject) {
        if (httpManager != nil)
        {
            httpManager.sendRequest("DOWN")
        }
    }
    
    @IBAction func leftButton(sender: AnyObject) {
        if (httpManager != nil)
        {
            httpManager.sendRequest("LEFT")
        }
    }
    
    @IBAction func rightButton(sender: AnyObject) {
        if (httpManager != nil)
        {
            httpManager.sendRequest("RIGHT")
        }
    }
}

