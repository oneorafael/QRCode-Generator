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
    var label = UILabel()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.reusableIdentifier)
        label.text = "Você não cadastrou nenhum item ainda"
        label.textAlignment = .center
        
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
    
    func saveItem() {
        do {
            try context.save()
            print("salvo com sucesso")
            loadItems()
        } catch {
            print("Erro ao salvar: \(error)")
        }
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
}

// MARK: - TableView DataSource Methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = ItemArray.count == 0 ? label : nil
        return ItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reusableIdentifier, for: indexPath) as! QRCodeItemTableViewCell
        cell.titleTextLabel.text = ItemArray[indexPath.row].title
        return cell
    }
    
}

//MARK: - TableView Delegate Methods
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    tableView.deselectRow(at: indexPath, animated: true)
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            context.delete(ItemArray[indexPath.row])
            ItemArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.saveItem()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

