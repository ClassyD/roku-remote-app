//
//  SocketConnection.swift
//  HelloWorldTest
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 08/08/2016.
//  Copyright © 2016 Simeonov, Ivan (Associate Software Developer). All rights reserved.
//

import Foundation
import CocoaAsyncSocket


class SocketConnection : GCDAsyncUdpSocketDelegate {
    // class definition goes here
     var mySocket: GCDAsyncUdpSocket!
   
  
    
    init(){
    
    }
    
    
    //    M-SEARCH * HTTP/1.1
    //    HOST: 239.255.255.250:1900
    //    MAN: "ssdp:discover"
    //    MX: seconds to delay response
    //    ST: urn:dial-multiscreen-org:service:dial:1
    //    USER-AGENT: OS/version product/version
    
    public func getConnection()
    {
        let broadcastAddress: String = "239.255.255.250"
        let broadcastPort:UInt16 = 1900
        var error : NSError?
       
    
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
        
       
      

        
    }
    
    //Callbacks
    
    func udpSocket(sock: GCDAsyncUdpSocket!, didReceiveData data: NSData!, fromAddress address: NSData!, withFilterContext filterContext: AnyObject!) {
        
       print(data)
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
