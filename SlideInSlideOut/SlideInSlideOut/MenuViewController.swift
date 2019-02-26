//
//  MenuViewController.swift
//  SlideInSlideOut
//
//  Created by ampdevelops on 11/02/19.
//  Copyright © 2019 ampdevelops . All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
    case camera
    case settings
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var overLayButton: UIButton!
    @IBOutlet weak var menuTable: UITableView!
    
    
    var arrayMenuList = [Dictionary<String,String>]()
    var didTapMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        updateMenu()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        dismiss(animated: true) { [weak self] in
           
            self?.didTapMenuType?(MenuType(rawValue: 0)!)
            
            
        }
    }
    
    @IBAction func whenViewTap(_ sender: Any) {
        
        dismiss(animated: true) { [weak self] in
            
            self?.didTapMenuType?(MenuType(rawValue: 0)!)
            
            
        }
    }
    
    
    func updateMenu(){
        
        arrayMenuList.append(["title":"Home", "icon":"home"])
        arrayMenuList.append(["title":"Camera", "icon":"camera"])
        arrayMenuList.append(["title":"Settings", "icon":"settings"])
        
        menuTable.reloadData()
        
    }
   
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayMenuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuListCell")!
        menuTable.rowHeight = 60
        let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
        let imgIcon : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView
        
        imgIcon.image = UIImage(named: arrayMenuList[indexPath.row]["icon"]!)
        lblTitle.text = arrayMenuList[indexPath.row]["title"]!
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
            
            
        }
    }
    
}
