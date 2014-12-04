function clickFinishedButton() {
    $('#btnWizardFinished').trigger('click');           
};

function initializeChart() {
    var ctx = $("#myChart").get(0).getContext("2d");
    var data = {
        labels: ["default"],
        datasets: [            
            {
                label: "dataset",
                fillColor: "rgba(151,187,205,0.5)",
                strokeColor: "rgba(151,187,205,0.8)",
                highlightFill: "rgba(151,187,205,0.75)",
                highlightStroke: "rgba(151,187,205,1)",
                data: [0]
            }
        ]
    };
    var myBarChart = new Chart(ctx).Bar(data);

    var xValues = ($('#hiddenFieldChartInfoX')).val().split(';')
    var yValues = ($('#hiddenFieldChartInfoY')).val().split(';')

    for (i = 0; i < xValues.length - 1; i++) {
        if (i > 30) {
            break;
        }        
        myBarChart.addData([parseFloat(yValues[i])], xValues[i]);        
    };
    myBarChart.update();
    

}