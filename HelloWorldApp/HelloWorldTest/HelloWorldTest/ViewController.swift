//
//  ViewController.swift
//  HelloWorldTest
//
//  Created by Simeonov, Ivan (Associate Software Developer) on 08/08/2016.
//  Copyright © 2016 Simeonov, Ivan (Associate Software Developer). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
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
        print("please work!")
        //Mak0e Msearch call to find adevices connected
        let socketConnection: SocketConnection = SocketConnection()
        
        socketConnection.getConnection();
        //get ip address of device you want to connect to 
        //connect to the device and send command to the box
        
    }


}

