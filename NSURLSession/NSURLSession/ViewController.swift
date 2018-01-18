//
//  ViewController.swift
//  NSURLSession
//
//  Created by sTagRD on 2018/1/18.
//  Copyright © 2018年 sTagRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    //主线中请求
        request()
        
        
        
        print("123")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var buttonAction: UIButton!
    
    @IBAction func buttonActions(_ sender: Any) {
        buttonAction.isSelected = !buttonAction.isSelected
    }
    
    func request() -> Void {
        let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
        sessionConfig.allowsCellularAccess = false
        //只接受json请求
        sessionConfig.httpAdditionalHeaders = ["Accept:":"application/json"]
        //超时设置
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 60.0
        sessionConfig.httpMaximumConnectionsPerHost = 1
        //创建连接
        let session = URLSession(configuration:sessionConfig)
        session.dataTask(with: URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Barcelona,es&appid=ac02dc102cc17b974cd84206048d97d8")!, completionHandler: {(data, response, error) in
            let dic:NSDictionary = ((try? JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions(rawValue: 0))) as? NSDictionary)! as NSDictionary
            
            if dic.count == 0 {
                return
            }
            print(dic)
        }).resume()
    }
}

