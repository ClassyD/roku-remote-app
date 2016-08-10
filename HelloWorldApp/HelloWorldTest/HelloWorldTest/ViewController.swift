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


class ViewController: UIViewController, UITextFieldDelegate, GCDAsyncUdpSocketDelegate, ResponseDelegate  {
    
    
    @IBOutlet weak var rokuDeviceName: UILabel!
    var socketConnection : SocketConnection!
    var httpManager: HttpManager!
    var xmlParser: NSXMLParser!
    @IBOutlet weak var hiddenTextfield: UITextField!
    var keys = [UIKeyCommand]()
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenTextfield.delegate = self
        self.hiddenTextfield.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
      
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
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
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let  char = string.cStringUsingEncoding(NSUTF8StringEncoding)!
        let isBackSpace = strcmp(char, "\\b")
        if (isBackSpace == -92) {
            print("Backspace was pressed")
        }
        return true
    }
    
    
    func textFieldDidChange(textField: UITextField) {
        print(textField.text!.characters.last)
        let char = textField.text!.characters.last
        
        //httpManager.callKeyboardCharEndPoint(String(char!))
    }
    
//    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//       
//        print(textField.text!.characters.last)
//        
//        return true
//    }
    
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
        let deviceStr = "Device name: " + xmlDoc.root["user-device-name"].value!
        dispatch_async(dispatch_get_main_queue(), {
            self.rokuDeviceName.text = deviceStr
        })
    }
    
    @IBAction func keyboardButton(sender: AnyObject) {
        hiddenTextfield.becomeFirstResponder()
    }
    
    @IBAction func okButton(sender: AnyObject) {
        if (httpManager != nil)
        {
            httpManager.sendRequest("OK")
        }
    }
    
    @IBAction func backButton(sender: AnyObject) {
        if (httpManager != nil)
        {
            httpManager.sendRequest("BACK")
        }
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

