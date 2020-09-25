# ACP -> AEP Backwards Compatiblity

## BETA ACKNOWLEDGEMENT

ACP -> AEP Backwards Compatiblity is currently in Beta. Use of this code is by invitation only and not otherwise supported by Adobe. Please contact your Adobe Customer Success Manager to learn more.

By using the Beta, you hereby acknowledge that the Beta is provided "as is" without warranty of any kind. Adobe shall have no obligation to maintain, correct, update, change, modify or otherwise support the Beta. You are advised to use caution and not to rely in any way on the correct functioning or performance of such Beta and/or accompanying materials.

### About this Project

This project contains the code required to upgrade from the existing ACP SDK to the latest AEP SDK without introducing breaking changes so you can enjoy the benefits of the newest AEP SDK without needing to reimplement the SDK.

### Usage
To upgrade, simply update your refrence to `ACPCore` in your projects `Podfile` as such:
```diff
- pod 'ACPCore'
+ pod 'ACPCore', :git => 'https://github.com/adobe/aep-sdk-compatibility-ios.git', :branch => 'main'
```

Then run `pod install` and build your project and you will be using the latest `AEPCore` SDK.

### Sample Apps
Two sample apps for this project exist under the `testApps` directory, there exists one Swift and one Objective-C. 

### Contributing

Contributions are welcomed! Read the [Contributing Guide](./.github/CONTRIBUTING.md) for more information.

### Licensing

This project is licensed under the Apache V2 License. See [LICENSE](LICENSE) for more information.
