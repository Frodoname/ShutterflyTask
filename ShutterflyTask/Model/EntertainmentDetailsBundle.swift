//
//  EntertainmentDetailsBundle.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import Foundation

struct EntertainmentDetailsBundle: Equatable {
    let mainDetails: EntertainmentDetails
    let cast: [CastMember]
    let reviews: [Review]
}
