package com.example.andrew.taskscheduler;

import android.app.Activity;
import android.app.ListActivity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;


public class LogInActivity extends AppCompatActivity implements View.OnClickListener
{
    private static final String DEBUG_TAG = "HttpExample";
    private EditText userNameBox;
    private EditText passwordBox;
    private Button loginBtn;
    private Button signUpBtn;
    private Button resetPassBtn;
    private TextView textView;
    static final int AUTHENTICATE_REQUEST_CODE = 0;
    static final int REGISTER_REQUEST_CODE = 6;


    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        textView         = (TextView) findViewById(R.id.myText);
        userNameBox      = (EditText) findViewById(R.id.userNameBox);
        passwordBox      = (EditText) findViewById(R.id.passwordBox);
        loginBtn = (Button) findViewById(R.id.loginBtn);
        signUpBtn  = (Button) findViewById(R.id.signUpBtn);
        resetPassBtn  = (Button) findViewById(R.id.resetPassBtn);

        loginBtn.setOnClickListener(this);
        signUpBtn.setOnClickListener(this);
        resetPassBtn.setOnClickListener(this);
    }

    public void onClick(View v)
    {
        int id = v.getId();
        switch (id)
        {
            case R.id.loginBtn:
            {
                String stringUrl = "http://tobiasrieper-001-site1.1tempurl.com/loginUser.php";

                Intent authenticateIntent = new Intent(LogInActivity.this, Authentication.class);
                authenticateIntent.putExtra("stringUrl", stringUrl);
                authenticateIntent.putExtra("userName", userNameBox.getText().toString());
                authenticateIntent.putExtra("password", passwordBox.getText().toString());
                startActivityForResult(authenticateIntent, AUTHENTICATE_REQUEST_CODE);

                break;
            }

            case R.id.signUpBtn :
            {
                Intent registerActivityIntent = new Intent(LogInActivity.this, RegisterActivity.class);
                startActivityForResult(registerActivityIntent, REGISTER_REQUEST_CODE);
                break;
            }

            case R.id.resetPassBtn :
            {

                break;
            }

        }
    }

    protected void onActivityResult(int requestCode, int resultCode, Intent data)
    {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode)
        {
            case (AUTHENTICATE_REQUEST_CODE):
            {
                if (resultCode == Activity.RESULT_OK)
                {
                    String result = data.getStringExtra("result");
                    result = result.replaceAll("\\s","");
                    try
                    {
                        textView.setText("");
                        JSONObject myJson = new JSONObject(result);
                        JSONArray users = myJson.getJSONArray("result");

                        JSONObject jsonObject = users.getJSONObject(0);

                        Intent logInIntent = new Intent(LogInActivity.this, MainTaskActivity.class);
                        Bundle extras = new Bundle();
                        extras.putInt("_id", (jsonObject.getInt("_id")));
                        extras.putString("userName", jsonObject.optString("userName").toString());
                        extras.putString("fistName", jsonObject.optString("firstName").toString());
                        extras.putString("lastName", jsonObject.optString("lastName").toString());
                        extras.putString("userPassWord", jsonObject.optString("userPassWord").toString());
                        extras.putString("userLocation", jsonObject.optString("userLocation").toString());
                        extras.putString("userEmail", jsonObject.optString("userEmail").toString());
                        logInIntent.putExtras(extras);
                        startActivity(logInIntent);
                    }

                    catch (JSONException e)
                    {
                        System.out.println("Error parsing JSON Data");
                        e.printStackTrace();
                        textView.setText("Could not find user with that username / password");
                    }
                }
                break;
            }
            case (REGISTER_REQUEST_CODE):
            {
                if (resultCode == Activity.RESULT_OK)
                {
                    System.out.println("Created user");
                    String result = data.getStringExtra("result");
                    Context context = getApplicationContext();
                    Toast toast = Toast.makeText(context, result, Toast.LENGTH_LONG);
                    toast.show();
                }
                break;
            }
        }
    }
}
