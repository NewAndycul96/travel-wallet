//
//  NewTransitViewController.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 4/29/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit
import CoreData

class NewTransitViewController: UIViewController {

    @IBOutlet weak var transitTableView: UITableView!
    
    let formatter = DateFormatter()
    
    var transits = [Transit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Transit> = Transit.fetchRequest()
        do{
            transits = try managedContext.fetch(fetchRequest)
            
            transitTableView.reloadData()
        } catch {
            print("Fetch could not be performed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addNewTransit(_ sender: Any) {
        performSegue(withIdentifier: "newTransits", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? AddTransitTableViewController,
            let selectedRow = self.transitTableView.indexPathForSelectedRow?.row else {
                return
        }
        destination.existingTransit = transits[selectedRow]
    }
    
    func deleteTransit(at indexPath: IndexPath) {
        let transit = transits[indexPath.row]
        
        if let managedContext = transit.managedObjectContext {
            managedContext.delete(transit)
            
            do{
                try managedContext.save()
                
                self.transits.remove(at: indexPath.row)
                
                transitTableView.deleteRows(at: [indexPath], with: .automatic)
            } catch {
                print("delete Failed")
                
                transitTableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
}

extension NewTransitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transitTableView.dequeueReusableCell(withIdentifier: "newTransitCell", for: indexPath)
        let transit = transits[indexPath.row]
        
        cell.textLabel?.text = transit.type
        
        if let startDate = transit.startDate {
            cell.detailTextLabel?.text = "Departure: \(formatter.string(from: startDate))"
        }
      
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteTransit(at: indexPath)
        }
    }
}

extension NewTransitViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newTransits", sender: self)
    }
}
