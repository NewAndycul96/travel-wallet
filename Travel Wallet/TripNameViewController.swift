//
//  TripNameViewController.swift
//  Travel Wallet
//
//  Created by Allison Dolan on 5/3/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit
import CoreData

class TripNameViewController: UIViewController {

    @IBOutlet weak var tripNameTableView: UITableView!
    
    var names: [NameOfTrip] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<NameOfTrip> = NameOfTrip.fetchRequest()
        
        do {
            names = try managedContext.fetch(fetchRequest)
            tripNameTableView.reloadData()
        }
        catch{
            print("Could not fetch")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TripNameViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tripNameTableView.dequeueReusableCell(withIdentifier: "tripNameCell", for: indexPath)
        let name = names[indexPath.row]
        
        cell.textLabel?.text = name.nameOfTrip
        return cell
    }
}
