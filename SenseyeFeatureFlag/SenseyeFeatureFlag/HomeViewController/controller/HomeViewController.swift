//
//  HomeViewController.swift
//  SenseyeFeatureFlag
//
//  Created by Akshay Tule on 24/09/23.
//

import UIKit
//MARK: Controller Life Cycle
// setup view controller loading attributes
class HomeViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
        
    private let viewModel: HomeControllerViewModel
    
    /// Initializer
    /// - Parameter viewModel: view model
    init(viewModel: HomeControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @IBAction func enterButtonTap(_ sender: Any) {
        // check if username entered is valid and proceed for mapping nickname.
        guard validUserName(userNameTextField.text ?? String.k.emptyString), let userName = userNameTextField.text else { return }
        userNameTextField.resignFirstResponder()
        nickNameLabel.text = viewModel.getNickNameFor(userName.lowercased())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    /// UI setup
    private func setupUI() {
        userNameTextField.delegate = self
        setupTextFieldPadding()
        setupTextfieldBorder()
    }
}

//MARK: UI Setup
// private extension for adding all UI handling methods
private extension HomeViewController {
    /// set up all textfields text padding
    func setupTextFieldPadding() {
        userNameTextField.setLeftPaddingPoints(Constants.textFieldPadding)
        userNameTextField.setRightPaddingPoints(Constants.textFieldPadding)
    }
    
    // setup textfield UI attributes
    func setupTextfieldBorder() {
        userNameTextField.clipsToBounds = true
        userNameTextField.layer.cornerRadius = Constants.textFieldCornerRadius
        userNameTextField.layer.borderWidth = Constants.textFieldBorderWidth
        userNameTextField.layer.borderColor = Constants.textFieldBorderColor
    }
}

//MARK: Textfield Delegate
extension HomeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        nickNameLabel.text = String.k.emptyString
    }
}

private extension HomeViewController {
    /// validate user name
    /// - Parameter userName: username entered by user in username text field.
    /// - Returns: boolean for valid user name.
    func validUserName(_ userName: String) -> Bool {
        guard !userName.isEmpty else { return false }
        return true
    }
}

//MARK: Constants
private extension HomeViewController {
    enum Constants {
        static let textFieldPadding: CGFloat = 10.0
        static let textFieldCornerRadius: CGFloat = 16.0
        static let textFieldBorderWidth: CGFloat = 1.0
        static let textFieldBorderColor = UIColor.black.cgColor
    }
}
