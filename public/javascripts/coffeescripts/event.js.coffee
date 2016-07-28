#EVENT GENERALS
$('#table_schedule').hide()
$('#table_confirmed').hide()
$.ajax 'https://workshops.birs.ca/events/16w5153.json',
        success  : (data, status, xhr) ->
             for prop,val of data
             	document.getElementById("event").innerHTML = '<span>'+data["event"].name+'('+data['event'].code+')</span>' +'<br/>'+ 'Arriving in Oaxaca, Mexico '+get_date(data["event"].start_date)+' and departing '+get_date(data["event"].end_date)+' '+toYear(data["event"].start_date)+'<img class="img-thumbnail" src="http://www.birs.ca/cmo-workshops/2016/16w5153/groupphoto.jpg" />'  
             #console.log(data[prop][1].firstname)
        error    : (xhr, status, err) ->
            console.log("null "+err)
        complete : (xhr, status) ->
            console.log("complete")
#EVENT SCHEDULE
$('.schedule').on 'click', (event) =>
    $('#event').hide()
    $('#table_confirmed').hide()
    $('#table_schedule').show()
    $.ajax 'https://workshops.birs.ca/events/16w5153/schedule.json',
            success  : (data, status, xhr) ->
                for prop, val of data
                    time = val['start_time']
                    day = '<tbody><tr><th class="day-head" colspan="2">'+get_date(time)+'</th></tr>'
                    comp = getdate(time)
                    body ='<tr><td class="item-time">'+get_time(val['start_time'])+' - '+get_time(val['end_time'])+'</td><td class="item-name">'+val["name"]+' '+val["location"]+'</td></tr>'
                    if (comp == 0)
                        #document.getElementById("sun").innerHTML = day
                        document.getElementById("sun").innerHTML += body
                    else if (comp == 1)
                        #document.getElementById("mon").innerHTML = day
                        document.getElementById("mon").innerHTML += body
                    else if (comp == 2)
                        #document.getElementById("tue").innerHTML = day
                        document.getElementById("tue").innerHTML += body
                    else if (comp == 3)
                        #document.getElementById("wed").innerHTML = day
                        document.getElementById("wed").innerHTML += body
                    else if (comp == 4)
                        #document.getElementById("thu").innerHTML = day
                        document.getElementById("thu").innerHTML += body
                    else if (comp == 5)
                        #document.getElementById("fri").innerHTML = day
                        document.getElementById("fri").innerHTML += body
                console.log(prop)
             	console.log(val)
            error    : (xhr, status, err) ->
                console.log("null "+err)
            complete : (xhr, status) ->
                console.log("complete")
#MAILING LIST
$('.participants').on 'click', (event) =>
    $('#event').hide()
    $('#table_schedule').hide()
    $('#table_confirmed').show()
    $.ajax 'https://workshops.birs.ca/events/16w5153.json',
        success  : (data, status, xhr) ->  
            for i in [0...40]
                confirmed_participants ='<tr><td><a href='+data['members'][i].url+'>'+data['members'][i].firstname+' '+data['members'][i].lastname+'</a></td><td>'+data['members'][i].affiliation+'</td></tr>'
                document.getElementById("table_confirmed").innerHTML += confirmed_participants
            console.log(data['members'])
        error    : (xhr, status, err) ->
            console.log("null "+err)
        complete : (xhr, status) ->
            console.log("complete")

get_time =(start) ->
    start= new Date(start)
    start.getHours()+':'+start.getMinutes()

getdate =(da) ->
    date = new Date(da)
    day = date.getDay()
    day

toYear =(start) ->
    year= new Date(start).getFullYear()

get_date =(date) ->
    months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec']
    days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    date = new Date(date)
    name_day = days[date.getDay()]
    day = date.getDate()
    month = months[date.getMonth()]
    name_day+" "+month+" "+day


