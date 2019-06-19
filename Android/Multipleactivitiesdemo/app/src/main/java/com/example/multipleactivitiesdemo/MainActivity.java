package com.example.multipleactivitiesdemo;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {

    ListView listView;


//    public void toSecondActivity(View view){
//        Intent intent = new Intent(getApplicationContext(), secondActivity.class);
//        intent.putExtra("username", "Rahul");
//        startActivity(intent);
//
//    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        listView = findViewById(R.id.listView);
        final ArrayList<String> arrayList = new ArrayList<String>();
        arrayList.add("Rahul");
        arrayList.add("Pradeep");
        arrayList.add("Rishi");
        arrayList.add("John");
        final ArrayAdapter<String> arrayAdapter = new ArrayAdapter<>(this,android.R.layout.simple_list_item_1,arrayList);
        listView.setAdapter(arrayAdapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Intent intent = new Intent(getApplicationContext(), secondActivity.class);
                intent.putExtra("name", arrayList.get(position));
                startActivity(intent);
            }
        });

    }
}
