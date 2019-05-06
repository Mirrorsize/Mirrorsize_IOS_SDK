//
//  MS_Methods.swift
//  MS_IOS_SDK
//
//  Created by Arup Chakraborty on 30/04/19.
//  Copyright © 2019 Mirrorsize. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion
public class MS_Methods: NSObject
{
    public static let motionManager = CMMotionManager()
    public static func Get_Device_Angle(completion:@escaping (Int?,Error?)->())
    {
        var angle:Int = 0
        motionManager.accelerometerUpdateInterval = 1
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {
            (accelerData:CMAccelerometerData?, error: Error?) in
            if (error != nil ) {
                return completion(angle,error)
            }
            else
            {
                let accelX:Double = (accelerData?.acceleration.x)!
                let accelY:Double = (accelerData?.acceleration.y)!
                let accelZ:Double = (accelerData?.acceleration.z)!
                var g:[Double] = [accelX, accelY, accelZ]
                let norm_of_g: Double = Double(sqrtf(Float(g[0]*g[0] + g[1]*g[1] + g[2]*g[2])))
                g[0] = (g[0] / norm_of_g)
                let a = (g[1] / norm_of_g)
                g[2] = (g[2] / norm_of_g)
                angle = Int((roundf(Float(acos(a)*91 / .pi))))
                return completion(angle,error)
            }
        })
    }
    
    public static func Stop_Accelerometer_Update()
    {
        motionManager.stopAccelerometerUpdates()
    }
    public static func MS_initialize_user(apikey: String, merchantId: String, productname: String, producttype: String, gender: String, completion: @escaping(Data?,URLResponse?,Error?)->())
    {
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        let parameters: [String: AnyObject] =
            [
                "apiKey"     : apikey      as AnyObject,
                "merchantid" : merchantId  as AnyObject,
                "productname": productname as AnyObject,
                "productType": producttype as AnyObject,
                "gender"     : gender as AnyObject
            ]
        let callURL = URL.init(string:"https://mobile.msways.com/api/ms_initialize_user")
        var request = URLRequest.init(url: callURL!)
        request.timeoutInterval = 600
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])else {return}
        request.httpBody = httpBody
        let dataTask = urlSession.dataTask(with: request) { (data,response,error) in
            return completion(data,response,error)
        }
        dataTask.resume()
        
    }
    public static func MS_Measurement_Process_loosefit(Userid: String, angle: Int, Height: Int, Weight: Int, Age: Int, gender:String,productname: String, username: String, usermobile: String,apikey: String, frontimage: String,sideimage:String, merchantId: String, modelName:String, completion:@escaping (Data?,Error?,URLResponse?)->())
    {
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        let parameters: [String: AnyObject] =
            [
                "userId"     : Userid as AnyObject,
                "angle"      : angle  as AnyObject,
                "height"     : Height as AnyObject,
                "weight"     : Weight as AnyObject,
                "age"        : Age    as AnyObject,
                "gender"     : gender as AnyObject,
                "productname": productname as AnyObject,
                "userName"   : username    as AnyObject,
                "userMobile" : usermobile  as AnyObject,
                "apikey"     : apikey      as AnyObject,
                "frontImage" : frontimage  as AnyObject,
                "sideImage"  : sideimage   as AnyObject,
                "merchantid" : merchantId  as AnyObject,
                "mobileModel": modelName   as AnyObject,
                "fitType"    : "loosefit"  as AnyObject
        ]
        let callURL = URL.init(string:"https://mobile.msways.com/api/ms_measurement_process")
        var request = URLRequest.init(url: callURL!)
        request.timeoutInterval = 600
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])else {return}
        request.httpBody = httpBody
        let dataTask = urlSession.dataTask(with: request) { (data,response,error) in
            return completion(data,error,response)
        }
        dataTask.resume()
    }
    public static func MS_Measurement_Process_tightfit(Userid: String, angle: Int, Height: Int, gender:String,productname: String, username: String, usermobile: String,apikey: String, frontimage: String,sideimage:String, merchantId: String, modelName:String, completion:@escaping (Data?,Error?,URLResponse?)->())
    {
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        let parameters: [String: AnyObject] =
            [
                "userId"     : Userid as AnyObject,
                "angle"      : angle  as AnyObject,
                "height"     : Height as AnyObject,
                "weight"     : "75"   as AnyObject,
                "age"        : "25"   as AnyObject,
                "gender"     : gender as AnyObject,
                "productname": productname as AnyObject,
                "userName"   : username    as AnyObject,
                "userMobile" : usermobile  as AnyObject,
                "apikey"     : apikey      as AnyObject,
                "frontImage" : frontimage  as AnyObject,
                "sideImage"  : sideimage   as AnyObject,
                "merchantid" : merchantId  as AnyObject,
                "mobilemodel": modelName   as AnyObject,
                "fitType"    : "tightfit"  as AnyObject
        ]
        print(parameters)
        let callURL = URL.init(string:"https://mobile.msways.com/api/ms_measurement_process")
        print(callURL!)
        var request = URLRequest.init(url: callURL!)
        request.timeoutInterval = 600
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])else {return}
        request.httpBody = httpBody
        let dataTask = urlSession.dataTask(with: request) { (data,response,error) in
            return completion(data,error,response)
        }
        dataTask.resume()
    }
    
    public static func MS_GetMesurement(apikey: String, Apparelname: String, Brandname: String, Gender: String, merchantId: String, productType:String, userId:String, completion: @escaping(Data?,Error?,URLResponse?)->())
    {
        let urlsession = URLSession(configuration: URLSessionConfiguration.default)
        let parameter: [String: AnyObject]  =
            [
                "apikey"     : apikey as AnyObject,
                "apparelName": Apparelname as AnyObject,
                "brandName"  : Brandname as AnyObject,
                "gender"     : Gender as AnyObject,
                "merchantID" : merchantId as AnyObject,
                "productname": "GET_MEASURED" as AnyObject,
                "productType": productType as AnyObject,
                "userID"     : userId as AnyObject
        ]
        let callurl = URL.init(string:"https://mobile.msways.com/api/ms_getRecommendation")
        var request = URLRequest.init(url: callurl!)
        request.httpMethod = "POST"
        request.timeoutInterval = 60
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else{return}
        request.httpBody = httpBody
        let datatask = urlsession.dataTask(with: request) { (data, response, error) in
            return completion(data,error,response)
        }
        datatask.resume()
    }
    
    public static func MS_Get_Size_Recommendation(apikey: String, Apparelname: String, Brandname: String, Gender: String, merchantId: String, productType:String, userId:String, completion: @escaping(Data?,Error?,URLResponse?)->())
    {
        let urlsession = URLSession(configuration: URLSessionConfiguration.default)
        let parameter: [String: AnyObject]  =
            [
                "apikey"     : apikey as AnyObject,
                "apparelName": Apparelname as AnyObject,
                "brandName"  : Brandname as AnyObject,
                "gender"     : Gender as AnyObject,
                "merchantID" : merchantId as AnyObject,
                "productname": "SIZE2FIT" as AnyObject,
                "productType": productType as AnyObject,
                "userID"     : userId as AnyObject
        ]
        let callurl = URL.init(string:"https://mobile.msways.com/api/ms_getRecommendation")
        var request = URLRequest.init(url: callurl!)
        request.httpMethod = "POST"
        request.timeoutInterval = 60
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else{return}
        request.httpBody = httpBody
        let datatask = urlsession.dataTask(with: request) { (data, response, error) in
            return completion(data,error,response)
        }
        datatask.resume()
    }
}
