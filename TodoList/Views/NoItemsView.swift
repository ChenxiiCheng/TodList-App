//
//  NoItemsView.swift
//  TodoList
//
//  Created by chenxi cheng on 4/2/23.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        })
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something 🥳")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    }
                )
                .padding(.horizontal, animate ? 30 : 50)
                // 阴影
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 20: 10
                )
                // 变大变小
                .scaleEffect(animate ? 1.1 : 1.0)
                // 上下，左右移动
                .offset(y: animate ? -8 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
