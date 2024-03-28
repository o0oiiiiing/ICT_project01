		// 메뉴를 클릭하는 경우 하위 카테고리 드롭다운
		// 변수 선언
		let perfume = document.querySelector('.perfume');
		let handBody = document.querySelector('.hand-body');
		let homeFragrance = document.querySelector('.home-fragrance');

		let perfumeNavListOpen = document
				.querySelector('.perfume-nav-list__open');
		let handBodyNavListOpen = document
				.querySelector('.handBody-nav-list__open');
		let homeFragranceNavListOpen = document
				.querySelector('.homeFragrance-nav-list__open');

		let navItem = document.querySelectorAll('.nav__item');
		let overlay = document.querySelector('.overlay');

		// perfume
		// perfume 클릭했을 때
		perfume.addEventListener('click', function() {
			if (this.classList.contains('clicked')) {
				// 'clicked' 클래스를 제거하여 클릭된 상태를 해제합니다.
				this.classList.remove('clicked');
				perfumeNavListOpen.style.display = "";
				overlay.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
			} else {
				// 'clicked' 클래스가 포함되어 있지 않으면, 메뉴를 표시하고 색상을 변경합니다.
				handBody.classList.remove('clicked');
				homeFragrance.classList.remove('clicked');
				perfumeNavListOpen.style.display = "block";
				handBodyNavListOpen.style.display = "";
				homeFragranceNavListOpen.style.display = "";
				overlay.style.display = "block";
				this.style.borderBottomColor = "#1E1E1E";
				for (var i = 0; i < navItem.length; i++) {
					if (i == 0) {
						navItem.item(i).style.color = "#878787";
					} else {
						navItem.item(i).style.color = "#1E1E1E";
					}
				}
				// 'clicked' 클래스를 추가하여 클릭된 상태를 표시합니다.
				this.classList.add('clicked');
			}
		});

		// overlay 클릭
		overlay.addEventListener('click', function() {
			if (perfume.classList.contains('clicked')) {
				perfumeNavListOpen.style.display = "";
				this.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
				perfume.classList.remove('clicked');
			}
		});

		// handBody 클릭했을 때
		handBody.addEventListener('click', function() {
			if (this.classList.contains('clicked')) {
				// 'clicked' 클래스를 제거하여 클릭된 상태를 해제합니다.
				this.classList.remove('clicked');
				handBodyNavListOpen.style.display = "";
				overlay.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
			} else {
				// 'clicked' 클래스가 포함되어 있지 않으면, 메뉴를 표시하고 색상을 변경합니다.
				perfume.classList.remove('clicked');
				homeFragrance.classList.remove('clicked');
				perfumeNavListOpen.style.display = "";
				homeFragranceNavListOpen.style.display = "";
				handBodyNavListOpen.style.display = "block";
				overlay.style.display = "block";
				for (var i = 0; i < navItem.length; i++) {
					if (i == 1) {
						navItem.item(i).style.color = "#878787";
					} else {
						navItem.item(i).style.color = "#1E1E1E";
					}
				}
				// 'clicked' 클래스를 추가하여 클릭된 상태를 표시합니다.
				this.classList.add('clicked');
			}
		});

		// overlay 클릭
		overlay.addEventListener('click', function() {
			if (handBody.classList.contains('clicked')) {
				handBodyNavListOpen.style.display = "";
				this.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
				handBody.classList.remove('clicked');
			}
		});

		// homeFragrance 클릭했을 때
		homeFragrance.addEventListener('click', function() {
			if (this.classList.contains('clicked')) {
				// 'clicked' 클래스를 제거하여 클릭된 상태를 해제합니다.
				this.classList.remove('clicked');
				homeFragranceNavListOpen.style.display = "";
				overlay.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
			} else {
				// 'clicked' 클래스가 포함되어 있지 않으면, 메뉴를 표시하고 색상을 변경합니다.
				perfume.classList.remove('clicked');
				handBody.classList.remove('clicked');
				perfumeNavListOpen.style.display = "";
				handBodyNavListOpen.style.display = "";
				homeFragranceNavListOpen.style.display = "block";
				overlay.style.display = "block";
				for (var i = 0; i < navItem.length; i++) {
					if (i == 2) {
						navItem.item(i).style.color = "#878787";
					} else {
						navItem.item(i).style.color = "#1E1E1E";
					}
				}
				// 'clicked' 클래스를 추가하여 클릭된 상태를 표시합니다.
				this.classList.add('clicked');
			}
		});

		// overlay 클릭
		overlay.addEventListener('click', function() {
			if (homeFragrance.classList.contains('clicked')) {
				homeFragranceNavListOpen.style.display = "";
				this.style.display = "";
				for (var i = 0; i < navItem.length; i++) {
					navItem.item(i).style.color = "";
				}
				homeFragrance.classList.remove('clicked');
			}
		});

		// 메뉴 클릭한 상태 - mouseenter
		for (var i = 0; i < navItem.length; i++) {
			navItem[i].addEventListener('mouseenter', function() {
				if (homeFragrance.classList.contains('clicked')) {
					this.style.borderBottomColor = "#1E1E1E";
				}
			});
		}

		// 메뉴 클릭한 상태 - mouseleave
		for (var i = 0; i < navItem.length; i++) {
			navItem[i].addEventListener('mouseleave', function() {
				if (homeFragrance.classList.contains('clicked')) {
					this.style.borderBottomColor = "transparent";
				}
			});
		}