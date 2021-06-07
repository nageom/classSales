<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	function scateChange() {

		var make = [ "가죽", "유리", "실" ];
		var cook = [ "한식", "중식", "양식" ];
		var beauty = [ "헤어", "피부", "바디" ];

		var selectItem = $("#big_name").val();

		var changeItem;

		if (selectItem == "공예") {
			changeItem = make;
		} else if (selectItem == "요리") {
			changeItem = cook;
		} else if (selectItem == "뷰티") {
			changeItem = beauty;
		}
		var itemle = changeItem.length;
		$('#small_name').empty();

		for (var count = 0; count < itemle; count++) {
			var option = $("<option>" + changeItem[count] + "</option>");
			$('#small_name').append(option);
		}

	}
	
	
	// 클래스 이미지 첨부

	$("#pImg").change(function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select_img").attr("src", data.target.result).width(500);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});

	// 썸네일 사진 첨부
	$("#cImg").change(function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(".select_img").attr("src", data.target.result).width(500);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
</script>

