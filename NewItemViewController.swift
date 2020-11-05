//
//  NewItemViewController.swift
//  QRCode Generator
//
//  Created by Rafael Oliveira on 04/11/20.
//

import UIKit
import CoreData

class NewItemViewController: UIViewController {
    var ItemArray = [Item]()

    @IBOutlet weak var titleTextField: UITextField!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func SaveButtonPressed(_ sender: UIButton) {
        let newItem = Item(context: self.context)
        newItem.title = titleTextField.text!
        self.ItemArray.append(newItem)
        
        self.saveItem()
        
        
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
    
    func loadItems(){
        if let request : NSFetchRequest<Item> = Item.fetchRequest() {
            do {
                ItemArray = try context.fetch(request)
                print("Dados carregados")
            } catch {
                print("Erro ao carregar dados: \(error)")
            }
        }
    }
}
