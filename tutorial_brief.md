## Triết lý cốt lõi của một kiến trúc sư hệ thống
Trước khi đi vào cấu trúc, cần hiểu một nguyên tắc nền tảng:

Tài liệu hệ thống không phải là giải thích code. Đó là bản hợp đồng giữa các bên liên quan.

Các "bên" ở đây gồm: người dùng cuối, người quản lý, developer, AI (nếu bạn làm việc với AI), và chính bạn trong tương lai sau 6 tháng không nhìn lại dự án.

## Cấu trúc 5 lớp của một bản mô tả hệ thống chuẩn
Đây là khung mà các kiến trúc sư tại Google, Amazon, hay các tổ chức lớn thường dùng, thường gọi là Architecture Decision Record (ADR) kết hợp với System Design Document (SDD).

### Lớp 1 — Bối cảnh (Context Layer)
Trả lời câu hỏi: Tại sao hệ thống này tồn tại?
Đây là lớp quan trọng nhất nhưng hay bị bỏ qua nhất. Nó gồm ba phần:
1. Vấn đề cần giải quyết — mô tả bằng ngôn ngữ nghiệp vụ, không dùng thuật ngữ kỹ thuật. Ví dụ từ dự án của bạn: "Nhân viên phải nhập tay hàng chục trường thông tin giống nhau mỗi lần tạo hồ sơ đào tạo, gây tốn thời gian và sinh lỗi sao chép."
2. Các bên liên quan và nhu cầu của họ — ai dùng hệ thống này, họ quan tâm đến điều gì. Người nhập liệu quan tâm đến tốc độ và ít bước nhấp chuột. Quản lý quan tâm đến độ chính xác và khả năng kiểm tra lại. Developer quan tâm đến khả năng mở rộng.
3. Ranh giới hệ thống (System Boundary) — hệ thống làm gì và không làm gì. Điều này nghe đơn giản nhưng thực ra rất kỷ luật. Ví dụ: "Hệ thống này TẠO hồ sơ, không QUẢN LÝ hồ sơ sau khi tạo." Câu phủ định đó giúp tránh scope creep và giúp AI hiểu đúng phạm vi.

### Lớp 2 — Kiến trúc logic (Logical Architecture)
Trả lời câu hỏi: Hệ thống gồm những thành phần gì và chúng nói chuyện với nhau như thế nào?
Ở lớp này bạn mô tả hệ thống như một sơ đồ hộp và mũi tên — không phải code, không phải database schema, chỉ là các khối chức năng và luồng dữ liệu giữa chúng.
Mỗi thành phần cần có:

Tên và trách nhiệm duy nhất (single responsibility)
Đầu vào nó nhận từ đâu
Đầu ra nó giao cho ai
Quy tắc xử lý bên trong (business rules)

Ví dụ thực tế từ dự án của bạn, thay vì viết "Code.gs xử lý form submit", kiến trúc sư sẽ viết:

Thành phần Xử lý Biểu mẫu nhận dữ liệu từ giao diện người dùng, kiểm tra tính hợp lệ theo quy tắc nghiệp vụ, sau đó chuyển giao cho thành phần Sinh Văn bản. Nếu dữ liệu không hợp lệ, trả về thông báo lỗi có ngữ nghĩa cho người dùng.

Không cần biết đó là JavaScript hay Python — mô tả này vẫn đúng với bất kỳ công nghệ nào.

### Lớp 3 — Mô hình dữ liệu (Data Model Layer)
Trả lời câu hỏi: Hệ thống nhớ gì và nhớ như thế nào?
Đây là lớp bạn đã nhận ra thiếu sót trong file báo cáo của mình (mục 2.3). Nhưng quan trọng hơn là hiểu tại sao nó quan trọng: dữ liệu sống lâu hơn code. Code có thể viết lại, nhưng dữ liệu đã lưu thì không thể thay đổi hình dạng dễ dàng.
Một mô hình dữ liệu tốt mô tả:

### Thực thể (Entity): những "vật" mà hệ thống quan tâm — Hồ sơ, Lớp học, Nhân viên
Thuộc tính của mỗi thực thể: tên, kiểu, ràng buộc, ví dụ — đúng như bảng 5 cột bạn đã có trong báo cáo
Quan hệ giữa các thực thể: một Hồ sơ thuộc về một Lớp học; một Lớp học có nhiều Hồ sơ
Vòng đời (Lifecycle): dữ liệu được tạo khi nào, thay đổi khi nào, xóa khi nào


