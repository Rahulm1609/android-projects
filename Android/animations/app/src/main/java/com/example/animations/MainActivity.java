package com.example.animations;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

public class MainActivity extends AppCompatActivity {

    public  void animate(View view){
        ImageView o = (ImageView)findViewById(R.id.o);
        ImageView x = (ImageView)findViewById(R.id.x);
        o.animate().alpha(0f).setDuration(2000);
        x.animate().alpha(1f).setDuration(2000);
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
