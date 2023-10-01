//
//  ContentView.swift
//  PreferedColorScheme
//
//  Created by Eric on 01/10/2023.
//

import SwiftUI

enum Assets {
    static let weather = Image("Weather_icon")
}

enum SchemeType: Int, Identifiable, CaseIterable {
    var id: Self { self }
    case system
    case light
    case dark
}

extension SchemeType {
    var title: String {
        switch self {
        case .system:
            return "📱 System"
        case .light:
            return "🌝 Light"
        case .dark:
            return "🌚 Dark"
        }
    }
}

struct ContentView: View {
    
    @AppStorage("systemThemeVal") private var systemTheme: Int = SchemeType.allCases.first!.rawValue
    @Environment(\.colorScheme) private var colorScheme
    
    private var weahterTxt: String { colorScheme == .light ? "Day time" : "Night time" }
    private var selectedScheme: ColorScheme? {
        guard let theme = SchemeType(rawValue: systemTheme) else { return nil }
        switch theme {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    
    var body: some View {
        ZStack {
            Color(.primary)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Assets
                    .weather
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text(weahterTxt)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                
                Picker(selection: $systemTheme) {
                    ForEach(SchemeType.allCases) { item in
                        Text(item.title)
                            .tag(item.rawValue)
                    }
                } label: {
                    Text("Pick a theme")
                }
                .padding()
                .background(.white, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            
        }
        .preferredColorScheme(selectedScheme)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

#Preview {
    ContentView()
}
