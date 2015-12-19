//
//  EditViewController.swift
//  SwiftTestDemo
//
//  Created by Mr.LuDashi on 15/12/18.
//  Copyright © 2015年 ZeluLi. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate: NSObjectProtocol{
    func fetchGirlName(name:String)
}

class EditViewController: UIViewController {
    
    var girlOldName:String?
    weak var delegate: EditViewControllerDelegate?
    @IBOutlet var girlNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.girlOldName != nil {
            self.girlNameTextField.text = self.girlOldName!
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        let name:String! = self.girlNameTextField.text
        if  name != "" {
            if delegate != nil {
                delegate!.fetchGirlName(name)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        print("释放")
    }
}
