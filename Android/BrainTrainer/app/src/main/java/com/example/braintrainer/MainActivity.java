package com.example.braintrainer;

import android.os.CountDownTimer;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.RelativeLayout;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Random;

public class MainActivity extends AppCompatActivity {
    RelativeLayout relativeLayout2;
    Button startGame;
    TextView result;
    TextView sumTextView;
    TextView pointBoard;
    TextView timer;
    Button button1;
    Button button2;
    Button button3;
    Button button4;
    Button playAgain;
    ArrayList<Integer> answers = new ArrayList<>();
    int locOfCorrAns;
    int score = 0;
    int noOfQues = 0;

    public void playAgain(View view) {
        score = 0;
        noOfQues = 0;
        timer.setText("0s");
        pointBoard.setText("0/0");
        result.setText("");
        playAgain.setVisibility(View.INVISIBLE);
        generateQuestion();
        new CountDownTimer(30000, 1000) {
            @Override
            public void onTick(long millisUntilFinished) {
                timer.setText(String.valueOf(millisUntilFinished / 1000) + "s");
            }

            @Override
            public void onFinish() {
                playAgain.setVisibility(View.VISIBLE);
                result.setText("Your score : " + Integer.toString(score) + "/" + Integer.toString(noOfQues));
                sumTextView.setText("");

            }
        }.start();
    }

    public void generateQuestion() {
        Random random = new Random();
        int a = random.nextInt(20);
        int b = random.nextInt(20);
        sumTextView.setText(Integer.toString(a) + " + " + Integer.toString(b));
        locOfCorrAns = random.nextInt(3);
        int incorrAns;
        answers.clear();
        for (int i = 0; i < 4; i++) {
            if (i == locOfCorrAns) {
                answers.add(a + b);
            } else {
                incorrAns = random.nextInt(40);
                while (incorrAns == a + b) {
                    incorrAns = random.nextInt(40);
                }
                answers.add(incorrAns);
            }
        }
        button1.setText(Integer.toString(answers.get(0)));
        button2.setText(Integer.toString(answers.get(1)));
        button3.setText(Integer.toString(answers.get(2)));
        button4.setText(Integer.toString(answers.get(3)));
    }

    public void chooseAnswer(View view) {
        if (view.getTag().toString().equals(Integer.toString(locOfCorrAns))) {
            result.setText("Correct!");
            score++;
        } else {
            result.setText("Wrong!");
        }
        noOfQues++;
        pointBoard.setText(Integer.toString(score) + "/" + Integer.toString(noOfQues));
        generateQuestion();

    }

    public void start(View view) {
        startGame.setVisibility(View.INVISIBLE);
        relativeLayout2.setVisibility(View.VISIBLE);
        playAgain(findViewById(R.id.playAgain));
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        relativeLayout2 = findViewById(R.id.relLayout2);
        startGame = findViewById(R.id.start);
        sumTextView = findViewById(R.id.sum);
        result = findViewById(R.id.result);
        pointBoard = findViewById(R.id.points);
        timer = findViewById(R.id.timer);
        button1 = findViewById(R.id.button1);
        button2 = findViewById(R.id.button2);
        button3 = findViewById(R.id.button3);
        button4 = findViewById(R.id.button4);
        playAgain = findViewById(R.id.playAgain);

    }
}
