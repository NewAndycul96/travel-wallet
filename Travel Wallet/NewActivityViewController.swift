//
//  NewActivityViewController.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 5/6/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class NewActivityViewController: UIViewController {

    @IBOutlet weak var activitiesTableView: UITableView!
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.timeStyle = .medium

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewActivity(_ sender: Any) {
        performSegue(withIdentifier: "newActivity", sender: self)
    }
    
}
extension NewActivityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = activitiesTableView.dequeueReusableCell(withIdentifier: "activityCell", for: indexPath)
        return newCell
    }
}
extension NewActivityViewController: UITabBarDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newActivity", sender: self)
    }
}
