//
// Created by Nicolas Legros on 2021-02-15.
//

import Foundation


enum TaskTypeModel: String, CaseIterable, Equatable {
    case homework = "Homework"
    case exam = "Exam"
    case project = "Project"
    case lab = "Lab"

    var typeId: String {
        switch self {
        case .homework:
            return "Homework"
        case .exam:
            return "Exam"
        case .project:
            return "Project"
        case .lab:
            return "Lab"
        }
    }

//    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }

}
