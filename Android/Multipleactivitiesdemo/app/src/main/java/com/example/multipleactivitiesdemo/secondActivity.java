package com.example.multipleactivitiesdemo;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

public class secondActivity extends AppCompatActivity {

//    public void toFirstActivity(View view){
//        Intent intent = new Intent(getApplicationContext(), MainActivity.class);
//        startActivity(intent);
//    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);
//        Intent intent = getIntent();
//        Toast.makeText(this, intent.getStringExtra("username"), Toast.LENGTH_SHORT).show();

        TextView textView =findViewById(R.id.textView);
        Intent intent = getIntent();
        String name = intent.getStringExtra("name");
        textView.setText("Hi " + name + ", Welcome!");

    }
}
