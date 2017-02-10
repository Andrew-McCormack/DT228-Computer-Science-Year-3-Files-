package com.example.andrew.taskscheduler;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Objects;

/**
 * Created by Andrew on 12/11/2015.
 */
public class MyAdapter extends ArrayAdapter<Task>
{
    private final ArrayList<Task>  tasks = new ArrayList<Task>();

    public MyAdapter(Context context, ArrayList<Task> tasks)
    {
        super(context, 0, tasks);
    }


    public View getView(int position, View convertView, ViewGroup parent)
    {
        Task task = getItem(position);
        if (convertView == null)
        {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.row, parent, false);
        }
        // Find fields to populate in inflated template
        TextView eventDetails = (TextView) convertView.findViewById(R.id.eventDetails);
        TextView eventDate = (TextView) convertView.findViewById(R.id.eventDate);
        TextView eventDuration = (TextView) convertView.findViewById(R.id.eventDuration);
        if (task.getEventUrgent().equals("y") || task.getEventUrgent().equals("Y"))
        {
            eventDetails.setTextColor(Color.RED);
        }
        else
        {
            eventDetails.setTextColor(Color.BLACK);
        }
        if (task.getEventDetails().length() > 22)
        {
            eventDetails.setText(task.getEventDetails().substring(0, 18) + "...");
        }
        else
        {
            eventDetails.setText(task.getEventDetails());
        }
        eventDate.setText(" on " + task.getEventDate() + " for ");
        eventDuration.setText(task.getEventDuration());

        return convertView;
    }
}
