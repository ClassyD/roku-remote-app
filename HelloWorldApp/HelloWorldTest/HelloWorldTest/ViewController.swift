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
     var mySocket: GCDAsyncUdpSocket!
    let broadcastAddress: String = "239.255.255.250"
    let broadcastPort:UInt16 = 1900
    var error : NSError?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "sup?";
        print("hello world its david");
        
        
        //DO something
        let mSearchString: NSData = "M-SEARCH * HTTP/1.1\r\nHOST: 239.255.255.250:1900\r\nMAN: \"ssdp:discover\"\r\nMX: 3\r\nST: roku:ecp\r\nUSER-AGENT: iOS UPnP/1.1 TestApp/1.0\r\n\r\n".dataUsingEncoding(NSUTF8StringEncoding)!
        
        mySocket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue());
        
        
        mySocket.sendData(mSearchString, toHost: broadcastAddress, port: broadcastPort, withTimeout: 3, tag: 0)
        
        
        do{
            try mySocket.bindToPort(broadcastPort)
            try mySocket.joinMulticastGroup(broadcastAddress)
            try mySocket.beginReceiving()
        }
        catch {
            print("I failed!!")
        }
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
        
        //Mak0e Msearch call to find devices connected
        let socketConnection: SocketConnection = SocketConnection()
        
        socketConnection.getConnection()
        //get ip address of device you want to connect to 
        //connect to the device and send command to the box
        
    }
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!, withFilterContext filterContext: AnyObject!) {
        
        var host: NSString?
        var port1: UInt16 = 0
        GCDAsyncUdpSocket.getHost(&host, port: &port1, fromAddress: address)
        print("From \(host!)")

        
        let gotdata: NSString = NSString(data: data!, encoding: NSUTF8StringEncoding)!
        print(gotdata)
        
        mySocket.close()
        
    }
    
    func socket(sock: GCDAsyncSocket!, didConnectToHost host: String!, port: UInt16) {
        print("didConnectToHost")
    }
    
    
    func socketDidDisconnect(sock: GCDAsyncSocket!, withError err: NSError!) {
        print("socketDidDisconnect")
    }
    



}

