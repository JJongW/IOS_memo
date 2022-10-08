import Foundation

class MemoStore:ObservableObject{
    @Published var list: [Memo] //view도 자동업데이트

    init(){
        list=[
            Memo(content: "메모 테스트5", insertDate: Date.now),
            Memo(content: "메모 테스트4", insertDate: Date.now),
            Memo(content: "메모 테스트3", insertDate: Date.now),
            Memo(content: "메모 테스트2", insertDate:Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "메모 테스트1", insertDate:Date.now.addingTimeInterval(3600 * -24))
        ]
    }

    func insert(memo: String){
        list.insert(Memo(content:memo), at: 0)
    }

    func update(memo: Memo?, content: String){
        guard let memo = memo else{
            return
        }
        memo.content =  content
    }

    func delete(memo: Memo){
        list.removeAll { $0.id==memo.id}
    }

    func delete(set: IndexSet){
        for index in set{
            list.remove(at: index)
        }
    }
}
