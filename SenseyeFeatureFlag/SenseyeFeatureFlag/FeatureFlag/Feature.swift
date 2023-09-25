//
//  Feature.swift
//  SenseyeFeatureFlag
//
//  Created by Akshay Tule on 24/09/23.
//

import Foundation

//MARK: protocol
/// In case the propertied are not set as private(set), this protocol would be helpful to set the blueprint of the Faeture flag.
protocol NickNameProtocol: AnyObject {
    func getNickName() -> String
    func shouldCapitalizeNickname() -> Bool
}

//MARK: Primary feature flag functionality
class Feature {

    private var names: [Name]
    // private(set) will act as getter function instead of writting a new method for getting this nickName. We can access the nickName from outside class but cannot set from outside.
    private(set) var nickName: String = String.k.emptyString
    private(set) var capitalizeNickname: Bool = false
    
    /// Initializer
    /// - Parameter userName: username entered by user in the username textfield.
    init(userName: String) {
        names = [Name(name: UserName.firstUser, nickName: NickName.firstUser, shouldCapitalizeNickname: true),
                      Name(name: UserName.secondUser, nickName: NickName.secondUser, shouldCapitalizeNickname: false),
                      Name(name: UserName.thirdUser, nickName: NickName.thirdUser, shouldCapitalizeNickname: true)]
        mapNameFor(username: userName)
    }
    
    /// Map username to get nickname and set capitalization feature flag.
    /// - Parameter username: username entered by user in the username textfield.
    private func mapNameFor(username: String) {
        if let mappedNickName = names.first(where: { $0.name.lowercased() == username }) {
            nickName = mappedNickName.nickName
            capitalizeNickname = mappedNickName.shouldCapitalizeNickname
        } else {
            nickName = NickName.defaultNickName
        }
    }
}

//MARK: protocol implementation
// Kept the getter functions for reference as it was mentioned in assignment. As nickName and capitalizeNickname these properties are declared as private(set) these getter methods are not required.
extension Feature: NickNameProtocol {
    
    func getNickName() -> String {
        return nickName
    }

    func shouldCapitalizeNickname() -> Bool {
        return capitalizeNickname
    }
}

//MARK: Constants declaration
private extension Feature {
    enum UserName {
        static let firstUser = "wsmith1"
        static let secondUser = "mAndM"
        static let thirdUser = "jdoe21"
    }
    
    enum NickName {
        static let firstUser = "Fresh Prince"
        static let secondUser = "Slim Shady"
        static let thirdUser = "Jam Handsome"
        static let defaultNickName = "Anonymous"
    }
}
