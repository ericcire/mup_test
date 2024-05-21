## Question 1
### Prerequisites

- Swift 5.10
- Xcode 15.4 (15F31d)

### Run
Go to folder `Q1`
Open `moovup_test.playground` by Xcode

From the bottom bar, press the triangle play button, to `Execute Playgrpund`


## Question 2

### Prerequisites

- Swift 5.10
- Xcode 15.4 (15F31d)
- iOS Simulator

### Configuration Setup


#### Configurate API key

Open `{sourceRoot}/Manager/APIManager.swift`, change value of `apiToken` :

```
static let apiToken = "xxxxxxxx"
```

#### Install dependencies
Open `com.eric.test.moovup.xcodeproj` by Xcode

From top menu `File -> Packages` select `Resolve Package Versioons`, wait the packages install finish


### Run

Open `com.eric.test.moovup.xcodeproj` by Xcode

From top menu `Product` select `Run`

### Test

Open `com.eric.test.moovup.xcodeproj` by Xcode

From top menu `Product` select `Test`