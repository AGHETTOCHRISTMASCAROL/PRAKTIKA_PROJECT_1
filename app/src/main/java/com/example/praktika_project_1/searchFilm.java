package com.example.praktika_project_1;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class searchFilm extends AppCompatActivity {

    EditText etFilmName;
    Button btnStart;
    TextView tvResult;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_search_film);

        etFilmName = findViewById(R.id.editTextFilmName);
        btnStart = findViewById(R.id.btnStart);
        tvResult = findViewById(R.id.textViewResult);

        btnStart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(etFilmName.getText().toString().trim().equals("")){
                    Toast.makeText(searchFilm.this, R.string.error, Toast.LENGTH_LONG).show();

                } else{
                    String name = etFilmName.getText().toString();
                    String url = "http://10.0.2.2:8080/kino?id=2&NAME=" + name;

                    new GetUrlData().execute(url);
                }
            }
        });
    }

    private class GetUrlData extends AsyncTask<String, String, String> {

        protected void onPreExecute() {
            super.onPreExecute();

            tvResult.setText("Ожидайте");
        }

        @Override
        protected String doInBackground(String... strings) {
            HttpURLConnection connection = null;
            BufferedReader reader = null;

            try {
                URL url = new URL(strings[0]);
                connection = (HttpURLConnection) url.openConnection();
                connection.connect();

                InputStream stream = connection.getInputStream();
                reader = new BufferedReader(new InputStreamReader(stream));

                StringBuffer buffer = new StringBuffer();
                String line = "";

                while ((line = reader.readLine()) != null)
                    buffer.append(line).append("\n");

                return buffer.toString();

            } catch (MalformedURLException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (connection != null)
                    connection.disconnect();

                try {
                    if (reader != null)
                        reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            return null;
        }

        @Override
        protected void onPostExecute(String result){
            super.onPostExecute(result);

            try {
                JSONArray jsonArray = new JSONArray(result);
                    tvResult.setText("Фильм:              " + jsonArray.getJSONObject(0).getString("FName").toString() + "\n"
                                    +"Кинотеатр:       " + jsonArray.getJSONObject(0).getString("TName").toString() + "\n"
                                    +"Адрес:                " + jsonArray.getJSONObject(0).getString("TAdress").toString());

            } catch (JSONException e) {
                e.printStackTrace();
                tvResult.setText("Ничего не найдено");
            }
        }
    }
}