### Lớp 4 — Luồng hành vi (Behavioral Flow Layer)
Trả lời câu hỏi: Hệ thống làm gì theo từng bước khi người dùng hành động?
Đây là lớp bạn thường nghĩ đến nhất, nhưng cần viết theo đúng cấu trúc happy path → alternative path → error path.
Kiến trúc sư dùng định dạng Given / When / Then (bạn đã nhắc đến trong file) vì nó buộc người viết phải nghĩ đến điều kiện tiên quyết, không chỉ là hành động. Ví dụ:

Given: Người dùng đã hoàn thành GD1 và Sheet nội bộ đã tồn tại
When: Người dùng mở form GD2 và nhấn Tạo hồ sơ
Then: Hệ thống đọc biến từ Sheet nội bộ, điền vào file mẫu, lưu vào thư mục tương ứng, và hiển thị link kết quả

Điều quan trọng là mỗi luồng phải có tên và đứng độc lập — không phụ thuộc vào việc đọc cả tài liệu mới hiểu.

### Lớp 5 — Quyết định kiến trúc (Decision Layer)
Trả lời câu hỏi: Tại sao chọn cách này mà không chọn cách khác?
Đây là lớp phân biệt kiến trúc sư với developer. Mọi hệ thống đều có những ngã rẽ — lựa chọn A hay B. Nếu bạn không ghi lại lý do, sau 6 tháng không ai (kể cả bạn) biết tại sao hệ thống lại có hình dạng như vậy.
Mỗi quyết định cần ghi: Bối cảnh → Các lựa chọn đã xem xét → Lựa chọn được chọn → Lý do → Hệ quả (điều gì sẽ khó hơn vì lựa chọn này).
Ví dụ từ dự án của bạn: "Chúng tôi chọn lưu biến vào Sheet nội bộ thay vì quét Sheet tổng ở GD2 vì quét toàn bộ Sheet tổng sẽ chậm và dễ lỗi khi có nhiều dòng. Hệ quả: GD2 phụ thuộc vào GD1 đã chạy thành công."

### Nguyên tắc viết, không phải cấu trúc
Ngoài 5 lớp trên, có những nguyên tắc viết mà các kiến trúc sư giỏi đều tuân thủ:
Một mô tả tốt không cần đọc code để hiểu. Nếu ai đó đọc tài liệu của bạn và vẫn cần xem code để hiểu hệ thống làm gì — tài liệu đó chưa đủ tốt.
Tài liệu tốt nhất là tài liệu ngắn nhất đủ trả lời câu hỏi cần thiết. Đừng mô tả những gì hiển nhiên. Hãy mô tả những gì không hiển nhiên — các quy tắc nghiệp vụ đặc thù, các ngoại lệ, các ràng buộc bất ngờ.
Phân tầng độc giả. Một bản mô tả tốt có thể được đọc ở nhiều mức độ: quản lý đọc Lớp 1 là đủ hiểu. Developer đọc thêm Lớp 2-4. Kiến trúc sư đọc cả Lớp 5.

## Lộ Trình Tư Duy Kiến Trúc Hệ Thống
### Triết lý nền tảng
Kỹ năng này không phải kỹ năng kỹ thuật. Đây là kỹ năng tư duy và diễn đạt — giống như một bác sĩ cần mô tả triệu chứng chính xác trước khi kê đơn, một kiến trúc sư cần mô tả hệ thống chính xác trước khi viết một dòng code nào. Người mô tả tốt làm việc ít hơn, sai ít hơn, và nói chuyện với AI hiệu quả hơn gấp nhiều lần.

### 6 Mental Models — Khuôn tư duy cốt lõi
Đây là 6 cách nhìn bạn cần nạp vào đầu trước tất cả mọi thứ. Chúng không phải kỹ thuật — chúng là cách một người tư duy về hệ thống.
Một — WHAT vs HOW. Luôn tách biệt "nghiệp vụ cần gì" khỏi "kỹ thuật làm thế nào". WHAT là bất biến — dù dùng công nghệ nào, mục tiêu nghiệp vụ vẫn vậy. HOW có thể thay đổi theo từng thời điểm. Khi viết mô tả, hãy viết WHAT trước, HOW sau, và không trộn lẫn hai thứ vào cùng một đoạn.
Hai — Happy Path và Error Path. Luồng thành công chỉ là 20% công việc. 80% còn lại là xử lý những trường hợp không theo kế hoạch. Hệ thống tốt không phải hệ thống chạy tốt khi mọi thứ thuận lợi — mà là hệ thống xử lý ổn khi có sự cố.
Ba — Data Outlives Code. Dữ liệu sống lâu hơn code. Code có thể viết lại hoàn toàn trong một tuần, nhưng dữ liệu đã lưu thì không thể thay đổi hình dạng dễ dàng. Vì vậy thiết kế cấu trúc dữ liệu trước, sau đó mới nghĩ đến code.
Bốn — Single Responsibility. Mỗi thành phần trong hệ thống chỉ nên làm một việc và làm tốt việc đó. Khi một thứ làm quá nhiều việc, nó làm hỏng tất cả và rất khó sửa sau này.
Năm — Boundary First. Xác định rõ hệ thống làm gì và không làm gì trước khi thiết kế bên trong. Câu phủ định đôi khi quan trọng hơn câu khẳng định — nó giúp tránh hệ thống phình to ngoài kiểm soát.
Sáu — Layered Audience. Tài liệu tốt phục vụ nhiều loại độc giả: người quản lý đọc một đoạn phải hiểu được mục tiêu, developer đọc một trang phải hiểu được kiến trúc, AI đọc toàn bộ phải implement được chính xác, và chính bạn sau sáu tháng không nhìn lại phải hiểu lại ngay.

