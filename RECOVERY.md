# Manual Recovery Router

Trang này là lối vào độc lập khi agent hoặc tự động hóa không hoạt động. Nó chỉ
định tuyến; runbook chi tiết phải nằm với hệ thống sở hữu sự cố.

## Bắt đầu an toàn

1. Dừng thao tác ghi mới và giữ nguyên bằng chứng.
2. Ghi thời điểm, triệu chứng, thay đổi cuối, phạm vi ảnh hưởng và người đang
   điều phối.
3. Chọn đúng chủ sở hữu trong bảng dưới đây.
4. Dùng read-only/safe mode/fallback trước khi cân nhắc break-glass.
5. Không chạy thao tác phá hủy nếu chưa có phê duyệt và rollback đã biết.

| Phạm vi sự cố | Nguồn chân lý / lối vào | Hướng xử lý |
| --- | --- | --- |
| LLM-Wiki, workflow hoặc knowledge | `index.md`, `TICK.md`, `human/manual-mode.md` | Dùng `workflows/manual-recovery.workflow.md`; đối chiếu canonical và bằng chứng gần nhất |
| Raw, WAP, gateway hoặc audit | `/home/admindebian/Agent-Platform/README.md` | Dùng runbook của Agent Platform; không chuyển raw vào LLM-Wiki |
| Mã nguồn, deploy, CMS, database của dự án | `<repo>/AGENTS.md` và runbook trong repo | Repo thật quyết định trạng thái, rollback và smoke test |
| MCP/service riêng | Entry file và runbook của repo dịch vụ | Cô lập capability; không coi MCP là nguồn chân lý |

## Chế độ suy giảm

- Đường ghi/mutation: fail closed khi quyền, đích ghi hoặc trạng thái chưa rõ.
- Đường đọc: duy trì khả năng đọc knowledge, workflow và bằng chứng nếu an toàn.
- Khôi phục: dùng last-known-good chỉ khi nguồn, thời điểm và checksum/version đã
  được xác minh; sau đó chạy smoke test hẹp.

## Khoảng trống đã biết

- Chưa có vị trí bản sao khôi phục ngoài máy được phê duyệt và kiểm chứng.
- Git-based recovery của workspace này chưa được xác nhận là khả dụng.
- Emergency shutdown/safe-mode ở tầng API/MCP là quyết định runtime tương lai,
  không được giả định đã tồn tại chỉ vì có tài liệu này.

Sau sự cố, ghi lại workflow đã dùng, sai lệch, bằng chứng, thời gian phục hồi,
rủi ro còn lại và đề xuất thay đổi. Thay đổi workflow dùng chung cần human hoặc
supervisor phê duyệt.
