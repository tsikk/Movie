# Movie

<img src="https://user-images.githubusercontent.com/84790229/182310472-9e15b9e8-196d-4867-a59c-90a1edbf0469.png" width="250" height="440">

Project is built with MVVM+UIKit+SwiftUI, reason for UIKit + SwiftUI interoperability. Given the benefits of using SwiftUI for future development, it will be a common requirement to integrate the new SwiftUI app functionality with the existing project codebase. Fortunately, this integration is achieved easily using UIHostingController.

Movie's app uses structured concurrency, This approach develops project to execute, cancel, and monitor concurrent operations in Swift, and builds upon the work introduced by async/await and async sequences. It uses generic network layer with async/await operations.

It uses CoreData framework to save our favourite movies in the local database. We are using CoreData because of much better memory management, when we have changes, we can save only the changed objects, not the entire data set. We can read/write our model objects directly instead of converting them to/from something like an NSDictionary. Relationships between entities are handled directly and etc. 

We can also adjust several languages with Localized string

<img src="https://user-images.githubusercontent.com/84790229/182314036-36dc0528-726e-4b95-a3cb-9212d2cd2d52.png" width="250" height="440">
<img src="https://user-images.githubusercontent.com/84790229/182314030-d93bfd58-2253-4e88-b94d-bcb061f24ea3.png" width="250" height="440">
Project supports light mode as well as dark mode



## Third Party libraries

Kingfisher -> allows us to convert fetch urls into the actual image, we could also use AsyncImage, but it still has some issues, that are not resolved yet. 


## Challenges I faced: 
Error handling is configured in the project, but it is not fully implement. for example: we do not support no network connection yet. 

Favourites tab bar needs to be polished, our favourite movies, which are saved with the help of CoreData, do not appears, until we terminate and re-launch the program. Reason for this is that navigation implementation has some issue, simply list appears before the actual fetch happens from the local database. 

<img src="https://user-images.githubusercontent.com/84790229/182314373-208891f0-b7bf-43c9-adaa-89a83112bd46.png" width="250" height="440">


## How To Test: 

- Execute the project. 

- On the first tab bar we can see top rated movies, we can scroll down and see actual movies, we can also add them with star button to the favourites or tap the movie for detailed overview. 

- On the second tab bar there is favourite movies