### Giai đoạn 1 — Ngôn Ngữ Mô Tả Cơ Bản (3 đến 4 tuần)
Mục tiêu của giai đoạn này rất đơn giản: bạn có thể mô tả bất kỳ hệ thống nào theo 5 câu hỏi chuẩn mà không cần suy nghĩ lâu.
Kỹ năng đầu tiên là 5 câu hỏi kiến trúc. Với mọi hệ thống, trước khi làm bất cứ gì, hãy trả lời: WHO — ai dùng hệ thống này và họ cần gì? WHAT — hệ thống cần làm gì, kết quả trông như thế nào? WHERE — dữ liệu đến từ đâu và cuối cùng đi về đâu? WHEN — hệ thống hoạt động theo điều kiện gì, khi nào chạy, khi nào dừng? WHY — vấn đề thực sự là gì, tại sao hệ thống này cần tồn tại? Bài tập: chọn một ứng dụng bạn dùng hàng ngày như email hoặc lịch, viết 5 câu trả lời trong 15 phút.
Kỹ năng thứ hai là viết Glossary. Mọi hệ thống có ngôn ngữ riêng. Glossary là bản hợp đồng từ ngữ — khi bạn nói "hồ sơ", mọi người hiểu đúng một thứ. Không có Glossary, mỗi người hiểu một kiểu khác nhau và sai lầm xảy ra ở đó. Bài tập: viết Glossary 5 đến 10 thuật ngữ cho dự án Apps Script của bạn, theo định dạng ba cột là thuật ngữ, giải thích đầy đủ, và ví dụ cụ thể.
Kỹ năng thứ ba là phân tầng độc giả. Luyện tập viết cùng một nội dung ở ba mức độ khác nhau: một đoạn ngắn cho người quản lý chỉ cần hiểu mục tiêu, một trang cho developer cần hiểu cách hoạt động, và một file đầy đủ cho AI cần implement. Bài tập: viết mô tả hệ thống GAS của bạn theo đúng ba mức đó.
Lưu ý quan trọng của giai đoạn này: đừng vội học Mermaid hay bất kỳ công cụ vẽ sơ đồ nào. Tư duy rõ trước, hình thức sau. Diagram chỉ là cách nén thông tin đã rõ ràng — nếu chưa rõ ràng trong đầu, vẽ sơ đồ cũng không giúp được gì.

### Giai đoạn 2 — Mô Hình Hóa Có Cấu Trúc (4 đến 6 tuần)
Mục tiêu: chuyển tư duy từ dạng chữ tự do sang dạng có cấu trúc mà người khác và AI có thể đọc và kiểm chứng được.
Mô hình dữ liệu. Trước khi nghĩ đến database hay spreadsheet, hỏi: hệ thống quan tâm đến những "vật" nào — Người dùng, Đơn hàng, Hồ sơ, Lớp học? Chúng liên quan đến nhau như thế nào? Quan hệ là một-một, một-nhiều, hay nhiều-nhiều? Vẽ trên giấy dạng hộp và mũi tên là đủ ở giai đoạn này. Bài tập: vẽ sơ đồ quan hệ cho hệ thống Apps Script — Lớp học, Hồ sơ, Nhân viên, Văn bản mẫu — liên kết với nhau thế nào.
Bảng mô tả trường dữ liệu đầy đủ. Mỗi trường dữ liệu cần đủ năm thuộc tính: tên trường, kiểu dữ liệu, có bắt buộc không, ràng buộc và điều kiện hợp lệ, và ví dụ cụ thể. Thiếu một trong năm — AI sẽ phải đoán, và đoán sai là chuyện thường xuyên xảy ra.
Given / When / Then. Đây là chuẩn quốc tế để mô tả hành vi hệ thống. Given là điều kiện tiên quyết phải đúng trước khi hành động xảy ra. When là hành động cụ thể người dùng thực hiện. Then là kết quả mong đợi của hệ thống. Mỗi tính năng cần tối thiểu ba kịch bản: khi mọi thứ đúng, khi dữ liệu sai, và khi hệ thống gặp lỗi. Bài tập: viết ba kịch bản GWT cho tính năng tạo hồ sơ GD2 của bạn.

