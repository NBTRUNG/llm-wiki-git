# Bản đồ dành cho con người

Thư mục này là bản đồ thu gọn, viết bằng tiếng Việt, để con người có thể tìm
được cách làm việc và tiếp quản khi agent hoặc tự động hóa không sẵn sàng.

Đây **không phải nguồn chân lý thứ hai**. Khi có khác biệt, thứ tự ưu tiên là:

1. tài liệu và mã nguồn của repo thật cho công việc riêng của repo;
2. `workflows/` và `harness/` cho quy trình dùng chung;
3. `wiki/knowledge/` cho tri thức tái sử dụng;
4. thư mục `human/` này chỉ giải thích và dẫn đường.

## Tôi đang cần gì?

| Nhu cầu | Đọc |
| --- | --- |
| Biết agent nên dùng quy trình nào | [workflows.md](workflows.md) |
| Tìm nhóm tri thức và điều cần lưu ý | [knowledge.md](knowledge.md) |
| Agent ngừng hoạt động hoặc phải làm bằng tay | [manual-mode.md](manual-mode.md), rồi [RECOVERY.md](../RECOVERY.md) |
| Xem mô hình sáu lớp tổng thể | [Agent Delivery Workflow](../wiki/knowledge/project-docs/agent_delivery_workflow.md) |
| Hiểu trách nhiệm mặc định giữa con người và agent | [Human-Agent Hybrid Control](../wiki/knowledge/project-docs/human_agent_hybrid_control.md) |
| Vận hành thủ công một project cụ thể | Mở `HUMAN.md` tại root repo, hoặc file tương đương được `README.md` của repo chỉ rõ |

## Cách dùng trong công việc

- Giao mục tiêu bình thường; agent tự chọn workflow, không bắt con người chọn từ
  một menu dài.
- Khi cần kiểm tra, hỏi: “Bạn đã dùng workflow nào?”, “Bạn đã làm khác quy
  trình ở đâu?”, hoặc “Bằng chứng nào chứng minh kết quả?”.
- Không giao toàn bộ phán đoán và trách nhiệm cho agent, nhưng cũng không làm
  thay các bước phân tích/thực thi/kiểm chứng đã được giao rõ và nằm trong năng
  lực của agent. Human giữ mục tiêu, rủi ro, quyền và acceptance; agent giữ
  bounded execution và evidence.
- Nếu phản hồi cho thấy quy trình dùng chung cần đổi, agent phân loại và chuyển
  cho human/supervisor phê duyệt trước khi sửa nguồn canonical.
- Đọc lại bản đồ theo thay đổi lớn và thỉnh thoảng tự diễn tập một tình huống
  không có agent. Chỉ đọc thụ động không đủ để giữ kỹ năng vận hành thủ công.

## Giới hạn

`human/` không chứa khóa bí mật, lệnh phá hủy, bản sao đầy đủ của runbook, hoặc
trạng thái triển khai của repo thật. Các nội dung đó phải ở đúng nơi sở hữu.

Mỗi project mới có một entrypoint vận hành dành cho human theo
[Project Human Workflow](../wiki/knowledge/project-docs/human_workflow.md).
Project repo-backed dùng `HUMAN.md` mặc định; project chưa có repo dùng
`docs/human_workflow.md`.
