//
//  ViewController.swift
//  CollectionView_sari
//
//  Created by sTagRD on 2018/1/18.
//  Copyright © 2018年 sTagRD. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @objc var items : NSArray = [UIImage(named:"电话挂机.png")!,UIImage(named:"到店地图(1).png")!,UIImage(named:"到店地图(2).png")!,UIImage(named:"到店地图(3).png")!,UIImage(named:"到店地图(4).png")!,UIImage(named:"到店地图(5).png")!,UIImage(named:"到店地图(6).png")!,UIImage(named:"到店地图(7).png")!,UIImage(named:"到店地图.png")!];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count * 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identity: String = "CollectionCell"
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: identity, for: indexPath)
        let imageView = cell.viewWithTag(101) as! UIImageView
        imageView.image = items.object(at: (indexPath as NSIndexPath).row%9) as? UIImage
        return cell
    }
}

