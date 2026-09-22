# FocusDaily Pro - Kế Hoạch Hằng Ngày & Google Drive Sync

Ứng dụng quản lý công việc trọng tâm hằng ngày, đồng hồ tập trung Pomodoro, theo dõi chuỗi thói quen kỷ luật 66 ngày, và đồng bộ tự động 2 chiều với **Google Drive cá nhân**.

🌐 **GitHub:** [https://github.com/khanhtruong-web/daily-task-app](https://github.com/khanhtruong-web/daily-task-app)  
🚀 **Vercel:** Triển khai tự động liên kết với tài khoản `khanh-truong`

---

## 🌟 Tính Năng Nổi Bật

### 1. Trải Nghiệm Chuẩn Khuôn Hình Điện Thoại (Mobile PWA)
- **Chuẩn Responsive:** Tự động vừa khít mọi dòng điện thoại (iPhone, Samsung Galaxy, Xiaomi...).
- **Thanh Điều Hướng Ngón Cái (Bottom Nav):** 4 Tab chuyển đổi nhanh:
  - 📋 **Kế hoạch:** Nhập việc nhanh, phân loại ưu tiên, tiến độ ngày, checkbox hoàn thành.
  - 📅 **Lịch:** Lịch tháng trực quan, chú giải màu sắc việc xong/việc nợ, xem lại lịch sử từng ngày.
  - ⏱️ **Focus:** Đồng hồ Pomodoro 25 phút, chuỗi thói quen 66 ngày & châm ngôn khoa học não bộ.
  - ☁️ **Drive:** Trạng thái kết nối Google Drive, backup/restore file JSON.
- **Khuôn hình Mobile trên PC:** Tùy chọn nút chuyển đổi bật khung điện thoại giả lập ngay trên màn hình máy tính.
- **PWA (Progressive Web App):** Hỗ trợ "Thêm vào màn hình chính" (Add to Home Screen) trên Safari/Chrome để dùng như app cài đặt không có thanh URL.

### 2. Đăng Nhập Google & Đồng Bộ Google Drive
- Đăng nhập bằng Google Identity Services (GIS).
- Tự động lưu toàn bộ dữ liệu vào file `focusdaily_backup.json` trên Google Drive cá nhân của bạn (bảo mật tuyệt đối 100%, không qua bất kỳ máy chủ bên thứ ba nào).
- Cơ chế **Auto-Sync 2 chiều**:
  - Khi mở app: Tự động tải bản mới nhất từ Drive về máy (Auto-Pull).
  - Khi thêm/sửa việc: Tự động lưu lên Google Drive sau 2 giây (Auto-Push).
  - Hỗ trợ lưu ngoại tuyến offline khi không có mạng.

### 3. Giữ Nguyên Phiên Đăng Nhập (Persistent Login)
- Lưu thông tin tài khoản an toàn trong `localStorage`.
- Tự động kích hoạt **Silent Token Refresh** ngầm khi mở app mỗi ngày mà không bắt người dùng phải nhấn đăng nhập lại hay chọn tài khoản lại.

---

## 🛠️ Hướng Dẫn Cấu Hình Google OAuth Client ID (Chỉ làm 1 lần)

Để đăng nhập Google trên domain cá nhân của bạn:
1. Mở [Google Cloud Console - Credentials](https://console.cloud.google.com/apis/credentials).
2. Tạo một Project mới (hoặc chọn project có sẵn).
3. Vào mục **APIs & Services** > **Enabled APIs & Services** > Bật **Google Drive API**.
4. Vào mục **Credentials** > **Create Credentials** > Chọn **OAuth client ID**:
   - Application type: **Web application**.
   - Mục **Authorized JavaScript origins**, thêm các URL:
     - `http://localhost`
     - `http://localhost:3000`
     - URL domain Vercel của bạn (ví dụ: `https://daily-task-app.vercel.app`).
5. Copy **Client ID** (dạng `xxxx-xxxx.apps.googleusercontent.com`) và dán vào mục **⚙️ Cài đặt Google Client ID** ngay trong app.

---

## 🚀 Đẩy Code Lên GitHub & Vercel

Mỗi khi bạn muốn cập nhật code:
1. Chạy file `deploy.bat` (hoặc mở terminal chạy `git add . && git commit -m "update" && git push origin main`).
2. Vercel sẽ tự động phát hiện commit mới trên nhánh `main` và build cập nhật sau ~30 giây.
