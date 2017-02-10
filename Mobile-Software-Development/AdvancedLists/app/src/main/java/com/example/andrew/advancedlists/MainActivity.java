package com.example.andrew.advancedlists;

import android.app.Activity;
import android.app.ListActivity;
import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.util.Pair;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class MainActivity extends ListActivity {
    public String data;
    private ListView list;
    public ArrayList<Object> item = new ArrayList<Object>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        InputStream is = this.getResources().openRawResource(R.raw.countries);
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));

        try {
            while ((data = reader.readLine()) != null) {
                AddObjectToList(data + "\n", R.drawable.ok);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        final ListView lv = (ListView) findViewById(R.id.list);
        //setListAdapter(new ArrayAdapter<>(this, R.layout.list_rowlayout, R.id.textList, item));
        MyArrayAdapter myAd = new MyArrayAdapter(this, item);

        //lv.setAdapter(arrayAdapter);
       /* lv.setOnItemClickListener(new AdapterView.OnItemClickListener()
        {
            @Override
            public void onItemClick(AdapterView lv, View v, int position, long id)
            {


                //String country = ((lv.findViewById(R.id.list)).get(position).toString();
                //Toast.makeText(getApplicationContext(), "You have chosen: " + " " + country, Toast.LENGTH_LONG).show();
                //Toast.makeText(getApplicationContext(), ((TextView) v).getText(),
                //Toast.LENGTH_SHORT).show();
                country = (lv.getItemAtPosition(position).toString());
                Toast.makeText(getApplicationContext(), country, Toast.LENGTH_SHORT).show();

                Intent intent = new Intent(MainActivity.this, CountryActivity.class);
                intent.putExtra("message", country);
                startActivity(intent);
            }
        });*/
    }

    public void AddObjectToList(String country, int image1)
    {
        RowClass rC = new RowClass();
        rC.setCountry(country);
        rC.setImage1(image1);
        item.add(rC);
    }

   /* class MyAdapter extends ArrayAdapter<Object>
    {

        public MyAdapter()
        {
            super(MainActivity.this, R.layout.list_rowlayout, item);
        }

        public View getView(int position, View convertView, ViewGroup parent)
        {
            View itemView = convertView;
            if (itemView == null)
            {
                itemView = getLayoutInflater().inflate(R.layout.list_rowlayout, parent, false);
            }

            final RowClass rC = (RowClass) item.get(position);

            TextView textList = (TextView) findViewById(R.id.textList);
            textList.setText(rC.getCountry());
            //ImageView imgOk = (ImageView) findViewById(R.id.imgOk);
            //imgOk.setImageResource(R.drawable.ok);


            return itemView;

        }
    } */
}








