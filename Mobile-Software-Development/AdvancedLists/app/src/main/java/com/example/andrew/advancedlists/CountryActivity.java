package com.example.andrew.advancedlists;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.ArrayAdapter;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.view.View.OnClickListener;

import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.ion.Ion;
import java.net.MalformedURLException;
import java.net.URL;
import com.koushikdutta.ion.Ion;



public class CountryActivity extends AppCompatActivity implements View.OnClickListener
{
    Button btnBack;
    String stringUrl;
    Bitmap bmp;
    URL url;
    ImageView img;
    public void onCreate(Bundle savedInstanceState)
    {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.country_layout);

        Intent in = getIntent();
        Bundle bundle = in.getExtras();
        String message = bundle.getString("message");

        stringUrl = "https://www.countries-ofthe-world.com/flags/flag-of-";
        stringUrl = stringUrl.concat(message);
        stringUrl = stringUrl.concat(".png");
        stringUrl = stringUrl.replaceAll("\\s+", "");

        System.out.println(stringUrl);
        TextView txtView = (TextView) findViewById(R.id.label);
        txtView.setText(message);

        try
        {
            url = new URL(stringUrl);
        }
        catch (MalformedURLException e)
        {
            e.printStackTrace();
        }

        Ion.with(this).load(stringUrl).withBitmap().asBitmap().setCallback(new FutureCallback<Bitmap>()
        {
            @Override
            public void onCompleted(Exception e, Bitmap result)
            {
                img = (ImageView) findViewById(R.id.img);
                img.setImageBitmap(result);
            }
        });


        //img = (ImageView) findViewById(R.id.img);
        //img.setImageBitmap(bmp);
            btnBack=(Button)
            findViewById(R.id.back);
            btnBack.setOnClickListener(this);

        }

    public void onClick(View v)
    {
        switch (v.getId())
        {
            case R.id.back:
            {
                this.finish();
            }

        }
    }
}
