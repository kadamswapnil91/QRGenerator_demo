//
//  formViewController.swift
//  QR Generator
//
//  Created by Apple on 22/09/22.
//

import UIKit

class formViewController: UIViewController {
    
    @IBOutlet weak var lbl_StarName: UILabel!
    @IBOutlet weak var lbl_StarOrganization: UILabel!
    @IBOutlet weak var lbl_StarAddress: UILabel!
    @IBOutlet weak var lbl_StarPhone: UILabel!
    @IBOutlet weak var lbl_StarNotes: UILabel!
    @IBOutlet weak var txt_FullName: UITextField!
    @IBOutlet weak var txt_Organization: UITextField!
    @IBOutlet weak var txt_Address: UITextField!
    @IBOutlet weak var txt_Phone: UITextField!
    @IBOutlet weak var txt_Email: UITextField!
    @IBOutlet weak var txt_Notes: UITextField!
    @IBOutlet weak var btn_generateQR: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.borderCoolor()
     //   navigationController?.setNavigationBarHidden =
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func borderCoolor(){
        
        self.txt_FullName.layer.borderWidth = 1
        self.txt_FullName.layer.borderColor = UIColor.gray.cgColor
        self.txt_FullName.layer.cornerRadius = 10
        
        self.txt_Organization.layer.borderWidth = 1
        self.txt_Organization.layer.borderColor = UIColor.gray.cgColor
        self.txt_Organization.layer.cornerRadius = 10
        
        self.txt_Address.layer.borderWidth = 1
        self.txt_Address.layer.borderColor = UIColor.gray.cgColor
        self.txt_Address.layer.cornerRadius = 10
        
        self.txt_Phone.layer.borderWidth = 1
        self.txt_Phone.layer.borderColor = UIColor.gray.cgColor
        self.txt_Phone.layer.cornerRadius = 10
        
        self.txt_Email.layer.borderWidth = 1
        self.txt_Email.layer.borderColor = UIColor.gray.cgColor
        self.txt_Email.layer.cornerRadius = 10
        
        self.txt_Notes.layer.borderWidth = 1
        self.txt_Notes.layer.borderColor = UIColor.gray.cgColor
        self.txt_Notes.layer.cornerRadius = 10
        
        btn_generateQR.layer.cornerRadius = 15
        
    }
    
    
    @IBAction func generateQR_click(_ sender: UIButton) {
        
        
        if let fullNmae = txt_FullName.text, let email = txt_Email.text,  let organization = txt_Organization.text, let phone = txt_Phone.text, let address = txt_Address.text, let note = txt_Notes.text {
            if fullNmae == ""{
                print("Please enter Full Name...")
                openAlert(title: "My QR", message: "Please enter Full Name", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            }else if organization == ""{
                print("Please enter Organization name...")
                openAlert(title: "My QR", message: "Please enter yours Organization Name", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            }
            else if address == ""{
                print("Please enter Address...")
                openAlert(title: "My QR", message: "Please enter your Address ", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            }
            else if phone.isValidPhone() == false || phone == ""{
                openAlert(title: "My QR", message: "Please enter valid Phone Number...", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                print("Phone is not valid")
                
            }
            else if email.validateEmailId() == false || email == "" {
                openAlert(title: "My QR", message: "Please enter valid Email id...", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
                print("email is not valid")
                
            }else if note == ""{
                print("Please enter any note")
                openAlert(title: "My QR", message: "Please enter note", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{_ in }])
            }
            
            else{
                print("Navigate successfully")
                let enteredString =   "\(fullNmae), \(organization), \(address), \(phone), \(email), \(note)"
                print(enteredString)
                let next = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                next.strEnteredString = enteredString
               // self.present(next, animated: true, completion: nil)
                self.navigationController?.pushViewController(next, animated: true)
                
            }
        }
        
    }
    
}
