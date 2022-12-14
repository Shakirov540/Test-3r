//
//  notCell.swift
//  Test 3r
//
//  Created by Айбек Шакиров on 13/12/22.
//

import UIKit
class NoteCell : UITableViewCell{
    @IBOutlet weak var photo : UIImageView!
    
    @IBOutlet weak var noteLabel : UILabel!
//    var isTapped = false
    
    
    override func layoutSubviews() {
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tapp))
        photo.addGestureRecognizer(tap1)
    }
    
    
    @objc func tapp(){
        print("Chekmark")
        let tableView = superview as? UITableView
        var index0 : Int? = nil
        for (index,item) in notesArray.enumerated(){
            if noteLabel.text! == item.note{
                index0 = index}
        }
        notesArray.remove(at: index0!)
        notesArray.insert(Notes(note: noteLabel.text!, photo: "checkmark"), at: 0)
        tableView?.reloadData()
        
    }
}
