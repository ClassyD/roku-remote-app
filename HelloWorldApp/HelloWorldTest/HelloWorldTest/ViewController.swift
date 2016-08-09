//
//  ViewController.swift
//  HelloWorldTest
//
//  Created by Simeonov, Ivan (Associate Software Developer) on 08/08/2016.
//  Copyright © 2016 Simeonov, Ivan (Associate Software Developer). All rights reserved.
//

import UIKit
import CocoaAsyncSocket

class ViewController: UIViewController,GCDAsyncUdpSocketDelegate  {
    
    @IBOutlet weak var myLabel: UILabel!
    
    var socketConnection : SocketConnection!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "sup?";
        print("hello world its david");
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myButtonClick(sender: AnyObject) {
        myLabel.text = "Hello World";
    }
    
    @IBAction func searchButton(sender: AnyObject) {
        
        socketConnection = SocketConnection()
        
        //get ip address of device you want to connect to 
        //connect to the device and send command to the box
        
    }
    
    
    func socket(sock: GCDAsyncSocket!, didConnectToHost host: String!, port: UInt16) {
        print("didConnectToHost")
    }
    
    
    func socketDidDisconnect(sock: GCDAsyncSocket!, withError err: NSError!) {
        print("socketDidDisconnect")
    }
    



}

