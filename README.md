# ![karumilogo] iOS Basic Training 
[![Build Status](https://travis-ci.com/Karumi/iOSBasicTraining.svg?token=Kb2RqPaWxFZ8XPxpqvqz&branch=master)](https://travis-ci.com/Karumi/iOSBasicTraining)

Code associated to the first level of the Karumi iOS Training.

##Earth 11 Avengers Detector

In Earth 11 the world of super heroes has completely changed. Super heroes are super villans and viceversa. In this earth the Avengers team is now an evil coporation and is not composed by the usual super heroes. The new members of this organization are unknown.

After collaborating with [The Flash from Earth 1][flash] Central City Police Departament has noticed that the new Avengers Team members are the one containing the number four in the super hero id. **Your mission, if you decide to accept it, is to develop an iOS application to show a list of super heroes obtained from a remote API showing the Avengers badge if the super hero is part of the Earth 11 evil Avengers Team.**

As super heroes are now super villans the Cental City Police Departament also requested us a feature to be able to mark a super hero as captured in the detailed screen. Once the super hero has been captured the system will not show information related to the super hero anymore.

##Application mockups

![ApplicationScreencast][applicationScreencast]

##Tasks

* **Task 1:**
    * Create an empty iOS project from XCode.
    * Configure [CocoaPods][cocoapods].
    * Implement part of the domain model abstracting the data source.
    * Write the unit tests needed to cover this functionality. You can use [Nimble][nimble] to implement your matchers.
    * **Bonus:**
    	* Configure Travis-CI as a continous integration system.
    	* Configure Swiftlint as checkstyle tool.
    	* Change application logo.
    	* Change the splash screen xib to use the app logo.

* **Task 2:**
 	* Implement the Super Hero Detail UIViewController using the XCode interface builder and show some mocked data there.
    * Add a button to the first view controller to connect this view controller with the detail view controller and implement this navigation.
 	* **Bonus:**
 		* Read the [KIF Framework][kif] documentation and sample project.
 		* Using the iOS simulator review the accessibility labels configured.

* **Task 3:**
	* Implement the Super Heroes UIViewController using a table view.
	* Show some mocked data in the already implemented Super Heroes screen.
	* Connect the super heroes screen with the system you wrote during the task 1.
	* The tests needed to cover this new funtionality will be covered during another [exercise][kataSuperHeroes].
	* **Bonus:**
		* Replace your UITableView widget with a UICollectionView.
		* Change the Super Heroes screen to show 3 columns if the device is an iPad and 1 column by default.
		* Write some UI Tests using the UI Test recorder.

* **Task 4:**
	* Refactor the already implemented view controllers to use [Model View Presenter][mvp] to develop the application presentation layer.
	* Create all the use cases needed to connect your presentation layer with the already implemented domain.
    * Create a repository to hide the usage of the SuperHeroesAPIClient as data source and be able to add more data sources in the future if needed.
	* Bonus:
		* Review other UI patterns like [Model View ViewModel][mvvm] and reimplement the presentation layer.

* **Task 5:**
	* Connect your already implemented domain with the remote API using an already implemented [Marvel API Client][marvelApiClient] following the repository pattern.
	* The tests needed to cover this new funtionality will be covered during aother [exercise][kataTodoAPIClient].
	* **Bonus:**
		* Using Alamofire implement your own Marvel API Client and replace the old one with this one.
		* Write some integration tests using HTTP stubbing with [Nocilla][nocilla] 
		* Add persistence to the application.
		* Replace the usage of completion handlers with promisses or observables.

* **Extra tasks:**

    * Change your [Model View Presenter][mvp] implementation to use [Botham UI][bothamUI]
    * Add a pull to refresh mechanism.
    * Add an infinite load mechanism and implement pagination.
    * Improve the UX related to the capture a super hero process avoiding the blink effect when a super hero is captured. How can you do this?

License
-------

Copyright 2016 Karumi

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[karumilogo]: https://cloud.githubusercontent.com/assets/858090/11626547/e5a1dc66-9ce3-11e5-908d-537e07e82090.png


[karumilogo]: https://cloud.githubusercontent.com/assets/858090/11626547/e5a1dc66-9ce3-11e5-908d-537e07e82090.png
[applicationScreencast]: ./art/applicationScreencast.gif
[cocoapods]: https://guides.cocoapods.org/using/getting-started.html
[kif]: https://github.com/kif-framework/KIF
[nimble]: https://github.com/Quick/Nimble
[mvp]: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93presenter
[marvelApiClient]: https://github.com/Karumi/MarvelApiClient
[mvvm]: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel
[flash]: https://en.wikipedia.org/wiki/Flash_(comics)
[kataSuperHeroes]: https://github.com/Karumi/KataSuperHeroesIOS/
[nocilla]: https://github.com/luisobo/Nocilla
[kataTodoAPIClient]: https://github.com/Karumi/KataTODOApiClientIOS
[bothamUI]: https://github.com/Karumi/BothamUI/