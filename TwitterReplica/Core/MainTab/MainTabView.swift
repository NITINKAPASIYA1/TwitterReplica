import SwiftUI

enum TabBarItem: Hashable {
    case feed, search, notifications, messages
    
    var iconName: String {
        switch self {
            case .feed: return "house.fill"
            case .search: return "magnifyingglass"
            case .notifications: return "bell.fill"
            case .messages: return "envelope.fill"
        }
    }
    
}

// CustomTabBar.swift
struct CustomTabBar: View {
    @Binding var selectedTab: TabBarItem
    
    var body: some View {
        HStack {
            ForEach([TabBarItem.feed, .search, .notifications, .messages], id: \.self) { tab in
                Spacer()
                TabBarButton(tab: tab, selectedTab: $selectedTab)
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .background {
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
                .shadow(radius: 2)
        }
    }
}

// TabBarButton.swift
struct TabBarButton: View {
    let tab: TabBarItem
    @Binding var selectedTab: TabBarItem
    
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                selectedTab = tab
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: tab.iconName)
                    .symbolEffect(.bounce, value: selectedTab == tab)
                    .font(.system(size: 20))
                   
                
            }
            .foregroundStyle(selectedTab == tab ? .black : .gray)
        }
    }
}

// MainTabView.swift

struct MainTabView: View {
    @State private var selectedTab: TabBarItem = .feed
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                FeedView()
                    .tag(TabBarItem.feed)
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                
                ExploreView()
                    .tag(TabBarItem.search)
                    .navigationTitle("Explore")
                    .navigationBarTitleDisplayMode(.inline)
                
                NotificationsView()
                    .tag(TabBarItem.notifications)
                    .navigationTitle("Notifications")
                    .navigationBarTitleDisplayMode(.inline)
                
                MessagesView()
                    .tag(TabBarItem.messages)
                    .navigationTitle("Messages")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainTabView()
}
