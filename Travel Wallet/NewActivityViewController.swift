//
//  NewActivityViewController.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 5/6/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit
import CoreData

class NewActivityViewController: UIViewController {

    @IBOutlet weak var activitiesTableView: UITableView!
    let formatter = DateFormatter()
    
    var activity = [Activity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.timeStyle = .medium

    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Activity> = Activity.fetchRequest()
        
        do {
            activity = try managedContext.fetch(fetchRequest)
            
            activitiesTableView.reloadData()
        } catch {
            print("Fetch could not be performed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewActivity(_ sender: Any) {
        performSegue(withIdentifier: "newActivity", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddActivityTableViewController,
            let selectedRow = self.activitiesTableView.indexPathForSelectedRow?.row else{
                return
        }
        
        destination.existingactivity = activity[selectedRow]
    }
    
    func deleteactivity(at indexPath: IndexPath){
        let activities = activity[indexPath.row]
        
        if let managedContext = activities.managedObjectContext {
            managedContext.delete(activities)
            
            do {
                try managedContext.save()
                
                self.activity.remove(at: indexPath.row)
                
                activitiesTableView.deleteRows(at: [indexPath], with: .automatic)
            }catch {
                print("Delete failed")
                
                activitiesTableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        
        
        
        
        
    }
    
}
extension NewActivityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = activitiesTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)
        let activities = activity[indexPath.row]
        
        newCell.textLabel?.text = activities.type
        
        if let time = activities.time {
            newCell.detailTextLabel?.text = formatter.string(from: time)
            
        }
        return newCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteactivity(at: indexPath)
        }
    }
}
extension NewActivityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newActivity", sender: self)
    }
}

