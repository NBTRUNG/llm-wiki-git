# PDF Tool

## Định vị
- **Codebase**: `/home/admindebian/opt/pdf_tool/`
- **Wiki index**: `/home/admindebian/opt/pdf_tool/wiki/INDEX.md`
- **Status hiện tại**: `/home/admindebian/opt/pdf_tool/docs/PROJECT_STATUS.md`
- **Tasks**: `/home/admindebian/opt/pdf_tool/docs/TASKS.md`
- **Agents - read first**: `/home/admindebian/opt/pdf_tool/AGENTS.md`

## Dự án này là gì
- Mini web app LAN cho văn thư nội bộ: upload PDF scan, OCR tối đa 10 trang đầu, trích xuất trường chính, người dùng review, lưu SQLite, xuất JSON cho browser extension.
- **Mô tả đầy đủ**: `/home/admindebian/opt/pdf_tool/docs/PROJECT_BRIEF.md`

## Stack
- Flask, SQLite, PyMuPDF, OpenCV, Tesseract OCR, HTML template đơn giản.
- **Deploy notes**: `/home/admindebian/opt/pdf_tool/wiki/ops/DEPLOYMENT_NOTES.md`

## Quyết định kiến trúc đã chốt
- **Decision log**: `/home/admindebian/opt/pdf_tool/docs/DECISIONS.md`

## Read first
1. `/home/admindebian/LLM-Wiki/wiki/knowledge/coding/repo-code-rules.md`
2. `/home/admindebian/opt/pdf_tool/AGENTS.md`
3. `/home/admindebian/opt/pdf_tool/wiki/policies/LLM_WORKING_RULES.md`
4. `/home/admindebian/opt/pdf_tool/AI_CODEX.md`
5. `/home/admindebian/opt/pdf_tool/docs/PROJECT_BRIEF.md`
6. `/home/admindebian/opt/pdf_tool/docs/PROJECT_STATUS.md`
7. `/home/admindebian/opt/pdf_tool/docs/TASKS.md`
8. `/home/admindebian/opt/pdf_tool/docs/DECISIONS.md`

## Current goal
- Phase 1 và Phase 2 đã tạm hoàn thành theo scope hiện tại; dự án chuyển sang trạng thái bàn giao/vận hành.
- Rule hien tai: `sovb` va `date` lay tu filename; `date` khong lay tu OCR.
- Recipient parser da tach them `to_external_notinclude` va ho tro flow `Nhu dieu <so>` + `Luu:`.
- Recipient parser ho tro unit khu vuc: `units.abbr` la cum OCR/anchor, `units.full` la ma tra ve; vi du `Chi/Chỉ cục Hải quan khu vực I, II` -> `CCHQKV 1; CCHQKV 2`.
- Tab Quan ly du lieu da chuyen sang autosave `onchange` de giam thao tac.
- Tab Theo doi co nut mo PDF theo `file_path` qua route `/summary/<id>/pdf`.
- UX copy-assisted review da hoan thanh theo scope hien tai: PDF co text layer thi nguoi dung copy/paste; OCR/Trich xuat chi la fallback/goi y theo tung record khi PDF khong copy duoc.
- Tab Theo doi da theo huong evidence-first lookup: danh sach record gon, PDF viewer mac dinh, text read-only, edit hidden sau nut `Sua`.
- PDF iframe o Tab Trich xuat/Theo doi hien full file PDF; OCR/render image van gioi han 10 trang dau bang `OCR_MAX_PAGES = 10`.
- Tab Quan ly du lieu giu cau truc hien tai de on dinh OCR/parser; khong refactor lon neu chua co nhu cau ro.
- Dist folder `dist/pdf_tool_windows` da sync sau thay doi parser/UI/OCR moi nhat de cai lai tren Windows 11.
- Script ngoai UI da co cho van hanh: backup/restore Tab Quan ly du lieu va xoa record `summary` theo `sovb`.

## Next action
- Smoke test `dist/pdf_tool_windows` tren may Windows 11 cua nhan vien van thu.
- Backup `instance/pdf_tool.db` va `uploads/` truoc khi dung that.
- Test luong that: chon PDF -> copy/paste context/Noi nhan -> Phan tach -> Luu -> Theo doi -> JSON/Tampermonkey.
- Chi sua bug nho theo file that; tranh mo feature/refactor lon neu workflow van hanh on.

## Rules
- LLM-Wiki workflow rules: `../global-rules.md`
- Repo code rules: `../wiki/knowledge/coding/repo-code-rules.md`
- Project rules: `/home/admindebian/opt/pdf_tool/wiki/policies/LLM_WORKING_RULES.md`
- Data policy: `/home/admindebian/opt/pdf_tool/wiki/policies/AI_POLICY.md`
- Quick reminder: PDF/OCR output phải qua human review; Tampermonkey chỉ điền form, không tự động submit webform ngoài.

## Liên quan
- JSON contract: `/home/admindebian/opt/pdf_tool/wiki/concepts/JSON_CONTRACT.md`
- Browser extension scope: `/home/admindebian/opt/pdf_tool/wiki/features/BROWSER_EXTENSION.md`
- UI workflow: `/home/admindebian/opt/pdf_tool/wiki/features/UI_WORKFLOW.md`
