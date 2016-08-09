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
    var broadcastAddress = "239.255.255.250"
    var broadcastPort:UInt16 = 1900
    var mySocket: GCDAsyncUdpSocket!
    var mySocketRec: GCDAsyncUdpSocket!
    var error: NSError?
    var message: NSData

    init(){
    
    }
    
    private func getConnection()
    {
        //DO something
        mySocket = GCDAsyncUdpSocket(delegate: self, delegateQueue: dispatch_get_main_queue());
        message = NSData(base64EncodedString: <#T##String#>, options: <#T##NSDataBase64DecodingOptions#>)
        mySocket.sendData(<#T##data: NSData##NSData#>, toHost: <#T##String#>, port: <#T##UInt16#>, withTimeout: <#T##NSTimeInterval#>, tag: <#T##Int#>)
        
    }
    
    
}
