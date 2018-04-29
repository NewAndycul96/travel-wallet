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
        formatter.timeStyle = .medium
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
}

extension NewTransitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transitTableView.dequeueReusableCell(withIdentifier: "newTransits", for: indexPath)
        let transit = transits[indexPath.row]
        
        cell.textLabel?.text = transit.type
        
        if let date = transit.date {
            cell.detailTextLabel?.text = formatter.string(from: date)
        }
        
        return cell
    }
}

extension NewTransitViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newTransits", sender: self)
    }
}
