//
//  Calendar.swift
//  help
//
//  Created by adil bhatti on 6/11/21.
//

import SwiftUI

struct Calendar: View {
    
    @State var schoolDay: Date = Date()
    @State var showAddDate = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
        
    }
    
    
    
    var body: some View {
        NavigationView{
            ZStack{
                coloring
                ScrollView{
                    DatePicker("School Day", selection: $schoolDay, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .secondary, radius: 10, y:5)
                        .padding(.horizontal)
                        .accentColor(.red)
                    Text(dateFormatter.string(from: schoolDay))
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding(.horizontal, 20)
                        .padding(.bottom)
                        .padding(.top)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.red)
                        .shadow(color: .secondary, radius: 5, y:5)
                        .padding(.top)
                    Text("Missing Groups:")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                        
                }.navigationTitle("Calendar")
                .fullScreenCover(isPresented: $showAddDate, content: {
                    EditerScreen(schoolDay: $schoolDay)
                })
                

                
            }.navigationBarItems(trailing: Button(action: {showAddDate.toggle()}, label: {
                Image(systemName: "plus").resizable().foregroundColor(.white)
                                        .frame(width: 25, height: 25)
                                        .scaledToFit()
                                        .padding(.horizontal, 5)
                                        .padding(.top)
                                        .shadow(color: .secondary, radius: 2, y: 4)
            }) )
            
            
        }
    }
}


struct EditerScreen: View {
    @State var Date: Date?
    @Environment(\.presentationMode) var presentationMode
    @Binding var schoolDay: Date
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
        
    }
    
    var body: some View{
        
        ZStack{
            Color.red.ignoresSafeArea()
            ScrollView{
                
                VStack{
                    HStack{
                        Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.title2)
                            .padding()
                        
                    })
                        Spacer()
                    }.padding(.bottom, -40)
                Text("Add Event")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.top)
                    .padding(.bottom, -15)
                    .overlay(
                        Capsule(style: .continuous)
                            .frame(height: 4)
                            .offset(y: 5)
                            .foregroundColor(.white)
                    , alignment: .bottom)
                
                    DatePicker("School Day", selection: $schoolDay, in: Foundation.Date()..., displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .secondary, radius: 10, y:5)
                        .padding(.horizontal)
                        .accentColor(.red)
                        .padding(.top)
                    Text(dateFormatter.string(from: schoolDay))
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding(.horizontal, 20)
                        .padding(.bottom)
                        .padding(.top)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.red)
                        .shadow(color: .secondary, radius: 5, y:5)
                        .padding(.top)
                    
                    submittButton
                
            }
            }
            
        }
    }
    
    
    
    
    
    
    
    
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        Calendar()
    }
}

extension  Calendar{
    private var coloring: some View{
        RadialGradient(
            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))]),
            center: .topLeading,
            startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/,
            endRadius: UIScreen.main.bounds.height)
            .ignoresSafeArea()
        
        
    }
}



extension EditerScreen{
    
    private var submittButton: some View{
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Submit")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
                .background(Color.blue)
                .accentColor(.white)
                .cornerRadius(10)
                .shadow(color: .secondary, radius: 7, y: 5)
                .padding()
        })
    }
    
}
