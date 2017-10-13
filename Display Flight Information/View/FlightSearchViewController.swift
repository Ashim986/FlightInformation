//
//  ViewController.swift
//  ForcastFlightForAlaskaAirline
//
//  Created by ashim Dahal on 10/9/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class FlightSearchViewController: UIViewController, UITextFieldDelegate {
    
    let informationLabel : UILabel = {
        let label = UILabel()
        label.text = "Please enter three digit airport code to find information about flight detail"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .black
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var textFieldForAirportCode : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.placeholder = "Enter Code"
        textField.font = UIFont.boldSystemFont(ofSize: 20)
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var searchButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.backgroundColor = #colorLiteral(red: 0.4170642594, green: 0.8991251538, blue: 0.35213355, alpha: 0.7429901541)
        button.addTarget(self, action: #selector(handelSearchButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        view.addSubview(informationLabel)
        view.addSubview(textFieldForAirportCode)
        view.addSubview(searchButton)
        anchroForView()
        textFieldForAirportCode.delegate = self
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text != nil
        {
            textFieldForAirportCode.text = textField.text
        }else{
            textField.text = nil
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text!.characters.count < 4 {
                let allowedCharacter = CharacterSet.letters
            let characterSet = CharacterSet(charactersIn : string)
            if   allowedCharacter.isSuperset(of: characterSet){
            return true
            }
        }
        textField.clearButtonMode = .always
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
  
    func anchroForView()  {
        // x, y , Height , Width Anchor
        NSLayoutConstraint.activate([informationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     informationLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant : 100),
                                     informationLabel.widthAnchor.constraint(equalTo : view.widthAnchor , constant : -20),
                                     informationLabel.heightAnchor.constraint(equalToConstant: 60),
                                     ])
        NSLayoutConstraint.activate([textFieldForAirportCode.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     textFieldForAirportCode.centerYAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant : 50),
                                     textFieldForAirportCode.widthAnchor.constraint(equalToConstant : 200),
                                     textFieldForAirportCode.heightAnchor.constraint(equalToConstant: 50),
                                     ])
        NSLayoutConstraint.activate([searchButton.centerXAnchor.constraint(equalTo: textFieldForAirportCode.centerXAnchor),
                                     searchButton.topAnchor.constraint(equalTo: textFieldForAirportCode.bottomAnchor, constant : 25),
                                     searchButton.widthAnchor.constraint(equalToConstant : 75),
                                     searchButton.heightAnchor.constraint(equalToConstant: 35),
                                     ])
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func handelSearchButton(){
        
        let flightInformationList = FlightInformationList()
        flightInformationList.searchKey = textFieldForAirportCode.text!
        let navigationController = UINavigationController(rootViewController: flightInformationList)
        present(navigationController, animated: true, completion: nil)
    }
    
    
}







