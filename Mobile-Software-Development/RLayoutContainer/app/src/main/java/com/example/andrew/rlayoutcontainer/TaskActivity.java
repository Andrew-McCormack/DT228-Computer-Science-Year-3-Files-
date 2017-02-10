package com.example.andrew.rlayoutcontainer;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;
import java.util.ArrayList;
import java.lang.String;

import java.util.ArrayList;

/**
 * Created by Andrew on 17/10/2015.
 */
public class TaskActivity extends ListActivity
{
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.task_view);

        ArrayList <String> tasks = new ArrayList<String>();
        Intent in = getIntent();
        tasks = (ArrayList<String>) in.getSerializableExtra("key");


        setListAdapter(new ArrayAdapter<String>(this, R.layout.task_view, tasks));

    }
}


