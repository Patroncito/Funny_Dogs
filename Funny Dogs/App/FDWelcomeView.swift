//
//  FDWelcomeView.swift
//  Funny Dogs
//
//  Created by Alfonso Patron on 08/06/25.
//

import SwiftUI

struct FDWelcomeView: View {
    @State private var animateText = false
    var onContinue: () -> Void

    var body: some View {
        ZStack(alignment: .top) {
            Color.fdShibuBlue.ignoresSafeArea()
            VStack(spacing: 0) {
                Image("FDiconShiba")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 40)

                ZStack {
                    Group {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.white)
                            .frame(height: 120)
                            .shadow(radius: 8)
                            .padding(.horizontal, 24)

                        VStack(spacing: 6) {
                            Text("Bienvenido a")
                                .font(.title3)
                                .foregroundColor(.black.opacity(0.8))
                                .opacity(animateText ? 1 : 0)
                                .offset(y: animateText ? 0 : 10)
                                .animation(.easeOut(duration: 0.8).delay(0.2), value: animateText)

                            Text("Funny Pets")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.black)
                                .opacity(animateText ? 1 : 0)
                                .offset(y: animateText ? 0 : 10)
                                .animation(.easeOut(duration: 0.8).delay(0.4), value: animateText)
                        }
                    }
                    .offset(y: -20)
                }

                Spacer()

                Button {
                    onContinue()
                } label: {
                    Text("Avanzar")
                        .font(.title2)
                        .fontWeight(.regular)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 60)
                .opacity(animateText ? 1 : 0)
                .offset(y: animateText ? 0 : 20)
                .animation(.easeOut(duration: 0.8).delay(0.6), value: animateText)
            }
        }
        .onAppear {
            animateText = true
        }
    }
}

#Preview {
    FDWelcomeView {
    }
}
