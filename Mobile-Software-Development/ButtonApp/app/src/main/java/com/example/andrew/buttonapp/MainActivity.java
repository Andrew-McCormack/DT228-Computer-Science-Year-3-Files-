package com.example.andrew.buttonapp;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.Button;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Toast;
import android.os.Handler;

public class MainActivity extends AppCompatActivity implements View.OnClickListener
{
    Button btn1;
    Button btn2;

    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btn1 = (Button) findViewById(R.id.btn1);
        btn1.setOnClickListener(this);

        btn2 = (Button) findViewById(R.id.btn2);
        btn2.setOnClickListener(this);
    }

    public void onClick(View v)
    {
        switch (v.getId())
        {
            case R.id.btn1:
            {
                final Toast b1 = Toast.makeText(getApplicationContext(), "Top Button clicked", Toast.LENGTH_LONG);
                b1.show();
                Handler handler = new Handler();
                handler.postDelayed(new Runnable()
                {
                    public void run()
                    {
                        b1.cancel();
                    }
                }, 1000); //specify delay here that is shorter than Toast.LENGTH_SHORT
            }

            case R.id.btn2:
            {
                final Toast b2 = Toast.makeText(getApplicationContext(), "Bottom Button clicked", Toast.LENGTH_LONG);
                b2.show();
                Handler handler = new Handler();
                handler.postDelayed(new Runnable()
                {
                    @Override
                    public void run()
                    {
                        b2.cancel();
                    }
                }, 1000); //specify delay here that is shorter than Toast.LENGTH_SHORT
            }
        }
    }
}
