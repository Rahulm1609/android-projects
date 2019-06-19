 package com.example.customizemenu;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Switch;

 public class MainActivity extends AppCompatActivity {

     @Override
     public boolean onCreateOptionsMenu(Menu menu) {

         MenuInflater menuInflater = getMenuInflater();
         menuInflater.inflate(R.menu.main_menu, menu);

         return super.onCreateOptionsMenu(menu);
     }

     @Override
     public boolean onOptionsItemSelected(MenuItem item) {
         if(item.getItemId() == R.id.settings){
             Log.i("Menu item selected", "settings");
         }
         else if(item.getItemId() == R.id.help){
             Log.i("Menu item selected", "help");
         }

         return super.onOptionsItemSelected(item);

     }

     @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }


 }
