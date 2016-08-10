//
//  ResponseDelegate.swift
//  HelloWorldTest
//
//  Created by Simeonov, Ivan (Associate Software Developer) on 09/08/2016.
//  Copyright © 2016 Simeonov, Ivan (Associate Software Developer). All rights reserved.
//

import Foundation

protocol ResponseDelegate  {
    func didReceiveResponse(data:String)
}