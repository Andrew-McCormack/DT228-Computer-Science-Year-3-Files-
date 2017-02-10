package com.example.andrew.taskscheduler;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class InDepthTaskActivity extends AppCompatActivity
{
    private Task task;
    private TextView eventDetails;
    private TextView eventDate;
    private TextView eventDuration;
    private TextView eventUrgent;
    private TextView otherUser;
    static final int GETUSERNAME_REQUEST_CODE = 6;
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.in_depth_task);

        eventDetails = (TextView) findViewById(R.id.eventDetails);
        eventDate = (TextView) findViewById(R.id.eventDate);
        eventDuration = (TextView) findViewById(R.id.eventDuration);
        eventUrgent = (TextView) findViewById(R.id.eventUrgency);
        otherUser = (TextView) findViewById(R.id.otherUser);
        Bundle extras = getIntent().getExtras();
        if (extras != null)
        {
            Intent in = this.getIntent();
            Bundle bundle = in.getExtras();
            task = new Task();
            task.setEventDetails(bundle.getString("eventDetails"));
            task.setEventDuration(bundle.getString("eventDuration"));
            String stringEventDate = bundle.getString("eventDate");
            task.setEventUrgent(bundle.getString("eventUrgent"));
            task.setOtherUserId(bundle.getInt("otherUserId"));
            TextView t = (TextView) findViewById(R.id.info);
            eventDetails.setText(task.getEventDetails());
            eventDuration.setText(task.getEventDuration());
            eventDate.setText(stringEventDate);

            if (task.getEventUrgent().equals("y") || task.getEventUrgent().equals("Y"))
            {
                eventUrgent.setText("IMPORTANT!!!!");
            }

            else
            {
                eventUrgent.setText("Not important");
            }

            if (task.getOtherUserId() != -1)
            {
                String stringUrl = "http://tobiasrieper-001-site1.1tempurl.com/getUserName.php";
                Intent authenticateIntent = new Intent(InDepthTaskActivity.this, Authentication.class);
                authenticateIntent.putExtra("stringUrl", stringUrl);
                authenticateIntent.putExtra("userId", task.getOtherUserId());
                authenticateIntent.putExtra("password", "");
                startActivityForResult(authenticateIntent, GETUSERNAME_REQUEST_CODE);
            }

            else
            {
                otherUser.setText("No other users involved");
            }
        }
    }

    protected void onActivityResult(int requestCode, int resultCode, Intent data)
    {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode)
        {
            case (GETUSERNAME_REQUEST_CODE):
            {
                if (resultCode == Activity.RESULT_OK)
                {
                    System.out.println("In result of getUserName");
                    String result = data.getStringExtra("result");
                    result = result.replaceAll("\\s", "");
                    try
                    {
                        JSONObject myJson = new JSONObject(result);
                        JSONArray users = myJson.getJSONArray("result");

                        JSONObject jsonObject = users.getJSONObject(0);
                        otherUser.setText(jsonObject.getString("userId"));
                    }
                    catch (JSONException e)
                    {
                        System.out.println("Error parsing JSON Data");
                        otherUser.setText("No other users involved");
                        e.printStackTrace();
                    }
                }
                break;
            }
        }
    }
}
