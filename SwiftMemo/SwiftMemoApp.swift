import SwiftUI

@main
struct SwiftMemoApp: App{
    @StateObject var store=MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene{
        WindowGroup{
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)

        }
    }
}
