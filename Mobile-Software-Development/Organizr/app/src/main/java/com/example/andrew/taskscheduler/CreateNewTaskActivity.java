package com.example.andrew.taskscheduler;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.text.InputType;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

public class CreateNewTaskActivity extends AppCompatActivity implements View.OnClickListener
{

    private EditText eventDetailsBox;
    private EditText fromDateEtxt;
    private EditText eventUrgencyBox;
    private EditText eventDurationBox;
    private EditText otherUserBox;
    private TextView mainTaskScreen;
    private Button createTaskBtn;
    private Spinner dropdownDay;
    private Spinner dropdownMonth;
    private Spinner dropdownYear;
    private Spinner dropdownHour;
    private Spinner dropdownMinute;
    private TextView textView;
    public boolean waitingForGetOtherUserActivity;
    static final int AUTHENTICATE_REQUEST_CODE = 1;

    private int userId;

    static final int CREATETASK_REQUEST_CODE = 3;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_task);

        Bundle extras = getIntent().getExtras();
        userId = extras.getInt("userId");
        textView = (TextView) findViewById(R.id.myText);
        mainTaskScreen = (TextView) findViewById(R.id.link_to_mainTasks);
        eventDetailsBox = (EditText) findViewById(R.id.eventDetails);
        eventUrgencyBox = (EditText) findViewById(R.id.eventUrgency);
        eventDurationBox = (EditText) findViewById(R.id.eventDuration);
        otherUserBox = (EditText) findViewById(R.id.otherUser);
        createTaskBtn = (Button) findViewById(R.id.btnCreateTask);


        dropdownDay = (Spinner)findViewById(R.id.daySpinner);
        String[] daysInMonth = new String[31];
        for (int i = 0; i < 31; i++)
        {
            if (i < 9)
            {
                daysInMonth[i] = "0" + Integer.toString(i + 1);
            }

            else
            {
                daysInMonth[i] = Integer.toString(i + 1);
            }
        }
        ArrayAdapter<String> dayAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, daysInMonth);
        dropdownDay.setAdapter(dayAdapter);

        dropdownMonth = (Spinner)findViewById(R.id.monthSpinner);
        String[] months = new String[12];
        for (int i = 0; i < 12; i++)
        {
            if (i < 9)
            {
                months[i] = "0" + Integer.toString(i + 1);
            }

            else
            {
                months[i] = Integer.toString(i + 1);
            }
        }
        ArrayAdapter<String> monthAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, months);
        dropdownMonth.setAdapter(monthAdapter);

        dropdownYear = (Spinner)findViewById(R.id.yearSpinner);
        String[] years = new String[100];
        for (int i = 0; i < 100; i++)
        {
            years[i] = Integer.toString(i + 2015);
        }
        ArrayAdapter<String> yearAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, years);
        dropdownYear.setAdapter(yearAdapter);

        dropdownHour = (Spinner)findViewById(R.id.hourSpinner);
        String[] hours = new String[24];
        for (int i = 0; i < 24; i++)
        {
            if (i < 9)
            {
                hours[i] = "0" + Integer.toString(i + 1);
            }

            else
            {
                hours[i] = Integer.toString(i + 1);
            }
        }
        ArrayAdapter<String> hourAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, hours);
        dropdownHour.setAdapter(hourAdapter);

        dropdownMinute = (Spinner)findViewById(R.id.minuteSpinner);
        String[] minute = new String[61];
        for (int i = 0; i < 61; i++)
        {
            if (i < 9)
            {
                minute[i] = "0" + Integer.toString(i);
            }

            else
            {
                minute[i] = Integer.toString(i);
            }
        }
        ArrayAdapter<String> minuteAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, minute);
        dropdownMinute.setAdapter(minuteAdapter);

        // Listening to Login Screen link
        createTaskBtn.setOnClickListener(this);
        mainTaskScreen.setOnClickListener(this);
    }


    public void onClick(View v)
    {
        int id = v.getId();
        switch (id)
        {
            case R.id.btnCreateTask:
            {
                if (otherUserBox.getText().toString().matches(""))
                {
                    otherUserBox.setText("-1");
                    runCreateTaskIntent();
                }

                else
                {
                    runGetOtherUserIdIntent();
                }
                break;
            }
            case R.id.link_to_mainTasks:
            {
                // Closing registration screen
                // Switching to Login Screen/closing register screen
                finish();
                break;
            }
        }
    }

    public void runCreateTaskIntent()
    {
        Intent createNewTaskIntent = new Intent(CreateNewTaskActivity.this, TaskCreate.class);
        Bundle extras = new Bundle();
        extras.putInt("userId", userId);
        extras.putString("eventDetails", eventDetailsBox.getText().toString());
        String eventDate = dropdownYear.getSelectedItem().toString() + "-" +
                dropdownMonth.getSelectedItem().toString() + "-" +
                dropdownDay.getSelectedItem().toString() + " " +
                dropdownHour.getSelectedItem().toString() + ":" +
                dropdownMinute.getSelectedItem().toString() + ":00.000000";
        extras.putString("eventDate", eventDate);
        extras.putString("eventUrgency", eventUrgencyBox.getText().toString());
        extras.putString("eventDuration", eventDurationBox.getText().toString());
        extras.putString("otherUser", otherUserBox.getText().toString());
        extras.putString("stringUrl", "http://tobiasrieper-001-site1.1tempurl.com/createTask.php");
        createNewTaskIntent.putExtras(extras);
        startActivityForResult(createNewTaskIntent, CREATETASK_REQUEST_CODE);
    }

    public void runGetOtherUserIdIntent()
    {
        String stringUrl2 = "http://tobiasrieper-001-site1.1tempurl.com/getUserId.php";
        Intent authenticateIntent = new Intent(CreateNewTaskActivity.this, Authentication.class);
        authenticateIntent.putExtra("stringUrl", stringUrl2);
        authenticateIntent.putExtra("userName", otherUserBox.getText().toString());
        authenticateIntent.putExtra("password", "");
        startActivityForResult(authenticateIntent, AUTHENTICATE_REQUEST_CODE);
    }

    protected void onActivityResult(int requestCode, int resultCode, Intent data)
    {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode)
        {
            case (CREATETASK_REQUEST_CODE):
            {
                if (resultCode == Activity.RESULT_OK)
                {
                    String result = data.getStringExtra("result");
                    System.out.println(result);
                    result = result.replaceAll("\\s", "");

                    if (result.equals("success"))
                    {
                        Intent resultIntent = new Intent();
                        resultIntent.putExtra("result", "Successfully created task");
                        setResult(Activity.RESULT_OK, resultIntent);
                        finish();
                    }

                    else
                    {
                        textView.setText("Could not create task, please fill in all required info");
                    }
                }

                break;
            }

            case (AUTHENTICATE_REQUEST_CODE):
            {
                if (resultCode == Activity.RESULT_OK)
                {
                    String result = data.getStringExtra("result");
                    result = result.replaceAll("\\s", "");
                    try
                    {
                        JSONObject myJson = new JSONObject(result);
                        JSONArray users = myJson.getJSONArray("result");

                        JSONObject jsonObject = users.getJSONObject(0);
                        otherUserBox.setText(Integer.toString(jsonObject.getInt("_id")));
                    } catch (JSONException e)
                    {
                        System.out.println("Error parsing JSON Data");
                        otherUserBox.setText("-1");
                        e.printStackTrace();
                    }
                }
                runCreateTaskIntent();
                break;
            }
        }

    }
}
