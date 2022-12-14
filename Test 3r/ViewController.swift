//
//  ViewController.swift
//  Test 3r
//
//  Created by Айбек Шакиров on 13/12/22.
//

import UIKit

class ViewController: UIViewController {
//    var note: [String] = []
//    var cell: [String] = []
//
    @IBOutlet weak var ViewContr0ller: UITableView!
     
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "хотите ли вы подвердить", message: " ", preferredStyle: .alert)
        var textField0 = UITextField()
        alert.addTextField(){textField in
            textField0 = textField
        }
        let okAction = UIAlertAction(title: "OK", style: .cancel){
            okAction in
            if textField0.text?.count != 0{
                notesArray.append(Notes(note: textField0.text!, photo: "square"))
                self.ViewContr0ller.reloadData()
            }}
        
        let closeAction = UIAlertAction(title: "Закрыть", style: .destructive)
        alert.addAction(okAction)
        alert.addAction(closeAction)
        present(alert, animated: true)
    }
    
        
  
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewContr0ller.dataSource = self
        ViewContr0ller.delegate = self
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noteCell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for:indexPath) as! NoteCell
        noteCell.noteLabel.text = notesArray[indexPath.row].note
        noteCell.photo.image = UIImage(systemName: notesArray[indexPath.row].photo)
        return noteCell
        
    }
}

    
    
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          100
        
    }
}
