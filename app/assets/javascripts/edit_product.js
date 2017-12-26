function preview_images() 
{
	var total_file = document.getElementById("images").files.length;
	for(var i = 0; i < total_file; i++)
	{
	  	$('#image_preview').append("<div class='col-lg-3'><img class='img-responsive' src='"+URL.createObjectURL(event.target.files[i])+"'></div>");
	}
};

function tao_phien_chinh_sua() {
	var so_luong = $("#so_luong").val();

	var panel_heading = "<div class=\"panel panel-info\"><div class=\"panel-heading\">Phiên thứ ";
	var panel_heading_end = "</div>";
	var thoi_gian_bat_dau = "<div class=\"form-group\"><label for=\"thoi_gian_bat_dau\">Thời gian bắt đầu:</label><input type=\"date\" class=\"form-control\" id=\"thoi_gian_bat_dau\"></div>";
	var thoi_gian_ket_thuc = "<div class=\"form-group\"><label for=\"thoi_gian_ket_thuc\">Thời gian kết thúc:</label><input type=\"date\" class=\"form-control\" id=\"thoi_gian_ket_thuc\"></div>";
	var gia_khoi_diem = "<div class=\"form-group\"><label for=\"gia_khoi_diem\">Giá khởi điểm:</label><input type=\"number\" class=\"form-control\" id=\"gia_khoi_diem\"></div>";
	var gia_tran = "<div class=\"form-group\"><label for=\"gia_tran\">Giá trần:</label><input type=\"number\" class=\"form-control\" id=\"gia_tran\"></div>";
	var buoc_gia = "<div class=\"form-group\"><label for=\"buoc_gia\">Bước giá:</label><input type=\"number\" class=\"form-control\" id=\"buoc_gia\"></div>";
	var col = "<div class=\"col-lg-4\">";
	var col_end = "</div>";
	var col1 = col + thoi_gian_bat_dau + thoi_gian_ket_thuc + col_end;
	var col2 = col + gia_khoi_diem + gia_tran  + col_end;
	var col3 = col + buoc_gia + col_end;
	var panel_content = "<div class=\"row\">" + col1 + col2 + col3 + "</div>";
	var panel_body = "<div class=\"panel-body\">" + panel_content + "</div></div>";

	for (var i = 1; i <= so_luong; i++) {
		$('#tao_phien_chinh_sua').append(panel_heading + i + panel_heading_end + panel_body);
	}
};