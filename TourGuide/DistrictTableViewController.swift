//
//  DistrictTableViewController.swift
//  TourGuide
//
//  Created by Lauren Nicole Roth on 10/8/16.
//  Copyright © 2016 Skedaddle. All rights reserved.
//

import UIKit

class DistrictTableViewController: UITableViewController {
  
  let districtNames = [
    "Louvre",
    "Bourse",
    "Temple",
    "Hôtel-de-Ville",
    "Panthéon",
    "Luxembourg",
    "Palais-Bourbon",
    "Élysée",
    "Opéra",
    "Entrepôt",
    "Popincourt",
    "Reuilly",
    "Gobelins",
    "Observatoire",
    "Vaugirard",
    "Passy",
    "Batignolles-Monceau",
    "Butte-Montmartre",
    "Buttes-Chaumont",
    "Ménilmontant"
    ]
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.title = "Paris TourGuide"

         self.clearsSelectionOnViewWillAppear = false

         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
  
    func getParisDistricts() {
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return districtNames.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "districtCell", for: indexPath)

        cell.textLabel?.text = String(indexPath.row + 1)
        cell.detailTextLabel?.text = districtNames[indexPath.row]
      
        return cell
    }
 
    // go to details screen when clicked on a table row.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      self.performSegue(withIdentifier: "showMapSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // find indexpath for selected row
        let selectedIndexPath = self.tableView.indexPathForSelectedRow
        
        // deselet row
        self.tableView.deselectRow(at: selectedIndexPath!, animated: true)

        
        // create object for destination view controller
        let destVc = segue.destination as! MapTourViewController
        print(destVc)
        
        // set value for selected item name within destination view controller
        let districtName = self.districtNames[(selectedIndexPath! as NSIndexPath).row]
        debugPrint("Setting name as title: ", districtName)
//        destVc.districtNameLabel.text = districtName
        destVc.title = String(districtName)
    }


}
