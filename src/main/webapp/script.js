const modal = document.getElementById('login-modal');

function openModal() {
	var modal = document.getElementById("login-modal");
	if (modal) {
		modal.classList.add('active');
		document.body.style.overflow = 'hidden';
		console.log("Đã mở Modal thành công!"); // Kiểm tra trong Console
		    } else {
		        alert("Lỗi: Không tìm thấy Modal có ID 'login-modal'. Kiểm tra lại file index.jsp");
		    }
	}

function closeModal() {
	var modal = document.getElementById("login-modal");
	if (modal) {
		modal.classList.remove('active');
		document.body.style.overflow = 'auto';
	}
}

window.onclick = function(event) {
	var modal = document.getElementById("login-modal");
	if (event.target == modal) {
		closeModal();
	}
}