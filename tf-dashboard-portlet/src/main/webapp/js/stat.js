
$(document).ready(function() {
	
	var pieData = [
					{
						value: 50000,
						color:"#999",
						highlight: "#FF5A5E",
						label: "Total Invoice Amount"
					},
					{
						value: 20000,
						color: "#74941F",
						highlight: "#5AD3D1",
						label: "Settled Trade Amount"
					},
					{
						value: 25000,
						color: "#F7C808",
						highlight: "#FFC870",
						label: "Total Trade Amount"
					}
				];
				window.onload = function(){
					var ctx = document.getElementById("chart-area").getContext("2d");
					window.myPie = new Chart(ctx).Pie(pieData);
				};
});
