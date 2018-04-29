//
//  NewTransitViewController.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 4/29/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class NewTransitViewController: UIViewController {

    @IBOutlet weak var transitTableView: UITableView!
    
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transitTableView.dequeueReusableCell(withIdentifier: "newTransits", for: indexPath)
        return cell
    }
}

extension NewTransitViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newTransits", sender: self)
    }
}
