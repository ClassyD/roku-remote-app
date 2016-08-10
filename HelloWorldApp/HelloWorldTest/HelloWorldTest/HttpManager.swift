//
//  HttpManager.swift
//  HelloWorldTest
//
//  Created by Olaniyi, Olorunfemi (Associate Software Developer) on 09/08/2016.
//  Copyright © 2016 Simeonov, Ivan (Associate Software Developer). All rights reserved.
//

import Foundation

public class HttpManager
{
    var baseURL: String = ""
    var getInfoEndpoint : String  = "query/device-info"
    var getKeyDownEndPoint : String =  "keypress/Down"
    var getKeyUpEndPoint : String = "keypress/Up"
    var getKeyLeftEndPoint : String = "keypress/Left"
    var getKeyRightEndPoint : String = "keypress/Right"
    var responseDelegate:ResponseDelegate!

    
    init(urls: String){
        self.baseURL = urls
        print(baseURL)
    }
    
    public func callGetInfoEndPoint()
    {
        var url = self.baseURL + self.getInfoEndpoint
        print(url);
        var request = NSMutableURLRequest(URL: NSURL(string:url)!)
        let session = NSURLSession.sharedSession()
        
        request.HTTPMethod = "GET"
        let _: NSError?
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, err -> Void in
            print("Response: \(response)")
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(String(strData))
            self.responseDelegate.didReceiveXMLInfo((strData?.dataUsingEncoding(NSUTF8StringEncoding))!)
        })
        
        task.resume()
    }
    
    
    
    public func callKeyDownEndPoint()
    {
        
        var url = baseURL + getKeyDownEndPoint
        let request = NSMutableURLRequest(URL: NSURL(string:url)!)
        let session = NSURLSession.sharedSession()
        
        request.HTTPMethod = "POST"
        let _: NSError?
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, err -> Void in
            print("Response: \(response)")
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
        })
        task.resume()
        
    }
    
    public func sendRequest(operation: String){
        switch operation {
            case "UP":
                callEndPoint(getKeyUpEndPoint, requesType: "POST")
            case "DOWN":
                callEndPoint(getKeyDownEndPoint, requesType: "POST")
            case "LEFT":
                callEndPoint(getKeyLeftEndPoint, requesType: "POST")
            case "RIGHT":
                callEndPoint(getKeyRightEndPoint, requesType: "POST")
            default:
                break
        }
    }
    
    public func callEndPoint(endPoint: String, requesType: String)
    {
        
        var url = baseURL + endPoint
        let request = NSMutableURLRequest(URL: NSURL(string:url)!)
        let session = NSURLSession.sharedSession()
        
        request.HTTPMethod = requesType
        let _: NSError?
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, err -> Void in
            print("Response: \(response)")
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
        })
        task.resume()

    }

    
    
    
    
}