#CURRENT WORKSHOP
url= 'https://workshops.birs.ca/events/location/CMO.json'
$.ajax url,
        success  : (data, status, xhr) ->
             for prop , val of data
                if ( (toYear(val.start_date) == toYear(thisYear())) and (prop <= momnt()-2) and (prop) >= momnt()-2)
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
#FUTURE AND PAST EVENTS
$.ajax url,
        success  : (data, status, xhr) ->
            for prop , val of data
                if (toYear(val.start_date) == toYear(thisYear()))
                    if (toDate(val.start_date) < thisYear()) and (prop >= (momnt()-6) and prop <= (momnt()-3) )
                        document.getElementById("last").innerHTML +="<div class='col-md-12'><div class='col-md-3'><img class='img-thumbnail' src='https://www.birs.ca/cmo-workshops/2016/#{val.code}/groupphoto.thumb.jpg'/></div><div class='col-md-9'><b>Workshop</b><a href='https://www.birs.ca/events/2016/5-day-workshops/#{val.code}'> #{val.name} </a><p></p><a href='http://www.birs.ca/events/2016/5-day-workshops/#{val.code}/press'> Press Release </a>"+toMonth(val.start_date)+" - "+toMonth(val.end_date)+" , "+" 2016  &#183; <a href='https://www.birs.ca/events/2016/5-day-workshops/#{val.code}'>#{val.code}</a></br> </div></div>"
                    else if (prop > (momnt()-2) and prop <= (momnt()+2))
                        document.getElementById("upcoming").innerHTML +="<br><b>Workshop</b>: <a href='https://www.birs.ca/events/2016/5-day-workshops/#{val.code}'>#{val.name}</a> "+toMonth(val.start_date)+" - "+toMonth(val.end_date)+", 2016 </br>"
        error    : (xhr, status, err) ->
            console.log("null "+err)
        complete : (xhr, status) ->
            console.log("complete")

toYear =(start) ->
    year= new Date(start).getFullYear()

thisYear =() ->
    now = new Date()

toDate =(fech)->
    fech= new Date(fech)

toMonth =(fech)->
    months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec']
    fech = new Date(fech)
    Nday = fech.getDate()
    Nmonth = months[fech.getMonth()]
    Nmonth+" "+Nday

momnt =()->
    week = moment().weeks()





   

