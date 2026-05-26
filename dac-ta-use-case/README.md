# Đặc tả Use Case - Digital Travel ERP

Thư mục này tách phần **3.2. Đặc tả Use-case** từ báo cáo `DOAN_IS201.md` thành từng phân hệ để tra cứu và đối chiếu triển khai. Nội dung đặc tả được giữ theo báo cáo nguồn; marker trang phát sinh khi chuyển PDF sang Markdown đã được loại bỏ.

## Danh mục phân hệ

| Tệp | Phạm vi | Phân hệ |
|---|---|---|
| [01-quan-ly-san-pham-tour.md](01-quan-ly-san-pham-tour.md) | UC01-UC20 | Quản lý sản phẩm và tour |
| [02-quan-ly-ho-chieu-so.md](02-quan-ly-ho-chieu-so.md) | UC21-UC24 | Quản lý Hộ chiếu số |
| [03-dat-tour-va-thanh-toan.md](03-dat-tour-va-thanh-toan.md) | UC25-UC33 | Đặt tour và thanh toán |
| [04-quan-ly-dieu-phoi-cskh.md](04-quan-ly-dieu-phoi-cskh.md) | UC34-UC39 | Điều phối và chăm sóc khách hàng |
| [05-quan-ly-van-hanh-mobile.md](05-quan-ly-van-hanh-mobile.md) | UC40-UC44 | Vận hành Mobile / HDV |
| [06-quan-ly-tai-chinh-ke-toan.md](06-quan-ly-tai-chinh-ke-toan.md) | UC45-UC50 | Tài chính - Kế toán |
| [07-bao-cao-voucher-khuyen-mai.md](07-bao-cao-voucher-khuyen-mai.md) | UC51-UC54 | Báo cáo, voucher và khuyến mãi |
| [08-quan-tri-he-thong.md](08-quan-tri-he-thong.md) | UC55-UC68 | Quản trị hệ thống |

## Ghi chú sử dụng
- Các tệp là đặc tả nghiệp vụ từ báo cáo, không phải cam kết mọi bước UI đều đã được backend triển khai đúng nguyên văn.
- Các hình activity diagram và sequence diagram trong báo cáo gốc không có nội dung chữ để trích xuất từ tệp Markdown đầu vào.
- Trạng thái API thực tế và các giới hạn hiện tại được ghi tại [`../../be/README.md`](../../be/README.md).
