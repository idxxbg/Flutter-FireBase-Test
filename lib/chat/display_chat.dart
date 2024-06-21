part of 'chat_page.dart';

class DisplayChat extends StatefulWidget {
  const DisplayChat({super.key, required this.name});
  final String name;

  @override
  State<DisplayChat> createState() => _DisplayChatState();
}

class _DisplayChatState extends State<DisplayChat> {
  @override
  final Stream<QuerySnapshot> _mesageStream = FirebaseFirestore.instance
      .collection('Message')
      //tin nhắn được sắp xếp theo thứ tự tăng dần về thời gian ở lần hiển thị đầu tiên

      .orderBy('time')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _mesageStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          primary: true,
          itemBuilder: (context, index) {
            // QueryDocumentSnapshot] chứa dữ liệu được đọc từ một tài liệu trong cơ sở dữ liệu [FirebaseFirestore] của bạn như một phần của truy vấn.
            // [QueryDocumentSnapshot] cung cấp bề mặt API giống như [DocumentSnapshot].
            // Vì kết quả truy vấn chỉ chứa các tài liệu hiện có nên thuộc tính tồn tại sẽ luôn đúng và [data()] sẽ không bao giờ trả về giá trị rỗng.
            QueryDocumentSnapshot qds = snapshot.data!.docs[index];
            Timestamp time = qds['time'];
            DateTime dateTime = time.toDate();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                crossAxisAlignment: widget.name == qds['name']
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: ListTile(
                      tileColor: Colors.pink.shade100,
                      shape: const RoundedRectangleBorder(
                        // side: BorderSide(color: Colors.pinkAccent),

                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      title: Text(
                        qds['name'],
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Hero(
                              tag: '${qds['message']}',
                              child: Text(
                                qds['message'],
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ),
                          ),
                          Text(
                            '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}',
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
