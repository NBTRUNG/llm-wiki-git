# Bản đồ tri thức cho con người

Đây là lối vào ngắn, không phải bản sao nội dung trong `wiki/knowledge/`.

| Khi cần | Nhóm tri thức | Câu hỏi tự kiểm tra |
| --- | --- | --- |
| Thiết kế hệ thống, ranh giới module/API | [Architecture](../wiki/knowledge/architecture-patterns/README.md) | Nguồn chân lý, ranh giới và failure mode là gì? |
| Viết, review hoặc kiểm thử mã | [Coding](../wiki/knowledge/coding/README.md) | Đầu ra đúng bằng chứng nào; có tác dụng phụ gì? |
| UI, frontend và khả năng truy cập | [Frontend](../wiki/knowledge/frontend/README.md), [UI](../wiki/knowledge/ui/README.md) | Trạng thái, responsive, accessibility và hồi quy đã kiểm tra chưa? |
| Dữ liệu, schema hoặc migration | [Data](../wiki/knowledge/data/README.md) | Backup, rollback, tính toàn vẹn và quyền truy cập ra sao? |
| Bảo mật và riêng tư | [Security](../wiki/knowledge/security-privacy/README.md) | Trust boundary, bí mật và quyền tối thiểu đã rõ chưa? |
| Sự cố, độ tin cậy và vận hành | [Reliability/SRE](../wiki/knowledge/reliability-sre/README.md), [Operations](../wiki/knowledge/operations/README.md) | Safe mode, fallback, phục hồi và bằng chứng sau sự cố là gì? |
| Agent, RAG hoặc MCP | [AI/Agent/RAG/MCP](../wiki/knowledge/ai-agent-rag-mcp/README.md), [MCP Server](../wiki/knowledge/mcp-server/README.md) | Outcome, policy gate, tool trace và chi phí được đo thế nào? |
| Phân tích, so sánh hiệu quả | [Math](../wiki/knowledge/math/README.md) | Baseline, giả định, metric, độ nhạy và điều kiện đổi quyết định là gì? |
| Đánh giá TAO và ILIAS cho đào tạo | [Education platform concepts](../wiki/concepts/education-platforms/README.md) | Đang test đúng edition/version không; đâu là LMS, exam engine và nguồn dữ liệu chính? |
| Quy trình và quản trị dự án | [Project docs](../wiki/knowledge/project-docs/README.md) | Ai sở hữu quyết định, trạng thái và bằng chứng? |
| Phối hợp mặc định giữa human và agent | [Human-Agent Hybrid Control](../wiki/knowledge/project-docs/human_agent_hybrid_control.md) | Human có đang ỷ lại/rubber-stamp không; agent có đang đẩy ngược công việc đủ điều kiện về human không? |
| Thay đổi nhỏ, rõ và ít rủi ro | [Bounded Change Fast Path](../wiki/knowledge/project-docs/bounded_change_fast_path.md) | Có trigger nào buộc chuyển sang quy trình đầy đủ không? |

Khi chưa biết đọc nhóm nào, mô tả mục tiêu cho agent và yêu cầu agent nêu gói
tri thức đã chọn cùng lý do. Khi phải làm tay, bắt đầu từ hàng gần nhất rồi chỉ
đọc sâu những file được router của nhóm đó chỉ tới.
