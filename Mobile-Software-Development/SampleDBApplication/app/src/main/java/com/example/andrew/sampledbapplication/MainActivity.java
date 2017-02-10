package com.example.andrew.sampledbapplication;

import android.app.Activity;
import android.content.Context;
import android.database.Cursor;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import java.sql.SQLException;
import java.util.ArrayList;

public class MainActivity extends Activity
{

    Button displayTasksBtn;
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        displayTasksBtn = (Button) findViewById(R.id.btn1);
        displayTasksBtn.setOnClickListener(this);
        final ListView listTasks = (ListView) findViewById(R.id.listView_tasks);


        displayTasksBtn.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
            }
        SampleDBManager newDB = new SampleDBManager(this);


        try
        {
            newDB.open();
            Cursor result = newDB.getAll();
            MyCursorAdapter cursorAdapter = new MyCursorAdapter(MainActivity.this, result);
            listTasks.setAdapter(cursorAdapter);
            db.close();
        } catch (Exception ex) {
            Context context = getApplicationContext();
            CharSequence text = "Error opening database";
            int duration = Toast.LENGTH_LONG;

            Toast toast = Toast.makeText(context, text, duration);
            toast.show();
        }
    }
});

    @Override
    public boolean onCreateOptionsMenu(Menu menu)
    {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
