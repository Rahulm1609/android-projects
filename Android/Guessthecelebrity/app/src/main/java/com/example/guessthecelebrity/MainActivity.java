package com.example.guessthecelebrity;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Random;
import java.util.concurrent.ExecutionException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MainActivity extends AppCompatActivity {
    ArrayList<String> celebUrls = new ArrayList<>();
    ArrayList<String> celebNames = new ArrayList<>();
    Random random = new Random();
    int celebChosen = 0;
    ImageView imageView;
    int locOfCorAns = 0;
    String[] answers = new String[4];

    Button button1;
    Button button2;
    Button button3;
    Button button4;

    URL url;
    HttpURLConnection httpURLConnection = null;

    public void celebChosen(View view) {
        if (view.getTag().toString().equals(Integer.toString(locOfCorAns))) {
            Toast.makeText(this, "Correct!", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(this, "Wrong! The answer is " + celebNames.get(celebChosen), Toast.LENGTH_SHORT).show();
        }
        createNewQuestion();
    }

    private void createNewQuestion() {
        celebChosen = random.nextInt(celebUrls.size());

        ImageDownloder imageTask = new ImageDownloder();
        Bitmap celebImage;
        try {
            celebImage = imageTask.execute(celebUrls.get(celebChosen)).get();
            imageView.setImageBitmap(celebImage);

            locOfCorAns = random.nextInt(4);

            int incorAns;
            for (int i = 0; i < 4; i++) {
                if (i == locOfCorAns) {
                    answers[i] = celebNames.get(celebChosen);
                } else {
                    incorAns = random.nextInt(celebUrls.size());
                    while (incorAns == celebChosen) {
                        incorAns = random.nextInt(celebUrls.size());
                    }
                    answers[i] = celebNames.get(incorAns);
                }
                //Log.i("answers: ", answers[i]);
            }
            button1.setText(answers[0]);
            button2.setText(answers[1]);
            button3.setText(answers[2]);
            button4.setText(answers[3]);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    class ImageDownloder extends AsyncTask<String, Void, Bitmap> {

        @Override
        protected Bitmap doInBackground(String... urls) {

            try {
                url = new URL(urls[0]);
                httpURLConnection = (HttpURLConnection) url.openConnection();
                httpURLConnection.connect();
                InputStream inputStream = httpURLConnection.getInputStream();
                Bitmap bitmap = BitmapFactory.decodeStream(inputStream);
                return bitmap;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }
    }

    class DownloadTask extends AsyncTask<String, Void, String> {

        @Override
        protected String doInBackground(String... urls) {
            String webContent = "";

            try {
                url = new URL(urls[0]);
                httpURLConnection = (HttpURLConnection) url.openConnection();
                InputStream inputStream = httpURLConnection.getInputStream();
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
                int data = inputStreamReader.read();
                while (data != -1) {
                    char current = (char) data;
                    webContent += current;
                    data = inputStreamReader.read();
                }
                return webContent;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        imageView = findViewById(R.id.imageView);
        button1 = findViewById(R.id.button1);
        button2 = findViewById(R.id.button2);
        button3 = findViewById(R.id.button3);
        button4 = findViewById(R.id.button4);

        String result = "";
        DownloadTask task = new DownloadTask();
        try {
            result = task.execute("http://www.posh24.se/kandisar").get();
            String[] splitResult = result.split("<div class=\"sidebarContainer\">");
            Pattern p = Pattern.compile("<img src=\"(.*?)\"");
            Matcher m = p.matcher(splitResult[0]);
            while (m.find()) {
                celebUrls.add(m.group(1));
            }
            p = Pattern.compile("alt=\"(.*?)\"");
            m = p.matcher(splitResult[0]);
            while (m.find()) {
                celebNames.add(m.group(1));
            }
            createNewQuestion();
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
