//
//  DetailsCore.swift
//  ShutterflyTask
//
//  Created by Fed on 15.04.2024.
//

import ComposableArchitecture

@Reducer
struct DetailsFeature {
    @ObservableState
    struct State: Equatable {
        var itemID: Int
        var contentType: Entertainment.EntertainmentType
        var isLoading = false
        var details: EntertainmentDetailsBundle?
    }
    
    enum Action {
        case fetchItemDetails
        case detailsResponse(Result<EntertainmentDetailsBundle, Error>)
        case toggleFavorite
        case delegate(Delegate)
        
        enum Delegate {
            case toggleFavorite
        }
    }
    
    @Dependency(\.detailsRepository) private var detailsRepository
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchItemDetails:
                state.isLoading = true
                return .run { [itemID = state.itemID, contentType = state.contentType] send in
                    let result = await detailsRepository.getDetails(itemID, contentType)
                    await send(.detailsResponse(result))
                }
            case let .detailsResponse(.success(itemDetails)):
                state.details = itemDetails
                state.isLoading = false
                return .none
            case let .detailsResponse(.failure(error)):
                state.isLoading = false
                debugPrint(error)
                return .none
            case .toggleFavorite:
                return .run { send in
                    await send(.delegate(.toggleFavorite))
                }
            case .delegate:
                return .none
            }
        }
    }
}

