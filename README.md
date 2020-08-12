# ACP -> AEP Backwards Compatiblity

This project contains the code required to upgrade from the existing ACP SDK to the latest AEP SDK without introducing breaking changes so you can enjoy the benefits of the newest AEP SDK without needing to reimplement the SDK.

### Usage
To upgrade, simply update your refrence to `ACPCore` in your projects `Podfile` as such:
```diff
- pod 'ACPCore'
+ pod 'ACPCore', :git => 'https://git.corp.adobe.com/nporter/aep-sdk-compatibility-ios.git', :branch => 'main'
```

Then run `pod install` and build your project and you will be using the latest `AEPCore` SDK.

### Sample Apps
Two sample apps for this project exist under the `testApps` directory, there exists one Swift and one Objective-C. 

### Contributing

Contributions are welcomed! Read the [Contributing Guide](./.github/CONTRIBUTING.md) for more information.

### Licensing

This project is licensed under the Apache V2 License. See [LICENSE](LICENSE) for more information.
