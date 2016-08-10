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
   

    
    init(urls: String){
        print(baseURL)
        self.baseURL = urls
    }
    
    public func callGetInfoEndPoint()
    {
        var url = baseURL + getInfoEndpoint
        let request = NSMutableURLRequest(URL: NSURL(string:url)!)
        let session = NSURLSession.sharedSession()
        
        request.HTTPMethod = "GET"
        let _: NSError?
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, err -> Void in
            print("Response: \(response)")
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
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
    
    public func callKeyUpPoint()
    {
        
        var url = baseURL + getKeyUpEndPoint
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

    
    
    
    
}