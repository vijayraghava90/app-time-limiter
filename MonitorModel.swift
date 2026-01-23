import Foundation
import FamilyControls
import DeviceActivity
import ManagedSettings

class MonitorModel: ObservableObject {
    @Published var selection = FamilyActivitySelection()
    private let center = DeviceActivityCenter()
    
    func requestAuthorization() {
        Task {
            do {
                try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
            } catch {
                print("Failed to enroll with error: \(error.localizedDescription)")
            }
        }
    }
    
    func startMonitoring() {
        let schedule = DeviceActivitySchedule(
            intervalStart: DateComponents(hour: 0, minute: 0),
            intervalEnd: DateComponents(hour: 23, minute: 59),
            repeats: true
        )
        
        let threshold = DeviceActivityEvent.Threshold(
            cumulative: true,
            duration: DateComponents(minute: 10)
        )
        
        let event = DeviceActivityEvent(
            applications: selection.applicationTokens,
            categories: selection.categoryTokens,
            webDomains: selection.webDomainTokens,
            threshold: threshold
        )
        
        let activityName = DeviceActivityName("DailyLimit")
        let eventName = DeviceActivityEvent.Name("TenMinuteLimit")
        
        do {
            try center.startMonitoring(activityName, during: schedule, events: [eventName: event])
            print("Started monitoring successfully.")
        } catch {
            print("Error starting monitoring: \(error.localizedDescription)")
        }
    }
    
    func stopMonitoring() {
        center.stopMonitoring([DeviceActivityName("DailyLimit")])
        print("Stopped monitoring.")
    }
}
