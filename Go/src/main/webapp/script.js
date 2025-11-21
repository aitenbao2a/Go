const modal = document.getElementById('login-modal');

function openModal() {
	if (modal) {
		modal.classList.add('active');
		document.body.style.overflow = 'hidden';
	}
}

function closeModal() {
	if (modal) {
		modal.classList.remove('active');
		document.body.style.overflow = 'auto';
	}
}

window.onclick = function(event) {
	if (event.target == modal) {
		closeModal();
	}
}