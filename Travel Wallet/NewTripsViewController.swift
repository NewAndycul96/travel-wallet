//
//  NewTripsViewController.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 4/28/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit
import CoreData

class NewTripsViewController: UIViewController {

    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var newTripsTableView: UITableView!
    
    let formatter = DateFormatter()
    
    var trips = [Trip]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateStyle = .medium
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()
        
        do{
            trips = try managedContext.fetch(fetchRequest)
            
            if trips.count == 0{
                    nextButton.isEnabled = false
    
                } else {
                    nextButton.isEnabled = true
    
                }

            newTripsTableView.reloadData()
        } catch {
            print("Fetch could not be performed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    @IBAction func addNewTrip(_ sender: Any) {
        performSegue(withIdentifier: "newTrips", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddtripViewController,
            let selectedRow = self.newTripsTableView.indexPathForSelectedRow?.row else {
                return
        }
        
        destination.existingTrip = trips[selectedRow]
    }
    
    func deleteTrip(at indexPath: IndexPath) {
        let trip = trips[indexPath.row]
        
        if let managedContext = trip.managedObjectContext {
            managedContext.delete(trip)
            
            do {
                try managedContext.save()
                
                self.trips.remove(at: indexPath.row)
                
                newTripsTableView.deleteRows(at: [indexPath], with: .automatic)
            } catch {
                print("Delete Failed")
                
                newTripsTableView.reloadRows(at: [indexPath], with: .automatic)
                
            }
        }
    }
}

extension NewTripsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newTripsTableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath)
        let trip = trips[indexPath.row]
        
        cell.textLabel?.text = trip.tripName
        
        if let startDate = trip.startDate, let endDate = trip.endDate {
            cell.detailTextLabel?.text = "\(formatter.string(from: startDate)) - \(formatter.string(from: endDate))"
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteTrip(at: indexPath)
        }
    }
}

extension NewTripsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "tripCell", sender: self)
    }
}


