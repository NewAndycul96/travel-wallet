//
//  TripNameViewController.swift
//  Travel Wallet
//
//  Created by Allison Dolan on 5/3/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit

class TripNameViewController: UIViewController {

    @IBOutlet weak var tripNameTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tripNameTableView.dequeueReusableCell(withIdentifier: "tripNameCell", for: indexPath)
        return cell
    }
}
