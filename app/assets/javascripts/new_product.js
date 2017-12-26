function preview_images() 
{
	var total_file = document.getElementById("HinhAnh").files.length;
	for(var i = 0; i < total_file; i++)
	{
	  	$('#XemThuHinhAnh').append("<div class='col-lg-3'><img class='img-responsive' src='" + 
	  		URL.createObjectURL(event.target.files[i])+"'></div>");
	}
};

function TaoPhien() {
	var SoLuong = $("#SoLuong").val();

	console.log(SoLuong);

	var panel_heading = "<div class=\"panel panel-info\"><div class=\"panel-heading\">Phiên thứ ";

	var panel_heading_end = "</div>";

	var col = "<div class=\"col-lg-4\">";

	var col_end = "</div>";

	if (SoLuong > 0) {
		$("#NhacNhoSoLuong").text("");

		var PhienDuocTao = "";
		for (var i = 1; i <= SoLuong; i++) {
			var thoi_gian_bat_dau = "<div class=\"form-group\">" + 
				"<label for=\"" + i + "_ThoiGianBatDau\">Thời gian bắt đầu: </label><span id='" + i + "_NhacNhoThoiGian'></span>" +
				"<input type=\"datetime-local\" class=\"form-control\" id=\"" + i + "_ThoiGianBatDau\" required " +
				"name=\"Phien[][ThoiGianBatDau]\" onchange=\"KiemTraThoiGian(this)\">" +
				"</div>";

			var thoi_gian_ket_thuc = "<div class=\"form-group\">" +
				"<label for=\"" + i + "_ThoiGianKetThuc\">Thời gian kết thúc: </label>" +
				"<input type=\"datetime-local\" class=\"form-control\" id=\"" + i + "_ThoiGianKetThuc\" required " +
				"name=\"Phien[][ThoiGianKetThuc]\" onchange=\"KiemTraThoiGian(this)\">" +
				"</div>";

			var gia_khoi_diem = "<div class=\"form-group\">" + 
				"<label for=\"" + i + "_GiaKhoiDiem\">Giá khởi điểm:</label>" + 
				"<input type=\"number\" class=\"form-control\" id=\"" + i + "_GiaKhoiDiem\" required " +
				"name=\"Phien[][GiaKhoiDiem]\">" +
				"</div>";

			var gia_tran = "<div class=\"form-group\">" + 
				"<label for=\"" + i + "_GiaTran\">Giá trần:</label>" + 
				"<input type=\"number\" class=\"form-control\" id=\"" + i + "_GiaTran\" required " +
				"name=\"Phien[][GiaTran]\">" + 
				"</div>";

			var buoc_gia = "<div class=\"form-group\">" + 
				"<label for=\"" + i + "_BuocGia\">Bước giá:</label>" + 
				"<input type=\"number\" class=\"form-control\" id=\"" + i + "_BuocGia\" required " +
				"name=\"Phien[][BuocGia]\">" + 
				"</div>";

			
			var col1 = col + thoi_gian_bat_dau + thoi_gian_ket_thuc + col_end;

			var col2 = col + gia_khoi_diem + gia_tran  + col_end;

			var col3 = col + buoc_gia + col_end;

			var panel_content = "<div class=\"row\" id=\"" + i + "_Phien\">" + col1 + col2 + col3 + "</div>";

			var panel_body = "<div class=\"panel-body\">" + panel_content + "</div></div>";

			PhienDuocTao += panel_heading + i + panel_heading_end + panel_body;

			console.log(PhienDuocTao);
		}

		PhienDuocTao += "<button type=\"submit\" class=\"btn btn-primary\"" +
			" id=\"NutDang\">Đăng</button>"

		$('#TaoPhien').html(PhienDuocTao);
	} else {
		$("#NhacNhoSoLuong").text("Bạn phải nhập số lượng sản phẩm").css("color", "red");
	}
};

