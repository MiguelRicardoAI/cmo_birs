#EVENT GENERALS
$('#table_schedule').hide()
$('#table_confirmed').hide()
$('#press').hide()
$('#vidplayer').hide()
<<<<<<< HEAD
<<<<<<< HEAD

$.ajax 'https://workshops.birs.ca/events/16w5153.json',
=======
=======
>>>>>>> feature/cmo
codeEvent =() ->
    getEvent = getElementById("codeEvent").value

idEvent = codeEvent()

$.ajax 'https://workshops.birs.ca/events/'+idEvent+'.json',
<<<<<<< HEAD
>>>>>>> feature/cmo
=======
>>>>>>> feature/cmo
    success  : (data, status, xhr) ->
        for prop,val of data
            data_event = '<p><span>'+data["event"].name+'('+data['event'].code+')</span></p>'
            info_event = 'Arriving in Oaxaca, Mexico '+get_date(data["event"].start_date)+' and departing '+get_date(data["event"].end_date)+' , '+toYear(data["event"].start_date)
<<<<<<< HEAD
<<<<<<< HEAD
            thumbnail_event = '<p><img class="img-thumbnail" src="http://www.birs.ca/cmo-workshops/2016/16w5153/groupphoto.jpg"></img></p>'    
=======
            thumbnail_event = '<p><img class="img-thumbnail" src="http://www.birs.ca/cmo-workshops/2016/'+idEvent+'/groupphoto.jpg"></img></p>'    
>>>>>>> feature/cmo
=======
            thumbnail_event = '<p><img class="img-thumbnail" src="http://www.birs.ca/cmo-workshops/2016/'+idEvent+'/groupphoto.jpg"></img></p>'    
>>>>>>> feature/cmo
            objectives_event = '<span> Objectives </span><p>'+data["event"].description+'</p>' 
            document.getElementById("event").innerHTML =  data_event+info_event+thumbnail_event+objectives_event
    error    : (xhr, status, err) ->
        console.log("null "+err)
    complete : (xhr, status) ->
        console.log("complete")

#EVENT SCHEDULE
$('.schedule').on 'click', (event) =>
    $('#event').hide()
    $('#table_confirmed').hide()
    $('#press').hide()
    $('#table_schedule').show()
    $.ajax 'https://workshops.birs.ca/events/'+idEvent+'/schedule.json',
            success  : (data, status, xhr) ->
                for prop, val of data
                    time = val['start_time']
                    day = '<tbody><tr><th class="day-head" colspan="2">'+get_date(time)+'</th></tr>'
                    comp = getdate(time)
                    body = '<tr><td class="item-time">'+get_time(val['start_time'])+' - '+get_time(val['end_time'])+'</td><td class="item-name">'+val["name"]+' '+val["location"]+'</td></tr>'
                    if (comp == 0)
                        document.getElementById("headsun").innerHTML = day
                        document.getElementById("bsun").innerHTML += body
                    else if (comp == 1)
                        document.getElementById("headmon").innerHTML = day
                        document.getElementById("bmon").innerHTML += body
                    else if (comp == 2)
                        document.getElementById("headtue").innerHTML = day
                        document.getElementById("btue").innerHTML += body
                    else if (comp == 3)
                        document.getElementById("headwed").innerHTML = day
                        document.getElementById("bwed").innerHTML += body
                    else if (comp == 4)
                        document.getElementById("headthu").innerHTML = day
                        document.getElementById("bthu").innerHTML += body
                    else if (comp == 5)
                        document.getElementById("headfri").innerHTML = day
                        document.getElementById("bfri").innerHTML += body
            error    : (xhr, status, err) ->
                console.log("null "+err)
            complete : (xhr, status) ->
                console.log("complete")
#PRESS
$('.pressr').on 'click', (event) =>
    $('#event').hide()
    $('#table_schedule').hide()
    $('#table_confirmed').hide()
    $('#press').show()
<<<<<<< HEAD
<<<<<<< HEAD
    $.ajax 'https://workshops.birs.ca/events/16w5153.json',
=======
    $.ajax 'https://workshops.birs.ca/events/'+idEvent+'.json',
>>>>>>> feature/cmo
=======
    $.ajax 'https://workshops.birs.ca/events/'+idEvent+'.json',
>>>>>>> feature/cmo
        success  : (data, status, xhr) ->
                confirmed_participants = data["event"].press_release
                document.getElementById("press").innerHTML = confirmed_participants
        error    : (xhr, status, err) ->
            console.log("null "+err)
        complete : (xhr, status) ->
            console.log("complete")
#VIDEOS
$('.videos').on 'click', (event) =>
    $('#event').hide()
    $('#table_schedule').hide()
    $('#table_confirmed').hide()
    $('#press').hide()
    $('#vidplayer').show()
    jwplayer('vidplayer').setup
      file: 'http://videos.birs.ca/2016/16w5111/201608030940-Madry.mp4'
      image: 'http://www.birs.ca/files/images/poster.png'
      autostart: true
      width: 832
      height: 480
      sharing:
        code: encodeURI('<iframe src="http://www.birs.ca/events/2016/5-day-workshops/16w5111/videos/embed/201608030940-Madry.mp4" width="832"  height="480" frameborder="0"  scrolling="auto" itemprop="video" />')
        link: 'http://www.birs.ca/events/2016/5-day-workshops/16w5111/videos/watch/201608030940-Madry.html'

#PARTICIPANTS
$('.participants').on 'click', (event) =>
    $('#event').hide()
    $('#press').hide()
    $('#table_schedule').hide()
    $('#table_confirmed').show()
    $.ajax 'https://workshops.birs.ca/events/'+idEvent+'.json',
        success  : (data, status, xhr) ->  
            for i in [0...40]
                confirmed_participants ='<tr><td><a href='+data['members'][i].url+'>'+data['members'][i].lastname+' , '+data['members'][i].firstname+'</a></td><td>'+data['members'][i].affiliation+'</td></tr>'
                document.getElementById("table_confirmed").innerHTML += confirmed_participants
            console.log(data['members'])
        error    : (xhr, status, err) ->
            console.log("null "+err)
        complete : (xhr, status) ->
            console.log("complete")

get_time =(start) ->
    start= new Date(start)
    start.getUTCHours()+':'+start.getUTCMinutes()

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


