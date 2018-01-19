//
//  ViewController.swift
//  XMLRequest_sari
//
//  Created by sTagRD on 2018/1/19.
//  Copyright © 2018年 sTagRD. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct LxyModel {
    var humidity:Double!
    var temp_min:Double!
    var temp:Double!
    var pressure:Double!
    
    init(jsonData: JSON) {
        humidity = jsonData["humidity"].doubleValue
        temp_min = jsonData["temp_min"].doubleValue
        temp = jsonData["temp"].doubleValue
        pressure = jsonData["pressure"].doubleValue
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
            if let value = data.result.value {
                let jsonStr = JSON(value)
                //json 转模型    这里的模型是个struct结构体
                let model = LxyModel.init(jsonData: jsonStr["main"])
                print(model.temp)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

