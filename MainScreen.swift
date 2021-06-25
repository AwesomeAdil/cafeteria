//
//  MainScreen.swift
//  help
//
//  Created by adil bhatti on 6/11/21.
//

import SwiftUI

struct MainScreen: View {
    @State var amountFoodStartingWith: Int?
    @State var amountFoodEndingWith: Int?
    @AppStorage("signed_in") var userSignedIn: Bool = false
    var body: some View {
        NavigationView{
        ZStack{
            coloring
            
            ScrollView{
            VStack{
                Text("Lunch For Today")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                    .overlay(
                        Capsule(style: .continuous)
                            .frame(height: 4).offset(y: -10)
                        , alignment: .bottom).foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.top, -80)
                    .navigationBarItems(leading: signOutButton)
                VStack{
                    HStack{
                    Text("Starting Inventory (in lbs):")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    }
                    TextField("Type Something Here", value: $amountFoodStartingWith, formatter: NumberFormatter())
                        .frame(height: 55)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .secondary, radius: 10, y:10)
                    
                    HStack{
                    Text("Ending Inventory (in lbs):")
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                    Spacer()
                    }
                    TextField("Type Something Here", value: $amountFoodEndingWith, formatter: NumberFormatter())
                        .frame(height: 55)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: .secondary, radius: 10, y:10)
                    Text("Missing Groups:")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                }.padding(.horizontal)
            Spacer()
            }
        }
    }
        }
}
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
// MARK: COMPONENTS
extension  MainScreen{
    private var coloring: some View{
        RadialGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))]),
            center: .topLeading,
            startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/,
            endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
        
        
    }
    
    private var signOutButton: some View{
        Button(action: {handleSignOut()}, label: {
            Text("Sign Out")
                .font(.footnote)
                .padding(.all, 5)
                .background(Color.white)
                .cornerRadius(20)
                .accentColor(.red)
                .padding(.leading, -10)

                .shadow(color: .gray, radius: 5, y: 5)
                
        })
    }
    
    
}

// MARK: FUNCTIONS
extension MainScreen{
    func handleSignOut(){
        withAnimation(.easeIn){
        userSignedIn = false
        }
        
    }
    
    
}