function LayLoaiSanPham() {
	var danhmuc = $("#DanhMuc").find(":selected").val();

	console.log(danhmuc);
	
	$.post("/category/get_product_type", { category_id: danhmuc }, function(result) {
		console.log(result);

		var addedOptions = "";
		for (var i = 0; i < result.length; i++) {	
			addedOptions += "<option value='" + result[i].id + "'>" +
				result[i].product_type_name + "</option>";
		}

		$("#LoaiSanPham").html(addedOptions);
	})
};

$("#LoaiSanPham").ready(function () {
	LayLoaiSanPham();
});

function KiemTraThoiGian(InputThoiGian) {
	$("#NutDang").attr("disabled", false);

	var InputId = InputThoiGian.id;
	var InputId = InputId.substring(0, InputId.indexOf('_'));
	var SoLuong = $("#SoLuong").val();
	var TGBD = $("#" + InputId + "_ThoiGianBatDau").val();
	var TGKT = $("#" + InputId + "_ThoiGianKetThuc").val();
	var InputThoiGianBatDau = new Date(TGBD);
	var InputThoiGianKetThuc = new Date(TGKT);
	var ThoiGianHienTai = new Date();


	console.log("Thời gian hiện tại: " + ThoiGianHienTai);


	$("#" + InputId + "_NhacNhoThoiGian").text("");

	console.log("InputId: " + InputId);
	console.log("InputThoiGianBatDau: " + InputThoiGianBatDau);
	console.log("InputThoiGianKetThuc: " + InputThoiGianKetThuc);

	if (TGBD != "" && TGKT != "") {
		// if (InputThoiGianBatDau <= (ThoiGianHienTai + 3) || InputThoiGianKetThuc <= ThoiGianHienTai) {
		if (InputThoiGianBatDau <= ThoiGianHienTai || InputThoiGianKetThuc <= ThoiGianHienTai) {
			$("#" + InputId + "_NhacNhoThoiGian")
				.text("Thời gian kết thúc và thời gian bắt đầu đều phải lớn hơn thời điểm hiện tại và thời gian bắt đầu phải sao thời điểm hiện tại 3 ngày")
				.css("color", "red");

			$("#NutDang").attr("disabled", true);
		}


		if (InputThoiGianKetThuc <= InputThoiGianBatDau) {
			console.log("Thời gian kết thúc nhỏ hơn thời gian bắt đầu");

			$("#" + InputId + "_NhacNhoThoiGian")
				.text("Thời gian kết thúc phải lớn hơn thời gian bắt đầu")
				.css("color", "red");

			$("#NutDang").attr("disabled", true);
		}
			
		for (var i = 1; i <= SoLuong; i++) {
			if (i != InputId) {
				var ThoiGianBatDau = new Date($("#" + i + "_ThoiGianBatDau").val());
				var ThoiGianKetThuc = new Date($("#" + i + "_ThoiGianKetThuc").val());

				if (ThoiGianBatDau != "" && ThoiGianKetThuc != "") {
					if (i < InputId) {
						if (InputThoiGianBatDau <= ThoiGianKetThuc || InputThoiGianKetThuc <= ThoiGianKetThuc) {
							$("#" + InputId + "_NhacNhoThoiGian")
									.text("Thời gian kết thúc và thời gian bắt đầu của phiên thứ " + 
										InputId + " phải lớn hơn thời gian bắt đầu của phiên thứ " + i)
									.css("color", "red");

							$("#NutDang").attr("disabled", true);
						}
					} else {
						if (InputThoiGianBatDau >= ThoiGianBatDau || InputThoiGianKetThuc >= ThoiGianBatDau) {
							$("#" + InputId + "_NhacNhoThoiGian")
									.text("Thời gian kết thúc và thời gian bắt đầu của phiên thứ " + 
										InputId + " phải nhỏ hơn thời gian bắt đầu của phiên thứ " + i)
									.css("color", "red");

							$("#NutDang").attr("disabled", true);
						}
					}
				}	
			}
		}
	}
} ;
