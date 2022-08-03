//
//  TaskViewController.swift
//  Tasks
//
//  Created by Admin on 02/08/22.
//

import UIKit

class TaskViewController: UIViewController {

    var task: String?
    var index: Int?
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
       
        var tasks = UserDefaults().stringArray(forKey: "tasks")  ?? [String]()
        tasks.remove(at: self.index!)
        
        UserDefaults().set(tasks, forKey: "tasks")
        UserDefaults().synchronize()
        navigationController?.popViewController(animated: true)
    }
}
