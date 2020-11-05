//
//  ViewController.swift
//  QRCode Generator
//
//  Created by Rafael Oliveira on 04/11/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var ItemArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.reusableIdentifier)
        
        loadItems()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadItems()
    }
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    func loadItems(){
        if let request : NSFetchRequest<Item> = Item.fetchRequest() {
            do {
                ItemArray = try context.fetch(request)
                print("Dados carregados")
            } catch {
                print("Erro ao carregar dados: \(error)")
            }
        }
        tableView.reloadData()
    }
    
}

// MARK: - TableView DataSource Methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reusableIdentifier, for: indexPath) as! QRCodeItemTableViewCell
        cell.titleTextLabel.text = ItemArray[indexPath.row].title
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
