
$(document).ready(function() {
	
	var pieData = [
					{
						value: $("#investmentCap").val(),
						color:"#4786BC",
						highlight: "#FF5A5E",
						label: "Investment Cap"
					},
					{
						value: $("#availToInvest").val(),
						color: "#666666",
						highlight: "#5AD3D1",
						label: "Available To Invest"
					},
					{
						value: $("#amountInvested").val(),
						color: "#DEE7EE",
						highlight: "#FFC870",
						label: "Amount Invested"
					}
				];
	
	var options = {
		   
		    animateRotate: true,
		    animateScale: false
		    
		}
				window.onload = function(){
					var ctx = document.getElementById("chart-area").getContext("2d");
					var myChart = new Chart(ctx).Pie(pieData,options);
					document.getElementById("js-legend").innerHTML = myChart.generateLegend();
				};
});
