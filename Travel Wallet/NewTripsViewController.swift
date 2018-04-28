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

    @IBOutlet weak var newTripsViewController: UITableView!
    
    let formatter = DateFormatter()
    
    var trips = [Trip]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()
        
        do{
            trips = try managedContext.fetch(fetchRequest)
            
            newTripsViewController.reloadData()
        } catch {
            print("Fetch could not be performed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewTrip(_ sender: Any) {
        performSegue(withIdentifier: "Add Trip", sender: self)
        
    }
}

extension NewTripsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newTripsViewController.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath)
        let trip = trips[indexPath.row]
        
        cell.textLabel?.text = trip.tripName
        
        if let date = trip.date {
            cell.detailTextLabel?.text = formatter.string(from: date)
        }
        
        return cell
    }
}

extension NewTripsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Add Trip", sender: self)
    }
}