### Giai đoạn 3 — Tư Duy Kiến Trúc Sâu (6 đến 8 tuần)
Mục tiêu: không chỉ mô tả hệ thống là gì, mà còn giải thích tại sao nó có hình dạng đó — và liệu hình dạng đó có ổn không.
Ghi lại quyết định thiết kế. Mỗi quyết định quan trọng cần có đủ năm phần: bối cảnh lúc đó là gì, những lựa chọn nào đã được xem xét, lựa chọn nào được chọn, lý do tại sao, và hệ quả nào phải chấp nhận. Đây là ký ức của hệ thống — không ghi lại, sau sáu tháng không ai biết tại sao hệ thống lại có hình dạng như vậy và dễ mắc lại sai lầm cũ. Bài tập: viết đủ năm phần cho quyết định lưu biến vào Sheet nội bộ thay vì quét Sheet tổng ở GD2.
Trade-off thinking. Không có giải pháp hoàn hảo — chỉ có giải pháp phù hợp với ràng buộc hiện tại. Với mọi quyết định, luôn hỏi thêm câu này: cái gì sẽ trở nên khó hơn vì lựa chọn này? Câu trả lời đó là hệ quả bạn đang chấp nhận, và bạn cần biết mình đang chấp nhận nó một cách có ý thức.
Điểm hỏng duy nhất. Hỏi: nếu thành phần X ngừng hoạt động, hệ thống sẽ ra sao? Điểm nào trong hệ thống mà khi hỏng sẽ kéo theo tất cả? Đó là điểm cần có kế hoạch dự phòng. Bài tập: nếu Sheet nội bộ trong hệ thống của bạn bị xóa hoặc đổi tên, điều gì xảy ra? Mô tả hành vi hiện tại và đề xuất cách cải thiện.
Điểm mở rộng. Khi thiết kế, luôn hỏi: tính năng nào có khả năng thay đổi trong tương lai? Thiết kế để những điểm đó dễ thay đổi mà không cần sửa toàn bộ hệ thống. Đây là sự khác biệt giữa hệ thống sống được lâu và hệ thống phải viết lại từ đầu sau một năm.

### Giai đoạn 4 — Làm Việc Như Kiến Trúc Sư (Liên tục)
Đây không phải giai đoạn có điểm kết thúc — đây là thói quen bạn xây dựng và duy trì.
Design Brief trước mỗi tính năng. Trước khi bắt đầu bất kỳ tính năng mới nào, dành 20 đến 30 phút viết một trang tóm tắt gồm: mục tiêu, người dùng liên quan, dữ liệu vào và ra, luồng chính, các lỗi cần xử lý, và điều kiện để xác nhận tính năng đã hoàn thành. Dán trang này vào đầu cuộc chat với AI — chất lượng output tăng đột biến so với khi bắt đầu bằng câu hỏi mơ hồ.
Vòng lặp mô tả và kiểm chứng. Viết mô tả, rồi hỏi AI "Có điểm nào tôi chưa mô tả đủ không?" Bổ sung, rồi lặp lại. Không cần mô tả hoàn hảo ngay lần đầu — kỹ năng đến từ vòng lặp này.
Post-mortem sau mỗi dự án. Sau khi hoàn thành, dành 30 phút viết ba câu hỏi: điều gì trong thiết kế làm tốt, điều gì phải sửa nhiều hơn dự kiến, và nếu làm lại thì sẽ mô tả khác đi như thế nào. Đây là cách cải thiện nhanh nhất mà không cần khóa học nào.

### Thước đo để tự biết mình đang tiến bộ
Milestone 1 — bạn có thể giải thích hệ thống bạn xây dựng cho người không biết kỹ thuật trong 5 phút và họ hiểu được mục đích và luồng chính.
Milestone 2 — bạn viết một trang mô tả tính năng mới và AI implement được chính xác ngay lần đầu, không cần hỏi lại nhiều.
Milestone 3 — khi đọc mô tả của người khác hoặc của chính bạn từ tháng trước, bạn nhìn ra ngay điểm còn thiếu.
Milestone 4 — mọi quyết định thiết kế bạn đưa ra đều đi kèm lý do rõ ràng và trade-off bạn ý thức được.
Milestone 5 — khi thiết kế, bạn tự nhiên hỏi "điều gì sẽ thay đổi trong 6 tháng tới?" và thiết kế để thích nghi với thay đổi đó.