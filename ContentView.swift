import SwiftUI
import FamilyControls

struct ContentView: View {
    @StateObject private var model = MonitorModel()
    @State private var isPickerPresented = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Configuration")) {
                    Button("Select Apps to Limit") {
                        isPickerPresented = true
                    }
                    .familyActivityPicker(isPresented: $isPickerPresented, selection: $model.selection)
                }
                
                Section(header: Text("Status")) {
                    HStack {
                        Text("Limit")
                        Spacer()
                        Text("10 Minutes")
                            .foregroundColor(.secondary)
                    }
                    
                    ForEach(Array(model.selection.applicationTokens), id: \.self) { token in
                        Label(token) // In a real app, this would show the app name
                    }
                }
                
                Section {
                    Button("Start Monitoring") {
                        model.startMonitoring()
                    }
                    .disabled(model.selection.applicationTokens.isEmpty)
                    .foregroundColor(.blue)
                    
                    Button("Stop Monitoring") {
                        model.stopMonitoring()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("App Time Limiter")
            .onAppear {
                model.requestAuthorization()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
