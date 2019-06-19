package com.example.sqlitedatabase;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        try{
            SQLiteDatabase database = this.openOrCreateDatabase("Users", Context.MODE_PRIVATE, null);
            database.execSQL("CREATE TABLE IF NOT EXISTS users (name VARCHAR, age INT(3))");
            database.execSQL("INSERT into users (name, age) VALUES ('rahul', 24)");
            database.execSQL("INSERT into users (name, age) VALUES ('rishi', 20)");

            Cursor c = database.rawQuery("SELECT * FROM users", null);

            int nameIndex = c.getColumnIndex("name");
            int ageIndex = c.getColumnIndex("age");

            c.moveToFirst();

            while (c != null){
                Log.i("name : ",c.getString(nameIndex));
                Log.i("age : ",Integer.toString(c.getInt(ageIndex)));

                c.moveToNext();
            }
        }catch (Exception e){
            e.printStackTrace();
        }


    }
}
