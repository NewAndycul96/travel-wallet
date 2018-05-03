//
//  HotelTableViewController.swift
//  Travel Wallet
//
//  Created by Allison Dolan on 5/3/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class HotelTableViewController: UITableViewController {

    @IBOutlet weak var nameOfHotel: UITextField!
    @IBOutlet weak var checkIn: UIDatePicker!
    @IBOutlet weak var checkOut: UIDatePicker!
    @IBOutlet weak var confirmationNum: UITextField!
    @IBOutlet weak var durationOfStay: UITextField!
    @IBOutlet weak var address: UITextField!
    
    var existingHotel: Hotel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        nameOfHotel.delegate = self as? UITextFieldDelegate
        confirmationNum.delegate = self as? UITextFieldDelegate
        durationOfStay.delegate = self as? UITextFieldDelegate
        address.delegate = self as? UITextFieldDelegate
        
        nameOfHotel.text = existingHotel?.name
        if let inDate = existingHotel?.checkIn{
            checkIn.date = inDate
        }
        if let outDate = existingHotel?.checkOut{
            checkOut.date = outDate
        }
        confirmationNum.text = existingHotel?.confirmation
        if let stay = existingHotel?.durationOfStay{
            durationOfStay.text = "\(stay)"
        } else {
            durationOfStay.text = ""
        }
        address.text = existingHotel?.address
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameOfHotel.resignFirstResponder()
        confirmationNum.resignFirstResponder()
        durationOfStay.resignFirstResponder()
        address.resignFirstResponder()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MapViewController {
            destination.address = address.text!
        }
        
        
    }
    
    
    @IBAction func saveHotel(_ sender: Any) {
    let name = nameOfHotel.text
        let confirmation = confirmationNum.text
        let durationOfStayText = durationOfStay.text ?? ""
        let duration = Int16(durationOfStayText) ?? 0
        let addressOfHotel = address.text
        let checkInDate = checkIn.date
        let checkOutDate = checkOut.date
        
        var hotel: Hotel?
        
        if let existingHotel = existingHotel{
            existingHotel.name = name
            existingHotel.confirmation = confirmation
            existingHotel.durationOfStay = duration
            existingHotel.address = addressOfHotel
            existingHotel.checkIn = checkInDate
            existingHotel.checkOut = checkOutDate
            
            hotel = existingHotel
        } else{
            hotel = Hotel(name: name, checkIn: checkInDate, checkOut: checkOutDate, confirmation: confirmation, durationOfStay: duration, address: addressOfHotel)
        }
        
        if let hotel = hotel{
            do {
                let managedContext = hotel.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Context could not be saved")
            }
        }
        
        // MARK: - Table view data source
        
        //    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //        return 0
        //    }
        //
        ////    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
}
