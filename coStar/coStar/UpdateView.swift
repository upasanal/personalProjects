//
//  UpdateView.swift
//  coStar
//
//  Created by Upasana Lamsal on 4/21/24.
//

import SwiftUI

struct UpdateView: View {
    @State private var selectedNumber: Int? = 22

    let numbers = [19, 20, 21, 22, 23]

    var body: some View {
        Rectangle()
                    .fill(Color.white)
                    .frame(height: 90) // Adjust the height as needed
                    .overlay(
                        HStack(spacing: 45) {
                            ForEach(numbers, id: \.self) { number in
                                NumberView(number: number, isSelected: selectedNumber == number)
                                    .onTapGesture {
                                        selectedNumber = number
                                    }
                            }
                        }
                        .padding()
                    )
        Rectangle()
            .frame(width:370,height: 1) // Height of the gray line
            .foregroundColor(Color.gray.opacity(0.3))
            .padding(.top, -8)
            }
        }
struct NumberView: View {
    let number: Int
    let isSelected: Bool

    var body: some View {
        VStack {
            Text(dayOfWeek(for: number))
                .font(.custom("Consolas", size: 15))
                .foregroundColor(.gray)
            Circle()
                .fill(isSelected ? .black : .white)
                .frame(width: isSelected ? 30 : 30, height: isSelected ? 30 : 30)
                .overlay(
                    Text("\(number)")
                        .font(.custom("Consolas", size: 15))
                        .foregroundColor(isSelected ? .white : .gray)
                )
        }
    }

    private func dayOfWeek(for number: Int) -> String {
        // Return the day of the week based on the number
        switch number {
        case 19: return "FRI"
        case 20: return "SAT"
        case 21: return "SUN"
        case 22: return "TODAY"
        case 23: return "TUE"
        default: return ""
        }
    }
}

#Preview {
    UpdateView()
}
