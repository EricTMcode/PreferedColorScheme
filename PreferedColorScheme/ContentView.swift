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

enum schemeType: Int, Identifiable, CaseIterable {
    var id: Self { self }
    case system
    case light
    case dark
}

extension schemeType {
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
    
    @Environment(\.colorScheme) private var colorScheme
    private var weahterTxt: String { colorScheme == .light ? "Day time" : "Night time" }
    
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
            }
            
        }
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
