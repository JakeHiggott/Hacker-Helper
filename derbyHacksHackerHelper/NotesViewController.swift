//
//  NotesViewController.swift
//  derbyHacksHackerHelper
//
//  Created by Devan Allara on 2/10/18.
//  Copyright © 2018 Jake Higgott. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let taskManager = TaskManager.sharedInstance
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.tasks.count
   
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        
        let task = taskManager.tasks[indexPath.row]
        
        cell.textLabel?.text = task.thing
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "NoteDetailSegue",
            let indexPath = tableView.indexPathForSelectedRow,
            let viewController = segue.destination as? NoteDetailViewController
            else { return }
        
        let task = TaskManager.sharedInstance.tasks[indexPath.row]
        viewController.configure(for: task)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }

func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        taskManager.tasks.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
   
    
    
}
    
}


