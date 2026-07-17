# Bản đồ workflows cho con người

Bảng này ánh xạ một-một tới các workflow đang hoạt động trong `workflows/`.
Nó giúp nhận diện và giải thích; nội dung canonical nằm ở file được liên kết.

| Workflow | Dùng khi | Áp dụng ở đâu | Quy trình canonical |
| --- | --- | --- | --- |
| Session Start | Bắt đầu hoặc tiếp tục một phiên | Mọi khu vực | [Xem quy trình](../workflows/session-start.workflow.md) |
| Agent Capability Calibration | Xác định mức năng lực, phạm vi ngữ cảnh và quyền tự chủ của agent | Công việc có quản lý năng lực | [Xem quy trình](../workflows/agent-capability-calibration.workflow.md) |
| Real Repo Work | Sửa, review, test hoặc cập nhật trạng thái dự án thật | Repo thật | [Xem quy trình](../workflows/real-repo-work.workflow.md) |
| Bug-Fix Investigation | Điều tra lỗi theo giả thuyết và phép thử hẹp | LLM-Wiki hoặc repo thật | [Xem quy trình](../workflows/bug-fix-investigation.workflow.md) |
| Project Bootstrap | Tạo bộ hồ sơ dự án hoặc đưa repo vào hệ thống | Dự án mới | [Xem quy trình](../workflows/project-bootstrap.workflow.md) |
| Knowledge Refresh | Nghiên cứu, duyệt và cập nhật tri thức tái sử dụng | LLM-Wiki | [Xem quy trình](../workflows/knowledge-refresh.workflow.md) |
| WAP Approval | Một đề xuất ghi cần human/policy phê duyệt | Agent Platform và đích xuất bản | [Xem quy trình](../workflows/wap-approval.workflow.md) |
| Agent Platform Audit | Kiểm tra raw, chỉ mục, gateway hoặc audit log | Agent Platform | [Xem quy trình](../workflows/agent-platform-audit.workflow.md) |
| File Size and ROI | Quyết định giữ, chia, rút gọn hoặc lưu trữ file lớn | Mọi nguồn chân lý | [Xem quy trình](../workflows/file-size-and-roi.workflow.md) |
| Manual Recovery | Agent/tự động hóa không sẵn sàng hoặc cần tiếp quản thủ công | Workspace, platform hoặc repo sở hữu sự cố | [Xem quy trình](../workflows/manual-recovery.workflow.md) |
| Session Closeout | Dừng, tạm nghỉ hoặc lưu trạng thái bàn giao | Mọi khu vực | [Xem quy trình](../workflows/session-closeout.workflow.md) |

Agent không hiển thị toàn bộ bảng này ở đầu mỗi phiên. Agent tự định tuyến và
ghi `Workflow used` khi bàn giao. Khi được hỏi, agent phải giải thích workflow
đã phê duyệt, những sai lệch thực tế và bằng chứng tương ứng.

Nếu số hàng hoặc tên trong [catalog canonical](../workflows/catalog.md) thay
đổi, bảng này phải được kiểm tra trong cùng thay đổi.
