//
//  SelectionPage.swift
//  Ams Tel
//
//  Created by makrowave on 28/03/2025.
//

import SwiftUI

import SwiftUI

struct SelectionPage<T, V: ObservableObject>: View where T: Identifiable & Equatable & DataItem {
    @ObservedObject var viewModel: V
    let options: [T]
    
    var keyPath: ReferenceWritableKeyPath<V, ListItem?>
    var body: some View {
        List(options, id: \.id) {
            item in Button(action: {
                viewModel[keyPath: keyPath] = item as! ListItem?
            }) {
                HStack {
                    Text(item.value)
                    Spacer()
                    if item.id == viewModel[keyPath: keyPath]?.id {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }

            }
        }
    }
}
struct MyPreview: View {
    @StateObject var query: Query<StatusDto> // Make sure to initialize query separately
    @StateObject var cameraViewModel = CameraViewModel()
    
    init() {
        // Resolve the query outside the StateObject initialization
        var queryClient = QueryClient.GetQueryClient("http://localhost:3000")
        queryClient.createQuery(queryKey: ["/status", "1"], url: "/status", interval: 1, template: Query<StatusDto>())
        let query = try! queryClient.getQuery(queryKey: ["/status", "1"])
        _query = StateObject(wrappedValue: query as! Query<StatusDto>)
    }
    
    var body: some View {
        SelectionPage<ListItem, CameraViewModel>(
            viewModel: cameraViewModel,
            options: !query.isError && !query.isLoading
                ? [ListItem(id: query.data?.statusId ?? 0, value: query.data?.statusName ?? "No Data")]
                : [],
            keyPath: \.bikeStatus
        )
        Text(query.error ?? "No error")
    }
}

#Preview {
    MyPreview()
}
