# Human Workflow

Last verified: `{{YYYY-MM-DD}}`
Environment: `{{environment}}`

## Mục đích và giới hạn

- Mục đích:
- Phạm vi dữ liệu:
- Không dùng cho:

## Bắt đầu nhanh

Thư mục làm việc:

```bash
cd {{repo_path}}
```

Khởi động, xem trạng thái và smoke check:

```bash
{{start_command}}
{{status_command}}
{{smoke_command}}
```

## Truy cập và đăng nhập ban đầu

- URL/port:
- Bước hostname hoặc chứng chỉ:
- Username bootstrap:
- Cách lấy password an toàn:
- Việc phải làm ngay sau đăng nhập:

Không ghi password, token, private key hoặc dữ liệu thật vào file này.

## Dừng và chạy lại an toàn

```bash
{{stop_command}}
{{start_command}}
```

## Dữ liệu bền vững

| Path hoặc volume | Ý nghĩa | Backup/restore pointer |
| --- | --- | --- |
| `unknown` | `unknown` | `unknown` |

Không sửa trực tiếp dữ liệu bên trong volume.

## Quy trình thủ công tiếp theo

- Test/runbook:
- Nơi ghi evidence:
- Current status:

## Ranh giới an toàn và phục hồi

- Lệnh/hành động phá hủy cần phê duyệt:
- Checkpoint cần có trước thay đổi:
- Recovery/escalation:
- Trạng thái diễn tập restore: `unknown`

