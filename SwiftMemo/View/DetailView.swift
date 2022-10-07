import SwiftUI

struct DetailView: View{
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer=false
    
    var body: some View{
        VStack{
            ScrollView{
                VStack{
                    HStack {
                        Text(memo.content)
                            .padding()
                        
                        Spacer(minLength: 0)
                    }
                    
                    Text(memo.insertDate, style:.date)
                        .padding()
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItemGroup(placement: .bottomBar){
                Button{
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                        .fontWeight(.bold)
                }
            }
        }
        .sheet(isPresented: $showComposer){
            ComposeView(memo:memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationView{
            DetailView(memo: Memo(content: "Hello"))
                .environmentObject(MemoStore())
        }
    }
}
