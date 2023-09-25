# FeatureFlagSwift

This project demonstrates the feature flag functionality. 

**UI:**
The app contains a single screen with a simple text entry field, an enter button, and a label underneath. Once the user enters a username into the field and selects the enter button, a text field with the customized nickname will appear underneath.

![Simulator Screenshot - iPhone 14 - 2023-09-25 at 11 23 27](https://github.com/Akshaytule09/FeatureFlagSwift/assets/20128411/0e90fde0-de1c-4db3-8d5d-d293f96a521c)

**Feature:**
A Feature class is implemented with two functionality:
1. A feature flag is implemented to return a nick name for username that has been entered by user.
2. A feature flag capitalizeNickname is implememnted which returns if the nick name has to be capitalized or not.

Both of the above feature flags are used in combination to get nickname and capitalize it as per the feature flag state.

**Pull Request **
Description:
This PR contains following changes:
UI
1. UI for nickname functionality. Textfield, enter button and a label.
Feature Flag:
1. Initialising the names array.
2. Mapping the input username to existing usernames in names array and return an associated nickname. 
3. Using the capitalizeNickname flag along with the nicknames flag to decide whether the nickname shall be shown all uppercased or as it is as mapped in names array.
View Model:
1. HomeControllerViewModel to manage the data handling for nickname functionality, to interact with Feature class and get required output and pass to the HomeViewController

Classes modified/added:
Feature.swift, NamesModel.swift, HomeControllerViewModel.swift, HomeViewController.swift, HomeViewController.xib, RootControllerCoordinator.swift

**Unit test cases:**

Classes which can have unit test cases:
1. class Feature
2. class HomeControllerViewModel

How to ensure essential functions are working appropriately:
1. class Feature
 	As class Feature contains two functionalities
	1. To initialise names mapping array.
	2. To get a nickname from mapped usernames.
	3. To check if this nickname need to be uppercased.
  Unit tests can be written as follows:
  	 1. Initialise the Feature class with a username existing in names mapping array and check if names array, nickName and capitalizeNickname flags are initialised properly as per data or not.
    2. Initialise the Feature class with a name which is not present in names array and check if a default nickname is assigned or not.
    3. Check for capitalizeNickname flag with true or false value by passing different usernames which are present in the mapping or not present in the mapping while initialising the Feature class.
    4. In case of where instead of private(set) property is not used for the nickName and capitalizeNickname then the NickNameProtocol methods which has been implemented will need the above two test cases.

2. class HomeControllerViewModel
    1. func getNickNameFor method can accept username and returns a nickname (capitalised or as it is as per the capitalisation feature flag). 
    2. Initialise the getNickNameFor function with a username existing in names mapping array and check if the correct nick name is returned.
    3. Initialise the getNickNameFor function with a username existing in names mapping array and if feature flag capitalizeNickname is true for that username then check if the correct nick name with all uppercase is returned or not.

3. class HomeViewController
    1. func validUserName(_ userName: String): empty username or any other conditions like charencters needed in username can be checked with unit test case for this function and the output of function (true/false) can be validated.

