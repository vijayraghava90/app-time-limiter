# App Time Limiter

The **App Time Limiter** is a specialized iOS application developed using the **SwiftUI** framework. Its primary objective is to assist users in managing their digital well-being by monitoring the time spent on specific social media platforms, such as Instagram and X (formerly Twitter). The application leverages Apple's modern **Screen Time API** to provide a privacy-preserving and efficient monitoring solution.

## Core Functionality

The application provides a streamlined interface for users to configure their usage limits. By utilizing the **Family Activity Picker**, users can securely select the applications they wish to monitor without the app ever seeing the specific names or data of those applications. Once the cumulative usage of the selected apps reaches the predefined **10-minute threshold**, the system triggers a local notification to alert the user.

| Component | Description |
| :--- | :--- |
| **App Selection** | Securely choose applications via the system-provided picker. |
| **Usage Tracking** | Monitors cumulative daily usage across all selected apps. |
| **Alert System** | Dispatches immediate local notifications upon reaching the time limit. |

## Technical Architecture

The project is structured into several key modules, each responsible for a specific aspect of the application's lifecycle and monitoring capabilities.

| File Name | Responsibility |
| :--- | :--- |
| `AppTimeLimiterApp.swift` | Serves as the main entry point for the SwiftUI application. |
| `ContentView.swift` | Defines the primary user interface and interaction logic. |
| `MonitorModel.swift` | Manages the interaction with `DeviceActivity` and `FamilyControls`. |
| `AppUsageMonitor.swift` | Implements the threshold detection logic for the monitor extension. |
| `NotificationManager.swift` | Centralizes the management of local notification requests and alerts. |
| `AppDelegate.swift` | Handles application-level lifecycle events and permission requests. |

## Implementation and Deployment

To deploy this application, developers must integrate these source files into a standard Xcode project. It is essential to configure the necessary **Capabilities** within the Xcode project settings, specifically enabling **Family Controls** and **Device Activity**. 

> **Note**: The `AppUsageMonitor` logic is designed to reside within a **Device Activity Monitor Extension** target. Furthermore, the application requires the **Screen Time API entitlement**, which is granted by Apple to developers with an active developer account.

The use of the `DeviceActivity` framework ensures that the monitoring process is handled by the system, providing a robust solution that remains active even when the application is not running in the foreground.
