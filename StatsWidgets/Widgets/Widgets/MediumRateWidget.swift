//
//  SmallRateWidget.swift
//  StatsWidgetsExtension
//
//  Created by Andrey Chernyshev on 12.07.2021.
//

import WidgetKit
import SwiftUI

struct MediumRateWidget: Widget {
    let placeholder = StatsContent(date: Date(),
                                   passRate: 75,
                                   testTaken: 0,
                                   testsTakenNum: 10,
                                   correctAnswers: 0,
                                   correctAnswersNum: 374,
                                   questionsTaken: 0,
                                   answeredQuestions: 400)
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "MediumRateWidget", provider: Provider(placeholder: placeholder)) { entry in
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    PassRateView(title: "Widgets.PassRate".localized,
                                 progressFontSize: 19.scale,
                                 progress: entry.passRate / 100,
                                 titleColor: Color.make(251, green: 171, blue: 50),
                                 progressColor: Color.make(41, green: 49, blue: 138))
                    Spacer()
                    HStack() {
                        MediumVerticalRateView(count: entry.testsTakenNum,
                                               title: "Widgets.TestsTaken".localized,
                                               color: Color.make(251, green: 171, blue: 50))
                        Spacer()
                        MediumVerticalRateView(count: entry.correctAnswersNum,
                                               title: "Widgets.CorrectAnswers".localized,
                                               color: Color.make(41, green: 49, blue: 138))
                        Spacer()
                        MediumVerticalRateView(count: entry.answeredQuestions,
                                               title: "Widgets.QuestionsTaken".localized,
                                               color: Color.make(255, green: 223, blue: 128))
                    }
                }
                .padding(16)
            }
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Widgets.Medium.Name".localized)
        .description("Widgets.Medium.Description".localized)
    }
}
