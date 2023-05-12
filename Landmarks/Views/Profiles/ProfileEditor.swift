//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Богдан Радченко on 12.05.2023.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate) ?? Date()
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate) ?? Date()
        return min...max
    }
    var body: some View {
        List {
            HStack {
                Text("Username")
                    .bold()
                Divider()
                TextField("Username", text: $profile.userName)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
                    .bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal photo")
                    .bold()
                
                Picker("Seasonal photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
                
                DatePicker(
                    selection: $profile.goalDate,
                    in: dateRange,
                    displayedComponents: .date
                ) {
                    Text("Goal date")
                        .bold()
                }
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
