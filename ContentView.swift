//
//  ContentView.swift
//  help
//
//  Created by adil bhatti on 6/11/21.
//
import SwiftUI

struct ContentView: View {
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge:.leading))
    
    @AppStorage("signed_in") var userSignedIn: Bool = false
    
    var body: some View {
        ZStack{
            coloring
            
            if userSignedIn {
                TabView{
                    
                    MainScreen()
                        .transition(transition)
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        
                    SearchBarView().transition(transition)
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        
                    Calendar()
                        .tabItem{
                            Image(systemName: "calendar")
                            Text("Calendar")
                        }
                        
                }.accentColor(.red)
            }else{
                SigningIn()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension ContentView{
    
    private var coloring: some View{
        RadialGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))]),
            center: .topLeading,
            startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/,
            endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
        
        
    }
    
}
