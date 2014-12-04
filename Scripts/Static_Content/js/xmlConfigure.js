$(document).ready(function () {
    if (($('#btnWizardFinished').attr('graph-stat')) == "false") {
        makeWizardXmlConfig();
        makeDDslickXmlConfig();

        var selectedDataY = $('#demoShowSelectedYaxis').data('ddslick').selectedData.description;
        if (!isValidYaxis(selectedDataY)) {
            $('#spanIcoCancel').css("display", "block");
            var a = $("a[href='#next']");
            a.attr("href", "#");
            a.css("cursor", "not-allowed");
        }
        else {
            $('#spanIcoCancel').css("display", "none");
            var a = $("a[href='#']");
            a.attr("href", "#next");
            a.css("cursor", "inherit");
        }


    }
    else {
        $('#wizard').css("display", "none");
        initializeChart();
    }

    //check if y axis is valid as number
    $('.dd-options').bind("click", function () {        
        var selectedDataY = $('#demoShowSelectedYaxis').data('ddslick').selectedData.description;
        if (!isValidYaxis(selectedDataY)) {
            $('#spanIcoCancel').css("display", "block");            
            var a = $("a[href='#next']");
            a.attr("href", "#");
            a.css("cursor", "not-allowed");
        }
        else {
            $('#spanIcoCancel').css("display", "none");
            var a = $("a[href='#']");
            a.attr("href","#next");
            a.css("cursor", "inherit");
        }
    });

});

// if y axis is valid as a number
function isValidYaxis(data){
    data = data.split(':');
    var firstVal = data[1].substring(3, data[1].length); //if currency is the first
    var secondtVal = data[1].substring(4, data[1].length); // if currency with " " is the first
    var thirdVal = data[1].substring(0, data[1].length - 1); // if currency is in the end
    var fourthdVal = data[1].substring(0, data[1].length - 2); // if " " with currency is in the end
    
    if (isNaN(data[1]) & isNaN(firstVal) & isNaN(secondtVal) & isNaN(thirdVal) & isNaN(fourthdVal)) {                       
        return false;
    }
    else { return true; };        
};

function makeWizardXmlConfig() {    
    $("#wizard").steps({
        headerTag: "h2",
        bodyTag: "section",
        transitionEffect: "slideLeft",
        stepsOrientation: "horizontal",
        cssClass: "wizard",

        /* effects */
        transitionEffect: 3, //integer: 0 - 2
        transitionEffectSpeed: 400, //default 200

        /* events */
        onFinished: function (event, currentIndex) {
            return wizardFinished();
        }
    });
};

function makeDDslickXmlConfig() {
    //initialize dropdown menu in xmlConfiguration      
    $('#demoShowSelectedXaxis').ddslick({
        width: 300,
        imagePosition: 'left',
        selectText: "Select X axis",
        truncateDescription: true,
    });    

    $('#demoShowSelectedYaxis').ddslick({
        width: 300,
        imagePosition: 'left',
        truncateDescription: true,
        selectText: "Select Y axis"
    });
    $('#demoShowSelectedQuantity').ddslick({
        width: 300,
        imagePosition: 'left',
        selectText: "Select quantity of displayed data",
        truncateDescription: true,
    });
};

/*  finish event    
    wizard's finished button event
*/
function wizardFinished() {    
    //get values from wizard to hidenField
    var selectedDataX = $('#demoShowSelectedXaxis').data('ddslick').selectedData.value;
    var selectedDataY = $('#demoShowSelectedYaxis').data('ddslick').selectedData.value;

    $('#hiddenFieldChartInfoX').val($.trim(selectedDataX));
    $('#hiddenFieldChartInfoY').val($.trim(selectedDataY));

    // click button
    clickFinishedButton();    
};



