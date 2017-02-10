package com.example.andrew.taskscheduler;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class RegisterActivity extends AppCompatActivity implements View.OnClickListener
{

    private EditText userNameBox;
    private EditText firstNameBox;
    private EditText lastNameBox;
    private EditText passWordBox;
    private EditText countryBox;
    private EditText emailBox;
    private TextView loginScreen;
    private Button registerBtn;
    private TextView textView;
    static final int REGISTER_REQUEST_CODE = 1;
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        textView         = (TextView) findViewById(R.id.myText);
        loginScreen = (TextView) findViewById(R.id.link_to_login);
        userNameBox = (EditText) findViewById(R.id.userName);
        firstNameBox = (EditText) findViewById(R.id.firstName);
        lastNameBox = (EditText) findViewById(R.id.lastName);
        passWordBox = (EditText) findViewById(R.id.passWord);
        countryBox = (EditText) findViewById(R.id.country);
        emailBox = (EditText) findViewById(R.id.email);
        registerBtn = (Button) findViewById(R.id.btnRegister);

        // Listening to Login Screen link
        registerBtn.setOnClickListener(this);
        loginScreen.setOnClickListener(this);
    }

    public void onClick(View v)
    {
        int id = v.getId();
        switch (id)
        {
            case R.id.btnRegister:
            {
                Intent registerIntent = new Intent(RegisterActivity.this, Registration.class);
                Bundle extras = new Bundle();
                extras.putString("userName", userNameBox.getText().toString());
                extras.putString("firstName", firstNameBox.getText().toString());
                extras.putString("lastName", lastNameBox.getText().toString());
                extras.putString("userPassWord", passWordBox.getText().toString());
                extras.putString("userLocation", countryBox.getText().toString());
                extras.putString("userEmail", emailBox.getText().toString());
                extras.putString("stringUrl", "http://tobiasrieper-001-site1.1tempurl.com/createUser.php");
                registerIntent.putExtras(extras);
                startActivityForResult(registerIntent, REGISTER_REQUEST_CODE);
                break;
            }
            case R.id.link_to_login:
            {
                // Closing registration screen
                // Switching to Login Screen/closing register screen
                finish();
                break;
            }
        }
    }

    protected void onActivityResult(int requestCode, int resultCode, Intent data)
    {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode)
        {
            case (REGISTER_REQUEST_CODE):
            {
                if (resultCode == Activity.RESULT_OK)
                {
                    String result = data.getStringExtra("result");
                    System.out.println(result);
                    result = result.replaceAll("\\s", "");

                    if (result.equals("success"))
                    {
                        Intent resultIntent = new Intent();
                        resultIntent.putExtra("result", "Successfully created user: " + userNameBox.getText().toString());
                        setResult(Activity.RESULT_OK, resultIntent);
                        finish();
                    }

                    else
                    {
                        textView.setText("Could not create account, please fill in all required info");
                    }
                }

                break;
            }
        }
    }

}
