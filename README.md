**Concepts used:**
- Google Swift style guide: https://google.github.io/swift/
- MVVM architectural design pattern:

  - https://medium.com/blablacar/rxswift-mvvm-66827b8b3f10
  - https://medium.com/@mshcheglov/mvvm-design-pattern-with-combine-framework-on-ios-5ff911011b0b

**Project organization:**
- Protocols
- Extensions
  - Common
  - Screens: **Each screen will have a view and a view model**
      - WelcomeScreen: ** Prompts user to choose the method to present SubscribePlanPromptScreen **
      - SubscribePlanPromptScreen: ** Prompts user to subscribe **
        
**NOTES**
- Design dimensions from Figma are placed in enums named `Constant` for each view:
<img width="586" alt="Screenshot 2024-09-13 at 09 57 38" src="https://github.com/user-attachments/assets/f1778fc2-eb9a-4bdf-9153-793fd446994f">

- Strings are defined in `Localizable.xcstrings`:
<img width="552" alt="Screenshot 2024-09-13 at 09 58 47" src="https://github.com/user-attachments/assets/c1d456ec-403b-4a16-bb73-7af74d73082b">

- Colors are defined in `Colors.xcassets`:
<img width="552" alt="Screenshot 2024-09-13 at 09 58 47" src="https://github.com/user-attachments/assets/c1d456ec-403b-4a16-bb73-7af74d73082b">


Recording: (on **iPhone 15**)
https://github.com/user-attachments/assets/0804eeaa-5027-43d6-aa2a-5d0ce6c60db9

| Device | Light | Dark |
| :-------------: |:-------------:| :-----:|
|  **iPhone 15**      | ![iphone15](https://github.com/user-attachments/assets/63289346-6cab-469c-aa7f-13daced7ce32) | ![iphone15-dark](https://github.com/user-attachments/assets/7209e9bc-acf2-47d9-8fe3-49e408f72bed) |
| **iPhone SE (with touch ID)** | ![iphoneSE](https://github.com/user-attachments/assets/c91e222e-9788-458c-8a97-103bc67f2af1) | ![iphoneSE-dark](https://github.com/user-attachments/assets/fa2e980b-b4bf-4e73-985b-a5845473a8d8) |
| **iPad Air 11-inch** | ![ipad-air-11](https://github.com/user-attachments/assets/ec22eacb-e521-437a-98e1-39453d1b7b61) | ![ipad-air-11-dark](https://github.com/user-attachments/assets/17988c4c-eec2-4bc9-befd-5dc45af79631)  |
 
 
 
















  

