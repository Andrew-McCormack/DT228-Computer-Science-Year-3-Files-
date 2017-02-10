package com.example.andrew.rlayoutcontainer;

import android.app.ListActivity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.view.View.OnClickListener;
import android.widget.Toast;
import android.os.Handler;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements View.OnClickListener
{
    private ListView lv;
    Button btnOk;
    Button btnCancel;
    Button btnvTask;
    EditText edtText;
    ArrayList<String> tasks = new ArrayList<String>();
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnOk = (Button) findViewById(R.id.ok);
        btnOk.setOnClickListener(this);

        btnCancel = (Button) findViewById(R.id.cancel);
        btnCancel.setOnClickListener(this);

        btnvTask = (Button) findViewById(R.id.viewTask);
        btnvTask.setOnClickListener(this);

        edtText = (EditText) findViewById(R.id.entry);
        edtText.setOnClickListener(this);
    }

    public void onClick(View v)
    {
        switch (v.getId())
        {
            case R.id.ok:
            {
                tasks.add(edtText.getText().toString());
                edtText.setText("");
            }

            case R.id.cancel:
            {
                edtText.setText("");
            }

            case R.id.viewTask:
            {
                /*Intent intent = new Intent(MainActivity.this,TaskActivity.class);
                intent.putExtra("key", tasks);
                startActivity(intent);*/
                lv = (ListView) findViewById(R.id.list);
                ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, tasks );
                lv.setAdapter(arrayAdapter);
            }

        }
    }
}
