//
//  SingleHouseView.swift
//  SteelhacksXIIProject
//
//  Created by Ben Hoffman on 9/20/25.
//

import SwiftUI

struct SingleHouseView: View {
    let housing: HousingData
    
    // Determine background color based on total score
    private var scoreColor: Color {
        switch housing.ratings.total {
        case 90...100:
            return Color.green.opacity(0.5)
        case 75..<90:
            return Color.green.opacity(0.3)
        case 60..<75:
            return Color.blue.opacity(0.3)
        case 40..<60:
            return Color.orange.opacity(0.3)
        default:
            return Color.red.opacity(0.3)
        }
    }
    
    // Determine text color based on total score for better contrast
    private var scoreTextColor: Color {
        switch housing.ratings.total {
        case 80...100:
            return .green
        case 60..<80:
            return .blue
        case 40..<60:
            return .orange
        default:
            return .red
        }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            
            // Building Name split into two lines
            VStack(alignment: .leading, spacing: 4) {
                Text(housing.address.name)
                    .font(.system(size: 80))
                    .fontWeight(.bold)
                
            }
            .foregroundColor(.primary)
            
            // Building Image
            Image(housing.address.previewImage)
                .resizable()
                .scaledToFill()
                .frame(width: 600, height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            
            // Ratings in groups of 2 stacked vertically
            HStack(spacing: 8) {
                RatingPillLarge(icon: "mountain.2", label: "Terrain", value: housing.ratings.terrian)
                RatingPillLarge(icon: "bus", label: "Transit", value: "\(housing.ratings.transitability) min")
                
                RatingPillLarge(icon: "figure.walk", label: "Walk", value: "\(housing.ratings.walkability) min")
                RatingPillLarge(icon: "washer", label: "Laundry", value: housing.ratings.laundry)
                
                RatingPillLarge(icon: "accessibility", label: "Access", value: housing.ratings.accessibility)
            }
            
            // Total Rating with dynamic background color
            VStack {
                Text("\(housing.ratings.total)")
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(scoreTextColor)
                
                Text("/100")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .foregroundColor(scoreTextColor.opacity(0.8))
            }
            .frame(width: 160, height: 160)
            .background(scoreColor)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(scoreTextColor.opacity(0.3), lineWidth: 2)
            )
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        
        Spacer()
    }
}

// Helper view for rating pills
struct RatingPillLarge: View {
    let icon: String
    let label: String
    let value: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundColor(.primary)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

#Preview {
    SingleHouseView(housing: .MOCK_HOUSINGDATA[0])
}
