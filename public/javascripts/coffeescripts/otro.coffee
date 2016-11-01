$.ajax url,
        success  : (data, status, xhr) ->
             for prop , val of data
                if ( (toYear(val.start_date) == toYear(thisYear())) and (toDate(val.start_date) <= thisYear()) and (toDate(val.end_date) >= thisYear()) or  (toDate(val.end_date) == thisYear()))
                                workshop_home = '<a href="http://www.birs.ca/events/2016/5-day-workshops/' + val.code + '">' + val.name + '</a>'
                                workshop_press = '<a href="http://www.birs.ca/events/2016/5-day-workshops/' + val.code + '/press"> Press Release </a>'
                                workshop_dates = toMonth(val.start_date) + ' - ' + toMonth(val.end_date) + ' , ' + toYear(val.end_date)
                                workshop_code = '<a href="http://www.birs.ca/events/2016/5-day-workshops/' + val.code + '">' + val.code + '</a>'
                                workshop_thumb = '<img class="img-thumbnail" src="https://www.birs.ca/cmo-workshops/2016/' + val.code + '/groupphoto.thumb.jpg" />'                
                document.getElementById("info").innerHTML ='<p>' + workshop_home + '</p><p>' + workshop_press + ' ' + workshop_dates + ' &#183; ' + workshop_code + '</p>'
                document.getElementById("thumb").innerHTML = workshop_thumb
        error    : (xhr, status, err) ->
            console.log("null "+err)
        complete : (xhr, status) ->
            console.log("complete")