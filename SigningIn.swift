//
//  SigningIn.swift
//  help
//
//  Created by adil bhatti on 6/11/21.
//

import SwiftUI
import Firebase



struct SigningIn: View {
    
    @State var observingMode: Int = 0
    @State var email: String = ""
    @State var password: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge:.leading))
    
    @AppStorage("email") var userEmail: String?
    @AppStorage("password") var userPassword: String?
    @AppStorage("signed_in") var userSignedIn: Bool = false
    
    var body: some View {
        ZStack{
            //Color.red
        VStack{
        switch observingMode{
        case 0:
            startingScene
                .transition(transition)
        case 1:
            infoScene
                .transition(transition)
        default:
            RoundedRectangle(cornerRadius: 25)
        }
       
                
           bottomButton
        }
        }.alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
    }


struct SigningIn_Previews: PreviewProvider {
    static var previews: some View {
        SigningIn()
    }
}

// MARK: VIEWING THINGS
extension SigningIn {
    
    private var bottomButton: some View {
        Text(observingMode == 0 ? "SIGN UP": "NEXT")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.red)
            .padding()
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(10)
            .padding()
            .shadow(color: .secondary, radius: 10, y:10)
            .onTapGesture {
                handleButtonPress()
            }
        
    }
    
    private var startingScene: some View {
        VStack{
            Spacer()
            Text("Cafeteria App")    .font(.largeTitle)  .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Image(systemName: "flame")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .foregroundColor(.white)
                .shadow(color: .secondary, radius: 10, y:10)
            Spacer()
            
        }.padding()
      
}
    private var infoScene: some View {
        VStack{
            
            Text("Email and Password Here: ")    .font(.largeTitle)  .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white).multilineTextAlignment(.center)
         
            TextField("Email", text: $email)
                .padding()
                .foregroundColor(.red)
                .frame(height:55)
                .background(Color.white)
                .cornerRadius(13)
                .padding()
                .shadow(color: .secondary, radius: 10, y:10)
            TextField("Password", text: $password)
                .padding()
                .foregroundColor(.red)
                .frame(height:55)
                .background(Color.white)
                .cornerRadius(13)
                .padding()
                .shadow(color: .secondary, radius: 10, y:10)
            Spacer()
            Spacer()
            Image(systemName: "flame")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .foregroundColor(.white)
                .shadow(color: .secondary, radius: 10, y:10)
            
            
            
            Spacer()
        }.padding()
      
}
}
// MARK: Function
extension SigningIn {
    
    func handleButtonPress() {
        withAnimation(.easeIn){
        if(observingMode == 0){
            observingMode += 1
        }else{
            guard email.count>=5 else{
                makeAlert(title: "Your email was too short 🙃")
                return
            }
            guard password.count>=5 else{
                makeAlert(title: "Your password was too short 👉👈🥺")
                return
            
            
        }
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    makeAlert(title: "Either this password is incorrect or this is a non valid user 😔")
                }else{
                    signIn()

                    
                }
           }
            
        }
    }
    }
    func makeAlert(title:String){
        alertTitle = title
        showAlert.toggle()
        
    }
    
    
    func signIn(){
        
       
                userEmail = email
                userPassword = password
        withAnimation(.easeIn){
                userSignedIn = true
    }
            
        }
        
        
        
        
    }
    

