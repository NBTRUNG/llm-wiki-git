# Chế độ làm việc thủ công

Dùng trang này khi agent, MCP, gateway hoặc tự động hóa không sẵn sàng, hoặc
khi human chủ động tiếp quản một thao tác quan trọng.

## Trình tự an toàn

1. **Dừng thay đổi mới.** Không tiếp tục ghi nếu chưa biết nguồn chân lý và phạm
   vi ảnh hưởng. Các thao tác ghi thất bại theo hướng đóng; quyền đọc có thể giữ.
2. **Xác định chủ sở hữu.** LLM-Wiki sở hữu tri thức/workflow dùng chung; Agent
   Platform sở hữu raw/WAP/gateway/audit; repo thật sở hữu mã, trạng thái và
   workflow riêng.
3. **Giữ bằng chứng.** Ghi thời điểm, triệu chứng, thao tác gần nhất, kết quả và
   file/log liên quan. Không sửa hoặc xóa bằng chứng gốc.
4. **Chọn workflow.** Dùng [bản đồ workflows](workflows.md); với sự cố dùng
   [Manual Recovery](../workflows/manual-recovery.workflow.md).
5. **Tìm runbook của chủ sở hữu.** Root [RECOVERY.md](../RECOVERY.md) chỉ là
   router. Không đoán lệnh triển khai, database hoặc secret.
6. **Khôi phục nhỏ nhất.** Ưu tiên read-only, safe mode, fallback hoặc
   last-known-good đã được xác minh. Thao tác phá hủy/break-glass cần đúng thẩm
   quyền và người duyệt.
7. **Kiểm chứng.** Chạy smoke check hẹp trước, so với baseline, rồi mới mở rộng.
8. **Bàn giao.** Ghi workflow đã dùng, sai lệch, bằng chứng, rủi ro còn lại và
   bước tiếp theo.

## Khi nào phải dừng và xin phê duyệt

- Không xác định được nguồn chân lý hoặc chủ sở hữu.
- Cần xóa dữ liệu, đổi quyền, xoay secret, rollback database hoặc phát hành.
- Bằng chứng mâu thuẫn, phạm vi ảnh hưởng chưa rõ, hoặc fallback chưa từng thử.
- Bản khôi phục ngoài máy không tồn tại hoặc chưa được xác minh.

## Duy trì kỹ năng con người

Đọc lại khi workflow hoặc kiến trúc thay đổi, và thỉnh thoảng diễn tập bằng một
tình huống giả định: tìm workflow, tìm runbook, mô tả safe mode, xác định bằng
chứng và tiêu chí smoke test. Mục tiêu là có thể tìm đúng đường khi trí nhớ chi
tiết đã phai, không phải học thuộc toàn bộ LLM-Wiki.
