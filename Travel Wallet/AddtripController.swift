//
//  AddtripController.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 4/19/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class AddtripController: UITableViewController{
    
//    let titleKey = "title"
//    let dateKey  = "date"
//
//    // keep track of which rows have date cells
//    let kDateStartRow = 3
//    let kDateEndRow   = 4
//
//    let dateCellID       = "startDate";
//    let datePickerCellID = "datePicker";
//    
//    var dataArray: [[String: AnyObject]] = []
//    var dateFormatter = DateFormatter()
//
//    var datePickerIndexPath: NSIndexPath?
//
//    var pickerCellRowHeight: CGFloat = 216
//
//    @IBOutlet weak var TripName: UITextField!
//    @IBOutlet weak var Destination: UITextField!
//    @IBOutlet var myTableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let itemOne = [titleKey : "Tap a cell to change its date:"]
//        let itemTwo = [titleKey : "Start Date", dateKey : NSDate()] as [String : Any]
//        let itemThree = [titleKey : "End Date", dateKey : NSDate()] as [String : Any]
//        let itemFour = [titleKey : "(other item1)"]
//        let itemFive = [titleKey : "(other item2)"]
//        let itemSix = [titleKey : "(other item3)"]
//        dataArray = [itemOne, itemFour, itemFive, itemSix, itemTwo, itemThree] as [[String : AnyObject]]
//
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .medium
//
////        func localeChanged(notif: NSNotification) {
////            myTableView.reloadData()
////        }
////        NotificationCenter.defaultCenter.addObserver(self, selector: #selector(AddtripController.localeChanged(_:)), name: NSCurrentLocaleDidChangeNotification, object: nil)
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    // MARK: - Table view data source
//
////    override func numberOfSections(in tableView: UITableView) -> Int {
////        // #warning Incomplete implementation, return the number of sections
////        return 0
////    }
////
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        if hasInlineDatePicker() {
//            return dataArray.count + 1;
//        }
//        return dataArray.count;
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell: UITableViewCell?
//
//        var cellID = dateCellID
//
//        if indexPathHasPicker(indexPath: indexPath as NSIndexPath) {
//            cellID = datePickerCellID
//        } else if indexPathHasDate(indexPath: indexPath as NSIndexPath) {
//            cellID = dateCellID
//        }
//
//        cell = tableView.dequeueReusableCell(withIdentifier: cellID)
//
//        if indexPath.row == 0 {
//            // we decide here that first cell in the table is not selectable (it's just an indicator)
//            cell?.selectionStyle = .none;
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

