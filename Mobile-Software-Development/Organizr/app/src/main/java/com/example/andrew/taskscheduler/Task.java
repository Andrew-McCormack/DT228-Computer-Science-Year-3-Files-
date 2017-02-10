package com.example.andrew.taskscheduler;


import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Created by Andrew on 23/11/2015.
 */
public class Task
{
    private int eventId;
    private int userId;
    private String eventDetails;
    private String eventDate;
    private String eventUrgent;
    private String eventDuration;
    private int otherUserId;

    public int getEventId()
    {
        return eventId;
    }

    public void setEventId(int eventId)
    {
        this.eventId = eventId;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public String getEventDetails()
    {
        return eventDetails;
    }

    public void setEventDetails(String eventDetails)
    {
        this.eventDetails = eventDetails;
    }

    public String getEventDate()
    {
        return eventDate;
    }

    public void setEventDate(String eventDate)
    {
        this.eventDate = eventDate;
            String convertDate = new String();
            int counter = 9;
            for (int i = 0; i < eventDate.length(); i++)
            {
                if (i < 11)
                {
                    convertDate += eventDate.charAt(i);
                }


                else if (i == 11)
                {
                    SimpleDateFormat fromDB = new SimpleDateFormat("yyyy-mm-dd");
                    SimpleDateFormat myFormat = new SimpleDateFormat("dd-mm-yyyy");

                    try
                    {
                        convertDate = myFormat.format(fromDB.parse(convertDate));
                    } catch (ParseException e)
                    {
                        e.printStackTrace();
                    }
                    convertDate += " at ";
                }

                else if (i > 11 && i < 16)
                {
                    convertDate += eventDate.charAt(i);
                }
            }
            this.eventDate = convertDate;
    }

    public String getEventUrgent()
    {
        return eventUrgent;
    }

    public void setEventUrgent(String eventUrgent)
    {
        this.eventUrgent = eventUrgent;
    }

    public String getEventDuration()
    {
        return eventDuration;
    }

    public void setEventDuration(String eventDuration)
    {
        this.eventDuration = eventDuration;
    }

    public int getOtherUserId()
    {
        return otherUserId;
    }

    public void setOtherUserId(int otherUserId)
    {
        this.otherUserId = otherUserId;
    }



}
