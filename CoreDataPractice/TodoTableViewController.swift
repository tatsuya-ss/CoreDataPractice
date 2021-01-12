//
//  TodoTableViewController.swift
//  CoreDataPractice
//
//  Created by 坂本龍哉 on 2021/01/12.
//

import UIKit

class TodoTableViewController: UITableViewController {

    // todoリストで追加される項目をこの変数に配列で管理。EntitiesのTask型に設定。
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.name!
        
        return cell
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch{
            print("読み込み失敗")
        }
    }
}
