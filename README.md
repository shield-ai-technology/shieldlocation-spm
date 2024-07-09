# ShieldLocationAnalysisSPM

ShieldLocationAnalysisSPM(shieldlocation-spm) is the ShieldLocationAnalysis Swift Package Manager. For more details, visit [www.shield.com](https://www.shield.com).

## Integrate the SDK

ShieldLocationAnalysis SDK is compatible with apps supporting iOS 12 and above using Swift Package Manager. It is built with Swift. You can install it using the following methods:

**SPM:**

```swift
.package(url: "https://github.com/shield-ai-technology/shieldlocation-spm.git", branch: "main")
```

**Xcode:**

1. Go to `File` -> `Add Packages...`
2. Enter the URL: `https://github.com/shield-ai-technology/shieldlocation-spm.git`
3. Select the branch: `main`

**Note:** We continuously enhance our ShieldLocationAnalysisSPM library with new functionalities, bug fixes, and security updates. We recommend updating to the latest SDK version to protect against rapidly evolving fraud risks.

You can refer to the Changelog to see more details about our updates.

## Add LocationModule

Instantiate an instance of the LocationModule and include it in the Core SHIELD SDK configuration.

**Objective-C:**

```objc
@import ShieldLocationAnalysisSPM;

Configuration *config = [[Configuration alloc] initWithSiteId:@"SHIELD_SITE_ID" secretKey:@"SHIELD_SECRET_KEY"];
config.modules = @[[[LocationModule alloc] init]];
```

**Swift:**

```swift
import ShieldLocationAnalysisSPM

let config = Configuration(withSiteId: "SHIELD_SITE_ID", secretKey: "SHIELD_SECRET_KEY")
config.modules = [LocationModule()]
```

Replace `"SHIELD_SITE_ID"` and `"SHIELD_SECRET_KEY"` with your actual SHIELD site ID and secret key.

## Configure Info.plist

Configure the `Info.plist` file with an XML snippet that contains data about your app. Add strings for `NSLocationWhenInUseUsageDescription` to prompt the user during location permissions for foreground location tracking. For background location tracking, also add strings for `NSLocationAlwaysUsageDescription` and `NSLocationAlwaysAndWhenInUseUsageDescription`.

Add the following keys to your `Info.plist` file:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Add description for foreground-only location usage.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>Add description for background location usage. iOS 10 and below</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>Add description for background location usage. iOS 11 and above</string>
```

## Enable Background Modes

Next, you need to enable `Background fetch` and `Location updates` under Project Settings > Capabilities > Background Modes.

1. Open your project in Xcode.
2. Select your project in the Project Navigator.
3. Select your app target.
4. Go to the `Capabilities` tab.
5. Enable `Background Modes`.
6. Check the boxes for "Background fetch" and "Location updates".

## Track Location

The ShieldLocationAnalysis module tracks location data automatically. No additional code is required to start or stop tracking location data.
