package com.example.andrew.taskscheduler;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

/**
 * Created by Andrew on 21/11/2015.
 */
public class Authentication extends Activity
{
    private static final String DEBUG_TAG = "PHPAuthentication";
    private TextView textView;
    private TextView userNameBox;
    private TextView passwordBox;
    public String userName;
    public String password;
    public int userId;
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.authentication);
        //textView         = (TextView) findViewById(R.id.myText);

        Intent in = getIntent();
        Bundle bundle = in.getExtras();
        String stringUrl = bundle.getString("stringUrl");

        System.out.println("In authenticate");
        userName = bundle.getString("userName");
        password = bundle.getString("password");

        if (userName == null)
        {
            userId = bundle.getInt("userId");
        }


        ConnectivityManager connMgr = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();

        if (networkInfo != null && networkInfo.isConnected())
        {
            DownloadWebpageTask downloadWebPageTask = new DownloadWebpageTask();
            downloadWebPageTask.execute(stringUrl);
        }
        else
        {
            String result = "No network connection available.";
        }
    }

    public String getPassword()
    {
        return password;
    }


/* Use AsyncTask as an inner class to create a task away from the main UI thread. This task takes a URL string and uses it to create an HttpUrlConnection. Once the connection has been established, the AsyncTask downloads the contents of the webpage as an InputStream. Finally, the InputStream is converted into a string, which is displayed in the UI by the AsyncTask's onPostExecute method*/
private class DownloadWebpageTask extends AsyncTask<String, Void, String>
{
    protected String doInBackground(String... urls) {
        // params comes from the execute() call: params[0] is the url.
        try
        {
            return downloadUrl(urls[0]);
        }
        catch (IOException e)
        {
            return "Unable to retrieve web page. URL may be invalid.";
        }
    }
    // onPostExecute displays the results of the AsyncTask.
    protected void onPostExecute(String result)
    {
        Intent resultIntent = new Intent();
        resultIntent.putExtra("result", result);
        setResult(Activity.RESULT_OK, resultIntent);
        finish();
    }
}
    // Given a URL, establishes an HttpUrlConnection and retrieves
// the web page content as a InputStream, which it returns as
// a string.
    private String downloadUrl(String myurl) throws IOException
    {
        InputStream is = null;
        try
        {
            URL url = new URL(myurl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            String POST_PARAMS;
            if (password.equals(""))
            {
                if (userName == null)
                {
                    POST_PARAMS = "userId=" + userId;
                }
                else
                {
                    POST_PARAMS = "userName=" + userName;
                }
            }

            else
            {
                POST_PARAMS = "userName=" + userName + "&" + "password=" + password;
            }
            System.out.println(POST_PARAMS);
            conn.setFixedLengthStreamingMode(POST_PARAMS.getBytes().length);
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            PrintWriter out = new PrintWriter(conn.getOutputStream());
            out.print(POST_PARAMS);
            out.close();
            conn.setReadTimeout(10000);
            conn.setConnectTimeout(15000);

            int response = conn.getResponseCode();
            Log.d(DEBUG_TAG, "The response is: " + response);
            is = conn.getInputStream();

            // Convert the InputStream into a string
            String contentAsString = convertStreamToString(is);
            return contentAsString;

            // Makes sure that the InputStream is closed after the app is
            // finished using it.
        }
        finally
        {
            if (is != null)
            {
                is.close();
            }
        }
    }
    // Reads an InputStream and converts it to a String.
    public String convertStreamToString (InputStream is)
    {
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();

        String line = null;
        try
        {
            while ((line = reader.readLine()) != null)
            {
                sb.append(line).append('\n');
            }
        } catch (IOException e)
        {
            e.printStackTrace();
        } finally
        {
            try
            {
                is.close();
            } catch (IOException e)
            {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }
}
