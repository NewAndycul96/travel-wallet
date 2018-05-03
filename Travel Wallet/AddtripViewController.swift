//
//  AddtripViewController.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 4/26/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class AddtripViewController: UITableViewController {


    @IBOutlet weak var tripNameTextField: UITextField!
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    var existingTrip: Trip?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tripNameTextField.delegate = self as? UITextFieldDelegate
        destinationTextField.delegate = self as? UITextFieldDelegate
        
        tripNameTextField.text = existingTrip?.tripName
        destinationTextField.text = existingTrip?.destination
        
        if let startDate = existingTrip?.startDate {
            datePicker.date = startDate
        }
        if let endDate = existingTrip?.endDate {
            endDatePicker.date = endDate
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tripNameTextField.resignFirstResponder()
        destinationTextField.resignFirstResponder()
    }

    @IBAction func saveTrip(_ sender: Any) {
        let tripName = tripNameTextField.text
        let destination = destinationTextField.text
        let startDate = datePicker.date
        let endDate = endDatePicker.date
        
        var trip: Trip?
        
        if let existingTrip = existingTrip {
            existingTrip.tripName = tripName
            existingTrip.destination = destination
            existingTrip.startDate = startDate
            existingTrip.endDate = endDate
            
            trip = existingTrip
        } else {
            trip = Trip(tripName: tripName, destination: destination, startDate: startDate, endDate: endDate)
        }
        
        if let trip = trip{
            do{
                let managedContext = trip.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("trip could not be saved")
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

}
