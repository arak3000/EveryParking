
let barChart;

	ajaxCall("/profitCost/selectProfitChartDataByMonth", {}, function(data){
		var list = data.list;
		drawChart(list)
	});



function drawChart(list){
	let profitChart = document.getElementById('profitChart').getContext('2d');
	var resultLabels = [];
	var profitValue = [];

	list.forEach((item, index)=>{
		resultLabels.push(`${item.month}월`);
		profitValue.push(item.totalPrice);
	})
	
	if(barChart)
		barChart.destroy();
	barChart = new Chart(profitChart, {
		type : 'line',
	    data : {
	    	labels : resultLabels,
	    	datasets:[{
	   		 	label : '순수익',
	   		 	data : profitValue 
	    	}]
	    }
	})
	

}