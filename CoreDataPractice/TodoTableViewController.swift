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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
        let task = tasks[indexPath.row]
        
        if task.isimportant{
            cell.textLabel?.text = "🌟" + task.name!
        } else {
            cell.textLabel?.text = task.name!
        }
        
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {
            // deleteだった場合、そのcellのindexPath.rowを定数Taskに入れる
            let task = tasks[indexPath.row]
            // それを削除する
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch {
                print("読み込み失敗")
            }
            tableView.reloadData()
        }

    }
}
