import Foundation

class AppUsageMonitor {
    private var usageData: [String: TimeInterval] = [:]
    private let threshold: TimeInterval = 600 // 10 minutes

    // Track app usage
    func trackAppUsage(appName: String, duration: TimeInterval) {
        usageData[appName, default: 0] += duration
        checkThreshold(appName: appName)
    }

    // Check if the usage exceeds threshold
    private func checkThreshold(appName: String) {
        if let totalUsage = usageData[appName], totalUsage > threshold {
            alertUser(appName: appName)
        }
    }

    // Alert the user
    private func alertUser(appName: String) {
        print("Alert: You have exceeded the usage limit for \(appName)!")
    }
}