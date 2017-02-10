package com.example.andrew.taskscheduler;

        import android.app.Activity;
        import android.app.ListActivity;
        import android.content.Context;
        import android.content.Intent;
        import android.os.Bundle;
        import android.view.View;
        import android.widget.AdapterView;
        import android.widget.Button;
        import android.widget.ListView;
        import android.widget.ScrollView;
        import android.widget.TableRow;
        import android.widget.TextView;
        import android.widget.Toast;

        import org.json.JSONArray;
        import org.json.JSONException;
        import org.json.JSONObject;

        import java.util.ArrayList;

public class MainTaskActivity extends ListActivity implements View.OnClickListener
{

    public Button newTaskBtn;
    public User loggedInUser;
    public String stringUrl;
    public TextView logout;
    public Task task;
    static final int GETTASKS_REQUEST_CODE = 2;
    static final int CREATENEWTASK_REQUEST_CODE = 5;
    ArrayList<Task> tasks;
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_task);

        task = new Task();
        tasks = new ArrayList<>();

        newTaskBtn = (Button) findViewById(R.id.newTasksBtn);
        newTaskBtn.setOnClickListener(this);
        logout = (TextView) findViewById(R.id.link_to_logout);
        logout.setOnClickListener(this);

        Intent in = this.getIntent();
        Bundle bundle = in.getExtras();

        loggedInUser = new User();

        loggedInUser.set_id(bundle.getInt("_id"));
        loggedInUser.setUserName(bundle.getString("userName"));
        loggedInUser.setFirstName(bundle.getString("firstName"));
        loggedInUser.setLastName(bundle.getString("lastName"));
        loggedInUser.setUserPassWord(bundle.getString("userPassWord"));
        loggedInUser.setUserLocation(bundle.getString("userLocation"));
        loggedInUser.setUserEmail(bundle.getString("userEmail"));

        getTasks();

        final ListView listTasks = getListView();
        MyAdapter myAdapter = new MyAdapter(MainTaskActivity.this, tasks);
        listTasks.setAdapter(myAdapter);
        listTasks.setOnItemClickListener(new AdapterView.OnItemClickListener()
        {
            public void onItemClick(AdapterView<?> myAdapter, View myView, int pos, long mylng)
            {
                Intent inDepthTaskIntent = new Intent(MainTaskActivity.this, InDepthTaskActivity.class);

                Bundle extras = new Bundle();
                extras.putString("eventDetails", tasks.get(pos).getEventDetails());
                extras.putString("eventDate", tasks.get(pos).getEventDate());
                extras.putString("eventDuration", tasks.get(pos).getEventDuration());
                extras.putString("eventUrgent", tasks.get(pos).getEventUrgent());
                extras.putInt("otherUserId", tasks.get(pos).getOtherUserId());
                inDepthTaskIntent.putExtras(extras);
                startActivity(inDepthTaskIntent);
            }
        });

    }
    
    public void onClick(View v)
    {
        int id = v.getId();
        switch (id)
        {
            case R.id.newTasksBtn:
            {
                Intent NewTaskActivityIntent = new Intent(MainTaskActivity.this, CreateNewTaskActivity.class);
                NewTaskActivityIntent.putExtra("userId", loggedInUser.get_id());
                startActivityForResult(NewTaskActivityIntent, CREATENEWTASK_REQUEST_CODE);
                break;
            }
            case R.id.link_to_logout:
            {
                // Closing registration screen
                // Switching to Login Screen/closing register screen
                finish();
                break;
            }
        }
    }

    public void getTasks()
    {
        stringUrl = "http://tobiasrieper-001-site1.1tempurl.com/getTasks.php";
        Intent getTasksIntent = new Intent(MainTaskActivity.this, getTasks.class);
        getTasksIntent.putExtra("stringUrl", stringUrl);
        getTasksIntent.putExtra("useId", loggedInUser.get_id());
        startActivityForResult(getTasksIntent, GETTASKS_REQUEST_CODE);
    }
    protected void onActivityResult(int requestCode, int resultCode, Intent data)
    {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode)
        {
            case (GETTASKS_REQUEST_CODE):
            {
                if (resultCode == Activity.RESULT_OK)
                {
                    String result = data.getStringExtra("result");
                    System.out.println(result);
                    try
                    {
                        JSONObject myJson = new JSONObject(result);
                        JSONArray jsonArray = myJson.getJSONArray("result");

                        for (int i = 0; i < jsonArray.length(); i++)
                        {
                            JSONObject jsonObject = jsonArray.getJSONObject(i);
                            Task task = new Task();
                            task.setEventId(Integer.parseInt(jsonObject.optString("eventId").toString()));
                            task.setUserId(Integer.parseInt(jsonObject.optString("userId").toString()));
                            task.setEventDetails(jsonObject.optString("eventDetails").toString());
                            task.setEventDate(jsonObject.optString("eventDate"));
                            task.setEventUrgent(jsonObject.optString("eventUrgent").toString());
                            task.setEventDuration(jsonObject.optString("eventDuration").toString());
                            task.setOtherUserId(jsonObject.getInt("otherUserId"));
                            tasks.add(task);
                        }
                    }

                    catch (JSONException e)
                    {
                        System.out.println("Error parsing JSON data");
                    }
                }
                break;
            }

            case (CREATENEWTASK_REQUEST_CODE):
            {
                if (resultCode == Activity.RESULT_OK)
                {
                    String result = data.getStringExtra("result");
                    Context context = getApplicationContext();
                    Toast toast = Toast.makeText(context, result, Toast.LENGTH_LONG);
                    toast.show();
                    getTasks();
                }
                break;
            }
        }

    }

}
