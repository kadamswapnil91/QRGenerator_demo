//
//  App+Extension.swift
//  QR Generator
//
//  Created by Apple on 24/09/22.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    class viewController {
        
        // MARK: - Static Storyboard Instances
        
        private let mainStoryBoard = UIStoryboard(name:"Main", bundle:nil)

        
        func viewContro() -> ViewController {
            return mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        }
        
    }
}

extension UIViewController{
    
    // Global Alert
    // Define Your number of buttons, styles and completion
    public func openAlert(title: String,
                          message: String,
                          alertStyle:UIAlertController.Style,
                          actionTitles:[String],
                          actionStyles:[UIAlertAction.Style],
                          actions: [((UIAlertAction) -> Void)]){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        for(index, indexTitle) in actionTitles.enumerated(){
            let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
            alertController.addAction(action)
        }
        self.present(alertController, animated: true)
    }
    //https://stackoverflow.com/a/56579842/8201581
    
}

extension String{
    
    func validateEmailId() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
    }
    
    func validatePassword(mini: Int = 8, max: Int = 8) -> Bool {
        //Minimum 8 characters at least 1 Alphabet and 1 Number:
        var passRegEx = ""
        if mini >= max{
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),}$"
        }else{
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(mini),\(max)}$"
        }
        return applyPredicateOnRegex(regexStr: passRegEx)
    }
    
    //https://stackoverflow.com/a/39284766/8201581
    
    func applyPredicateOnRegex(regexStr: String) -> Bool{
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
    
    func isValidPasswordBallchalu() -> Bool {
        if self.count > 6 {
            return true
        } else {
            return false
        }
    }
    
    func isValidPhone() -> Bool {
        let phoneRegEx = "^[6-9][0-9]{9}$"
        let phoneNumber = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        let result = phoneNumber.evaluate(with: self)
        return result
    }


    
}
