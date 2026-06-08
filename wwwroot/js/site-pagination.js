/**
 * BỘ PHÂN TRANG VẠN NĂNG (CORE LOGIC)
 * Dùng chung cho toàn hệ thống PharmaCare
 * 
 * @param {Array} fullData - Mảng dữ liệu đã qua lọc/sắp xếp
 * @param {Number} currentPage - Trang hiện tại (bắt đầu từ 1)
 * @param {Number} rowsPerPage - Số dòng hiển thị trên 1 trang
 * @param {String} tbodyId - ID của thẻ <tbody> cần đổ dữ liệu
 * @param {String} paginationId - ID của thẻ <ul> chứa các nút trang
 * @param {Function} rowRenderer - Hàm xử lý vẽ HTML cho từng dòng <tr>
 * @param {String} onPageChangeFuncName - Tên hàm callback xử lý chuyển trang (dạng String)
 */
function commonPagination(fullData, currentPage, rowsPerPage, tbodyId, paginationId, rowRenderer, onPageChangeFuncName) {

    // 1. KIỂM TRA DỮ LIỆU ĐẦU VÀO
    const total = fullData.length;
    const totalPages = Math.ceil(total / rowsPerPage);

    // Đảm bảo trang hiện tại không vượt quá giới hạn
    if (currentPage > totalPages && totalPages > 0) currentPage = totalPages;
    if (currentPage < 1) currentPage = 1;

    // 2. CẮT DỮ LIỆU (SLICING)
    const start = (currentPage - 1) * rowsPerPage;
    const pageData = fullData.slice(start, start + rowsPerPage);

    // 3. VẼ DỮ LIỆU VÀO BẢNG (TBODY)
    const tbody = document.getElementById(tbodyId);
    if (tbody) {
        if (total === 0) {
            tbody.innerHTML = `<tr><td colspan="20" class="text-center py-5 text-muted">Không tìm thấy dữ liệu phù hợp</td></tr>`;
        } else {
            // Duyệt qua mảng data trang hiện tại và gọi hàm vẽ dòng
            tbody.innerHTML = pageData.map((item, index) => rowRenderer(item, start + index)).join('');
        }
    }

    // 4. VẼ BỘ NÚT PHÂN TRANG (UL PAGINATION)
    const pagContainer = document.getElementById(paginationId);
    if (pagContainer) {
        let html = '';
        if (totalPages > 1) {
            // Nút lùi (Previous)
            html += `<li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
                        <a class="page-link" href="javascript:void(0)" onclick="${onPageChangeFuncName}(${currentPage - 1})">
                            <span class="material-symbols-rounded" style="font-size: 1.2rem; vertical-align: middle;">chevron_left</span>
                        </a>
                    </li>`;

            // Vẽ các số trang
            for (let i = 1; i <= totalPages; i++) {
                // Hiển thị tối đa 5 trang gần nhất nếu dữ liệu quá lớn (tùy chọn nâng cấp sau)
                html += `<li class="page-item ${currentPage === i ? 'active' : ''}">
                            <a class="page-link" href="javascript:void(0)" onclick="${onPageChangeFuncName}(${i})">${i}</a>
                        </li>`;
            }

            // Nút tiến (Next)
            html += `<li class="page-item ${currentPage === totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="javascript:void(0)" onclick="${onPageChangeFuncName}(${currentPage + 1})">
                            <span class="material-symbols-rounded" style="font-size: 1.2rem; vertical-align: middle;">chevron_right</span>
                        </a>
                    </li>`;
        }
        pagContainer.innerHTML = html;
    }

    // 5. CẬP NHẬT CON SỐ THỐNG KÊ (Hiển thị x - y của z)
    const startText = document.getElementById('showingStart');
    const endText = document.getElementById('showingEnd');
    const totalText = document.getElementById('totalRecords');

    if (startText) startText.textContent = total === 0 ? 0 : start + 1;
    if (endText) endText.textContent = Math.min(currentPage * rowsPerPage, total);
    if (totalText) totalText.textContent = total;
}