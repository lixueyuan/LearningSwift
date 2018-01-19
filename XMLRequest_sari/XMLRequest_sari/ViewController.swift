//
//  ViewController.swift
//  XMLRequest_sari
//
//  Created by sTagRD on 2018/1/19.
//  Copyright © 2018年 sTagRD. All rights reserved.
//

import UIKit
import Alamofire
import SexyJson

struct LXY:SexyJson {
    var base: String!
    
    public mutating func sexyMap(_ map: [String : Any]) {
        base <<< map["base"]
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var contentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置tableview
        //定义网络请求
//        let url = URL(string: "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=10/xml")
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Barcelona,es&appid=ac02dc102cc17b974cd84206048d97d8")
        Alamofire.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (data) in
            print(data)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

