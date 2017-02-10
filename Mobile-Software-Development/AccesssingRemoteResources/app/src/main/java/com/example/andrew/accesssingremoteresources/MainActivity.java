package com.example.andrew.accesssingremoteresources;

        import android.app.Activity;
        import android.content.Context;
        import android.net.ConnectivityManager;
        import android.net.NetworkInfo;
        import android.os.AsyncTask;
        import android.os.Bundle;
        import android.util.Log;
        import android.view.Menu;
        import android.view.MenuItem;
        import android.view.View;
        import android.widget.Button;
        import android.widget.EditText;
        import android.widget.TextView;

        import org.json.JSONArray;
        import org.json.JSONException;
        import org.json.JSONObject;

        import java.io.BufferedReader;
        import java.io.IOException;
        import java.io.InputStream;
        import java.io.InputStreamReader;
        import java.io.Reader;
        import java.io.UnsupportedEncodingException;
        import java.net.HttpURLConnection;
        import java.net.URL;
        import java.util.ArrayList;

public class MainActivity extends Activity implements View.OnClickListener
{
    private static final String DEBUG_TAG = "HttpExample";
    private EditText urlText;
    private TextView textView;
    private Button connectButton;

    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        urlText       = (EditText) findViewById(R.id.myUrl);
        textView      = (TextView) findViewById(R.id.myText);
        connectButton = (Button) findViewById(R.id.button);
        connectButton.setOnClickListener(this);
    }

    public void onClick(View view) {
        // Gets the URL from the UI's text field.

        //String stringUrl 	   		= urlText.getText().toString();
        String stringUrl  = "http://jsonplaceholder.typicode.com/todos";
        ConnectivityManager connMgr = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();
        if (networkInfo !=  null && networkInfo.isConnected())
        {
            new DownloadWebpageTask().execute(stringUrl);
        }
        else
        {
            textView.setText("No network connection available.");
        }
        // PART 1: INSERT CODE HERE  - Check if there is network access available at all, if there is, go ahead and download the web page.. if there isn’t print a message to the screen
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
            //textView.setText(result);

            try
            {

                JSONArray jsonArray = new JSONArray(result);
                for (int i = 0; i < jsonArray.length(); i++)
                {
                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    int taskId = Integer.parseInt(jsonObject.optString("id").toString());
                    String taskTitle = jsonObject.optString("title").toString();
                    String taskCompletion = jsonObject.optString("completed").toString();

                    System.out.println("Id is: " + taskId + "Title is: " + taskTitle + "Completion is: " + taskCompletion);
                }


            }
            catch (JSONException e)
            {
                e.printStackTrace();
            }

        }
    }
    // Given a URL, establishes an HttpUrlConnection and retrieves
// the web page content as a InputStream, which it returns as
// a string.
    private String downloadUrl(String myurl) throws IOException {
        InputStream is = null;
        // Only display the first 500 characters of the retrieved
        // web page content.
        int len = 500;

        try {
            URL url = new URL(myurl);
  /* PART 2:  INSERT CODE HERE: Use the HTTPURLConnection class to make a http connection.  Set some useful limits on the connection, such as connection timeout time, and read timeout. Set the HTTP request method to GET. Assume your connection object is called “conn”.*/
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setReadTimeout(10000);
            conn.setConnectTimeout(15000);
            conn.setRequestMethod("GET");
            conn.setDoInput(true);
            conn.connect();

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
            if (is != null) {
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
        try {
            while ((line = reader.readLine()) != null) {
                sb.append(line).append('\n');
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }
}
