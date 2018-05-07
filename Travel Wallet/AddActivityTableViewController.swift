//
//  AddActivityTableViewController.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 5/6/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class AddActivityTableViewController: UITableViewController {

    @IBOutlet weak var activityType: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var activityTime: UIDatePicker!
    
    var existingactivity: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityType.text = existingactivity?.type
        location.text = existingactivity?.location
        if let date = existingactivity?.time{
            activityTime.date = date
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        activityType.resignFirstResponder()
        activityTime.resignFirstResponder()
    }
    
    @IBAction func saveActivity(_ sender: Any) {
        let type = activityType.text
        let activityLocation = location.text
        let time = activityTime.date
        
        var activity: Activity?
        
        if let existingactivity = existingactivity {
            existingactivity.type = type
            existingactivity.location = activityLocation
            existingactivity.time = time
            
            activity = existingactivity
        }else{
            activity = Activity(type: type, location: activityLocation, activityTime: time)
        }
        
        if let activity = activity{
            do {
                let managedContext = activity.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Activity could not be saved")
            }
        }
    }
}
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

