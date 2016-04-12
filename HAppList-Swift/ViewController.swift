//
//  ViewController.swift
//  HAppList-Swift
//
//  Created by JuanFelix on 4/12/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

import UIKit

let cellId = "ACELL"

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arrModelList = [AppCellModel]()
    @IBOutlet weak var tblAppList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cNib = UINib(nibName: "AppListCell", bundle: nil)
        tblAppList.registerNib(cNib, forCellReuseIdentifier: cellId)
        tblAppList.rowHeight = 80
        SearchUtils.requestAppList("QQ") { (success:Bool, data:[String : AnyObject]?) in
            if success {
                self.buildModels(data!["results"] as! [AnyObject])
            }else{
                print("Request failed...");
            }
        }
    }
    
    func buildModels(appList:[AnyObject]) {
        for dicData in appList {
            if let resDict = dicData as? [String: AnyObject] {
                let aModel = AppCellModel()
                aModel.buildModel(resDict)
                arrModelList.append(aModel)
            }
        }
        tblAppList.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: tableview datasource & delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrModelList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId) as! AppListCell
        cell.delegate = self
        cell.reloadCellData(arrModelList[indexPath.row])
        return cell
    }
}

extension ViewController: AppListCellDelegate{
    func appListCellStarMarked(isStar: Bool, cell: AppListCell) {
        let indexPath = tblAppList.indexPathForCell(cell)
        let model = arrModelList[(indexPath?.row)!]
        model.isStar = isStar
        tblAppList.reloadData()
    }
}

