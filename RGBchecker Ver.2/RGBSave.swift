//
//  APIController.swift
//  RGBchecker Ver.2
//
//  Created by Rintaro Kimura on 2022/06/16.
//

import UIKit

class RGBSave:UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    var SecondRed:CGFloat = 0.0
    var SecondGreen:CGFloat = 0.0
    var SecondBlue:CGFloat = 0.0
    var ProjectName:String = ""
    
    @IBOutlet weak var RGBSaveTable: UITableView!
    @IBOutlet weak var ProjectTextField: UITextField!

    @IBAction func SaveButton(_ sender: UIButton) {
        
        if let text = ProjectTextField.text {
            ProjectName = String(text)
            
            RGBchecker.RedColorList.append(SecondRed)
            RGBchecker.GreenColorList.append(SecondGreen)
            RGBchecker.BlueColorList.append(SecondBlue)
            RGBchecker.ListProjectName.append(ProjectName)
            UserDefaults.standard.set(RGBchecker.RedColorList, forKey: "R")
            UserDefaults.standard.set(RGBchecker.GreenColorList, forKey: "G")
            UserDefaults.standard.set(RGBchecker.BlueColorList, forKey: "B")
            UserDefaults.standard.set(RGBchecker.ListProjectName,forKey: "Name")
            
            dismiss(animated: true, completion: nil)
        } else {
            debugPrint("RGBSave ProjectTextField Error")
        }
        
    }
    
    @IBAction func CancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "RGBTableSaveCell")
        
        cell.backgroundColor = UIColor(red:SecondRed/255,green:SecondGreen/255, blue:SecondBlue/255, alpha: 1)
        cell.textLabel!.text = " #\(String(NSString(format: "%02X%02X%02X", Int(SecondRed), Int(SecondGreen), Int(SecondBlue)))) "
        cell.textLabel!.font = UIFont.systemFont(ofSize: 20)
        
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RGBSaveTable.delegate = self
        RGBSaveTable.dataSource = self
        ProjectTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
