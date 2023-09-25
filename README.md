# FeatureFlagSwift

This project demonstrates the feature flag functionality. 

UI:
The app contains a single screen with a simple text entry field, an enter button, and a label underneath. Once the user enters a username into the field and selects the enter button, a text field with the customized nickname will appear underneath.

![Simulator Screenshot - iPhone 14 - 2023-09-25 at 11 23 27](https://github.com/Akshaytule09/FeatureFlagSwift/assets/20128411/0e90fde0-de1c-4db3-8d5d-d293f96a521c)

Feature:
A Feature class is implemented with two functionality:
1. A feature flag is implemented to return a nick name for username that has been entered by user.
2. A feature flag capitalizeNickname is implememnted which returns if the nick name has to be capitalized or not.

Both of the above feature flags are used in combination to get nickname and capitalize it as per the feature flag state.
