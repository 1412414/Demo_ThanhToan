function LamTronRaGia() {
	console.log("Bắt đầu làm tròn");

	var BuocGia = parseInt($("#BuocGia").attr("bid_increment"))
	var Gia = parseInt($("#InputRaGia").val())
	var GiaHienTai = parseInt($("#InputRaGia").attr("giaHT"))
	var GiaLamTron = GiaHienTai
	var NuaBuocGia = BuocGia / 2

	if (Gia < GiaHienTai) {
		Gia = GiaHienTai + BuocGia
	}

	while(GiaLamTron < Gia) {
		GiaLamTron += BuocGia
	}

	console.log("Giá làm tròn: " + GiaLamTron)
	console.log("Giá: " + Gia)

	if (Gia < GiaLamTron) {
		if (Gia < (GiaLamTron - NuaBuocGia)) {
			Gia = GiaLamTron - BuocGia
		} else {
			Gia = GiaLamTron
		}
	}

	console.log("Giá cuối cùng: " + Gia)

	$("#InputRaGia").val(Gia)
}

function LamTronGiaCaoNhat() {
	console.log("Bắt đầu làm tròn");

	var BuocGia = parseInt($("#BuocGia").attr("bid_increment"))
	var Gia = parseInt($("#InputGiaCaoNhat").val())
	var GiaHienTai = parseInt($("#InputRaGia").attr("giaHT"))
	var GiaLamTron = GiaHienTai
	var NuaBuocGia = BuocGia / 2

	if (Gia < GiaHienTai) {
		Gia = GiaHienTai + BuocGia
	}

	while(GiaLamTron < Gia) {
		GiaLamTron += BuocGia
	}

	console.log("Giá làm tròn: " + GiaLamTron)
	console.log("Giá: " + Gia)

	if (Gia < GiaLamTron) {
		if (Gia < (GiaLamTron - NuaBuocGia)) {
			Gia = GiaLamTron - BuocGia
		} else {
			Gia = GiaLamTron
		}
	}

	console.log("Giá cuối cùng: " + Gia)

	$("#InputGiaCaoNhat").val(Gia)
}

$(function() {
	$("#NutRaGia").click(function() {
		data = {
			IdAuction: $("#InputRaGia").attr("idAuction"),
			GiaCaoNhat: $("#InputGiaCaoNhat").val(),
			BuocGia: $("#BuocGia").attr("bid_increment"),
			Gia: $("#InputRaGia").val() 
		}

		console.log(data);

		$("#NutDongModalRaGiaCaoNhat").click();

		$.post("/auction/bid", data, function(result) {
			console.log(result);
		});
	});

	$("#NutMuaNgay").click(function() {
		$.post("/auction/" + $("#InputRaGia").attr("idAuction") + "/buy_it_now", {}, function(result) {
			console.log(result);
		});
	});
});
