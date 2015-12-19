//
//  ViewController.swift
//  SwiftTestDemo
//
//  Created by Mr.LuDashi on 15/11/26.
//  Copyright © 2015年 ZeluLi. All rights reserved.
//

import UIKit

let IMAGE_NAME = "imageName"
let GIRL_NAME = "girlName"

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EditViewControllerDelegate {

    @IBOutlet var myTableView: UITableView!
    private var selectIndexPath: NSIndexPath?
    private var dataSource:Array<Dictionary<String, String>>?
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        self.createSourceData()
    }
    
    //-----------创建Table要显示的数据-------------------------
    func createSourceData() {
        self.dataSource = Array<Dictionary<String, String>>();
        for (var i = 0; i<10; i++) {
            let imageName:String = "00\(i).jpg"
            let girlName:String = "美女\(i + 1)"
            self.dataSource?.append([IMAGE_NAME:imageName, GIRL_NAME:girlName])
        }
    }
    
    //-----------EditViewControllerDelegate------------------
    
    func fetchGirlName(name: String) {
        
        if selectIndexPath != nil {
            //获取当前点击Cell的索引
            let index = (selectIndexPath?.row)!
            
            //更新数据源中相应的数据
            self.dataSource![index][GIRL_NAME] = name
            
            //重载TableView
            self.myTableView.reloadData()
        }
        
    }
    
    
    //-----------UITableViewDelegate------------------
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //记录当前点击的IndexPath
        self.selectIndexPath = indexPath
        
        //获取当前点击的Cell对象
        let currentSelectCell:BeautifulGrillCell? = self.myTableView.cellForRowAtIndexPath(indexPath) as? BeautifulGrillCell
        
        //从storyboard中实例化编辑视图控制器
        let editViewController:EditViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("EditViewController") as! EditViewController
        
        //指定编辑视图控制器委托代理对象
        editViewController.delegate = self
        
        //把点击Cell上的值传递给编辑视图控制器
        if currentSelectCell != nil {
           editViewController.girlOldName = currentSelectCell!.girlNameLable.text!
        }
        
        //push到编辑视图控制器
        self.navigationController?.pushViewController(editViewController, animated: true)
    }
    
    
    //-----------UITableViewDataSource----------------
    /**
    - parameter tableView: 当前要显示的TableView
    
    - returns:  TableView中Section的个数
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /**
     返回每个Section中的Cell个数
     
     - parameter tableView: 当前显示的TableView
     - parameter section:   对应的Section
     
     - returns: 对应Section中cell的个数
     */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.dataSource!.count
    }
    
    /**
     返回要显示的Cell
     
     - parameter tableView: cell要显示的TableView
     - parameter indexPath: cell的索引信息
     
     - returns: 返回要显示的Cell对象
     */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell:BeautifulGrillCell = self.myTableView.dequeueReusableCellWithIdentifier("BeautifulGrillCell", forIndexPath: indexPath) as! BeautifulGrillCell
        
        let tempItem:Dictionary? = self.dataSource![indexPath.row]
        
        if tempItem != nil {
            let imageName:String = tempItem![IMAGE_NAME]!
            cell.girlImageView.image = UIImage(named: imageName)
            
            let girlName:String = tempItem![GIRL_NAME]!
            cell.girlNameLable.text = girlName
        }
        
        return cell
    }
}

