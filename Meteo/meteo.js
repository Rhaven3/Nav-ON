var callBackSuccess = function(data) {
    console.log("donnée api:\n", data);
}

function getMeteo(lat, long) {
    var url=`https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${long}&hourly=temperature_2m,precipitation_probability,visibility,wind_speed_10m,wind_direction_10m,wind_gusts_10m&timezone=auto&forecast_days=1`;
    
    $.get(url, callBackSuccess).done(function() {
        //alert("second success");
    })
    .fail(function() {
        alert("error");
    })
    .always(function() {
        //alert("finished");
    })
    
}

getMeteo();