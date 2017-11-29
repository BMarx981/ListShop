//
//  ListTableViewController.swift
//  ListShop
//
//  Created by Marx, Brian on 11/24/17.
//  Copyright © 2017 Marx, Brian. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var fruitsAndVegtables = [
        "cucumbers", "carrots", "apples", "spinach"
    ]
    
    var carbs = [
        "cereal", "bread", "pasta",
    ]
    
    var lists = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        lists = [fruitsAndVegtables, carbs]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return lists.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return fruitsAndVegtables.count
        } else if section == 1 {
            return carbs.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.addTarget(self, action: #selector(handleOpenClose), for: .touchUpInside)
        return button
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 34
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)

        if indexPath.section == 0 {
            cell.textLabel?.text = fruitsAndVegtables[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = carbs[indexPath.row]
        }
        return cell
    }
    
    @objc func handleOpenClose() {
        listSubviewsOfView(view: tableView)
    }
    
    func listSubviewsOfView(view:UIView){
        print("@@@@@@@@@@@@@@**********************@@@@@@@@@@@@@@@@@@@@")
        // Get the subviews of the view
        var subviews = view.subviews
        
        // Return if there are no subviews
        if subviews.count == 0 {
            return
        }
        
        for subview : AnyObject in subviews{
            
            // Do what you want to do with the subview
            print(subview)
            
            // List the subviews of subview
            listSubviewsOfView(view: subview as! UIView)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
