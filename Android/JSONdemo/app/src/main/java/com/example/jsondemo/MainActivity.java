package com.example.jsondemo;

import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.concurrent.ExecutionException;

public class MainActivity extends AppCompatActivity {

    class DownloadTask extends AsyncTask<String, Void, String>{

        @Override
        protected String doInBackground(String... urls) {

          String result = "";
            URL url;
            HttpURLConnection httpURLConnection = null;
            try{
                url = new URL(urls[0]);
                httpURLConnection = (HttpURLConnection) url.openConnection();
                InputStream inputStream = httpURLConnection.getInputStream();
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
                int data = inputStreamReader.read();
                while (data != -1){
                    char current = (char)data;
                    result += current;
                    data = inputStreamReader.read();
                }
                return result;
            }catch (Exception e){
                e.printStackTrace();
            }
          return null;
        };
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        String result = "";
        DownloadTask task = new DownloadTask();
        try {
            result = task.execute("https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22").get();
            JSONObject jsonObject = new JSONObject(result);
            String weatherInfo = jsonObject.getString("weather");
            Log.i("Web content",weatherInfo);

            JSONArray array = new JSONArray(weatherInfo);
            for (int i =0; i<array.length(); i++){
                JSONObject jsonPart = array.getJSONObject(i);
                Log.i("Web main",jsonPart.getString("main"));
                Log.i("Web description",jsonPart.getString("description"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
