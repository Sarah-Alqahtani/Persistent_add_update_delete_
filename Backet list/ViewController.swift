//
//  ViewController.swift
//  Backet list
//
//  Created by admin on 16/12/2021.
//

import UIKit
import CoreData


class ViewController: UITableViewController, cancelbtn{
 
    func savebtn(by controller: UIViewController,with text:String,at indexpath:NSIndexPath?) {
       
        if let saveEdit = indexpath
        {
            let item = ArrName[saveEdit.row]
            
            item.textcore = text
          //  ArrName[saveEdit.row] = text
            
        } else
        {
            let item = NSEntityDescription.insertNewObject(forEntityName: "Enity", into: getContext()) as! Entity
                      item.textcore = text
                      ArrName.append(item)
                 
                  }
                  SaveText()
                  
                  tableView.reloadData()
                  dismiss(animated: true, completion: nil)
        
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
    func cancelbtn(by controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }

    
  var ArrName=[Entity]()

        
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
        cell.textLabel?.text=ArrName[indexPath.row].textcore
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            let text = ArrName[indexPath.row]
            getContext().delete(text)
            SaveText()
            
              ArrName.remove(at: indexPath.row)
             tableView.reloadData()
        }
        
    //override func tableView(_ tableView: UITableView, commit editingStyle: //UITableViewCell.EditingStyle,       ///forRowAt indexPath: IndexPath) {
               // if editingStyle == .delete {
               // self.ArrName.remove(at: indexPath.row)
               // self.tableView.deleteRows(at: [indexPath], with: .automatic)//}
 //   }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editcell", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is UIBarButtonItem {

                        let navigationController = segue.destination as! UINavigationController
                        let controller = navigationController.topViewController as! SecondTableViewController
            
            controller.delegate = self
        }else if sender is IndexPath {
            
                        let navigationController = segue.destination as! UINavigationController
                        let controller = navigationController.topViewController as! SecondTableViewController

            controller.delegate = self
                        let indexPath = sender as! NSIndexPath
                        let editing=ArrName[indexPath.row]
            controller.edittext=editing.textcore
            controller.indexPath=indexPath
        } }
    
    }

extension ViewController {
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func SaveText() {
          
          let item = getContext()
        
          do {
              try item.save()
          } catch
        {
              print(error.localizedDescription)
          }
      }
    func returnText() {
        let item = getContext()
        
        let request = NSFetchRequest<Entity>.init(entityName: "Entity")
        
        do {
            ArrName = try item.fetch(request)
                  tableView.reloadData()
        }
        catch {
            print(error.localizedDescription)
        }
    }
  
    
}





    
