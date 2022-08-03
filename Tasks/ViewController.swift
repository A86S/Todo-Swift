//
//  ViewController.swift
//  Tasks
//
//  Created by Admin on 02/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        tableView.delegate = self
        tableView.dataSource = self
        
        // setup local data
        if !UserDefaults().bool(forKey: "setup") {
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(tasks, forKey: "tasks")
        }
    }
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
        vc.title = "Task Detail"
        vc.task = tasks[indexPath.row]
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateTask() {
        tasks = UserDefaults().stringArray(forKey: "tasks")  ?? [String]()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateTask()
    }
    
    @IBAction func didTapAdd() {
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Task"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
