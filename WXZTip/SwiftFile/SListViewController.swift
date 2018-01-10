//
//  SListViewController.swift
//  WXZTip
//
//  Created by wxz on 2017/9/21.
//  Copyright © 2017年 wxz. All rights reserved.
//

import UIKit
class SListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle,reuseIdentifier: nil)
        
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.backToPrevious();
    }
    
    var table = UITableView()
    var tableData = ["宝宝0","宝宝1","宝宝2","宝宝3","宝宝4","宝宝5","宝宝6","宝宝7","宝宝8"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.frame = self.view.bounds;
        self.table.delegate = self
        self.table.dataSource = self
        
        self.view.addSubview(self.table);
        self.table.reloadData()
        
        self.view.backgroundColor = UIColor.red;
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "开始",
                                                                     style: .plain,
                                                                     target: self,
                                                                     action: #selector(backToPrevious))
        
        let qtcom = ViewController()
        qtcom.showYouName();
        // Do any additional setup after loading the view.
    }
    func backToPrevious() -> Void {
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
