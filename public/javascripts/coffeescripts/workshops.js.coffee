#CURRENT WORKSHOP
url= 'https://workshops.birs.ca/events/location/CMO.json'

#WORKSHOPS
$.ajax url,
        success  : (data, status, xhr) ->
             for prop , val of data
                if (toYear(val.start_date) == 2015) then document.getElementById("2015").innerHTML +="<tr class='fila'> <td>#{val.code}</td><td><a href='https://www.birs.ca/events/2016/5-day-workshops/#{val.code}'>#{val.name}</a></td><td>#{val.start_date}</td><td>#{val.end_date}</td></tr>"
                else if (toYear(val.start_date) == toYear(thisYear())) then document.getElementById("2016").innerHTML +="<tr class='fila'> <td>#{val.code}</td><td><a href='https://www.birs.ca/events/2016/5-day-workshops/#{val.code}'>#{val.name}</a></td><td>#{val.start_date}</td><td>#{val.end_date}</td></tr>"
                else document.getElementById("2017").innerHTML +="<tr class='fila'> <td>#{val.code}</td><td><a href='https://www.birs.ca/events/2016/5-day-workshops/#{val.code}'>#{val.name}</a></td><td>#{val.start_date}</td><td>#{val.end_date}</td></tr>"
        error    : (xhr, status, err) ->
            console.log("null "+err)
        complete : (xhr, status) ->
            console.log("complete")

toYear =(start) ->
    year= new Date(start).getFullYear()

thisYear =() ->
    now = new Date()