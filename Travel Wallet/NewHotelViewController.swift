//
//  NewHotelViewController.swift
//  Travel Wallet
//
//  Created by Allison Dolan on 5/3/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//

import UIKit
import CoreData

class NewHotelViewController: UIViewController {
    
    
    @IBOutlet weak var hotelTableView: UITableView!
    
    
    let dateFormatter = DateFormatter()
    
    var hotels = [Hotel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        dateFormatter.dateStyle = .medium
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Hotel> = Hotel.fetchRequest()
        
        do{
            hotels = try managedContext.fetch(fetchRequest)
            
            hotelTableView.reloadData()
        } catch {
            print("Fetch could not be performed")
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewHotel(_ sender: Any) {
        performSegue(withIdentifier: "showHotel", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? HotelTableViewController,
            let selectedRow = self.hotelTableView.indexPathForSelectedRow?.row else{
                return
        }
        destination.existingHotel = hotels[selectedRow]
    }
    
    func deleteHotel(at indexPath: IndexPath) {
        let hotel = hotels[indexPath.row]
        
        if let managedContext = hotel.managedObjectContext{
            managedContext.delete(hotel)
            
            do{
                try managedContext.save()
                
                self.hotels.remove(at: indexPath.row)
                
                hotelTableView.deleteRows(at: [indexPath], with: .automatic)
            } catch{
                print("Delete Failed")
                
                hotelTableView.reloadRows(at: [indexPath], with: .automatic)
            }
            
        }
    }
}
extension NewHotelViewController: UITableViewDataSource {
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hotelTableView.dequeueReusableCell(withIdentifier: "hotelCell", for: indexPath)
        let hotel = hotels[indexPath.row]
        
       
            cell.textLabel?.text = hotel.name
        
        if let date = hotel.checkIn, let outDate = hotel.checkOut{
            cell.detailTextLabel?.text = "\(dateFormatter.string(from: date)) - \(dateFormatter.string(from: outDate))"
        }
        
    
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteHotel(at: indexPath)
        }
    }
    
    
}

extension NewHotelViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showHotel", sender: self)
        
    }
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

