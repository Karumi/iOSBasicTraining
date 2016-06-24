# ![karumilogo] iOSBasicTraining 
[![Build Status](https://travis-ci.com/Karumi/iOSBasicTraining.svg?token=Kb2RqPaWxFZ8XPxpqvqz&branch=master)](https://travis-ci.com/Karumi/iOSBasicTraining)

Code associated to the first level of the Karumi iOS Training.

##Avengers detector

In hearth 11 the world of super heroes has completely changed. Super heroes are super villans and viceversa. In this earth the Avengers team is now an evil coporation and is not composed by the usual super heroes. The new members of this organization are unknown.

After collaborating with The Flash from Earth 1 Central City Police Departament has noticed that the new Avengers Team members are the one containing the number four in the super hero id. **Your mission, if you decide to accept it, is to develop an iOS application to show a list of super heroes obtained from a remote API and show a list of super heroes with the Avengers badge if the super hero es part of the evil Avengers Team.**

![ApplicationScreencast][applicationScreencast]

As super heroes are now super villans the Cental City Police Departament requested us a feature to be able to mark a super hero as captured in the detailed screen. Once the super hero has been captured the system will not show information related to the super hero anymore.

##Tasks

* **Task 1:**
    * Create an empty iOS project.
    * Configure CocoaPods.
    * Implement part of the domain model abstracting the data sources.
    * Write the unit tests needed to cover this functionality. You can use [Nimble][nimble] to implement your matchers.
    * **Bonus:**
    	* Configure Travis-CI as a continous integration system.
    	* Configure Swiftlint as checkstyle tool.

* **Task 2:**
 	* Implement the Super Hero Detail UIViewController using the XCode interface builder and show some mocked data there.
 	* **Bonus:**
 		* Read the [KIF Framework][kif] documentation and sample project.
 		* Using the iOS simulator review the accessibility labels configured.

* **Task 3:**
	* Implement the Super Heroes UIViewController using a table view.
	* Show some mocked data in the already implemented Super Heroes screen.
	* Connect the super heroes screen with the system you wrote during the task 1.
	* **Bonus:**
		* Replace your UITableView widget with a UICollectionView.
		* Change the Super Heroes screen to show 3 columns if the device is an iPad and 1 column by default.

* **Task 4:**
	* Refactor the already implemented view controllers to use [Model View Presenter][mvp] to develop the application presentation layer.
	* Create all the use cases needed to connect your presentation layer with the already implemented domain.
	* Bonus:
		* Review other UI patterns like [Model View ViewModel][mvvm] and reimplement the presentation layer.

* **Task 5:**
	* Connect your already implemented domain with the remote API using an already implemented [Marvel API Client][marvelApiClient].
	* **Bonus:**
		* Using Alamofire implement your own Marvel API Client and replace the old one with this one.
		* Add persistence to the application.

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