//
//  ViewController.swift
//  Backet list
//
//  Created by admin on 16/12/2021.
//

import UIKit


class ViewController: UITableViewController, cancelbtn{
    func savebtn(by controller: UIViewController,with text:String,at indexpath:NSIndexPath?) {
       
        if let saveEdit = indexpath
        {
            ArrName[saveEdit.row] = text
        } else
        {
            ArrName.append(text)
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func cancelbtn(by controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }

    
  var ArrName=["JOli","Reem","Adim","Mark","Norah","Amal","Maha","Sleem","Seed","Abduallah","Jaki","Hamad"]

        
        override func viewDidLoad() {
            super.viewDidLoad()
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                     let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                         cell.textLabel?.text=ArrName[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
         
                self.ArrName.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
           }
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editcell", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addcell" {

                        let navigationController = segue.destination as! UINavigationController
                        let controller = navigationController.topViewController as! SecondTableViewController
            
            controller.delegate = self
        }else if segue.identifier == "editcell"{
            
                        let navigationController = segue.destination as! UINavigationController
                        let controller = navigationController.topViewController as! SecondTableViewController

            controller.delegate = self
                        let indexPath = sender as! NSIndexPath
                        let editing=ArrName[indexPath.row]
            controller.edittext=editing
            controller.indexPath=indexPath
        } }
    
    }


    
