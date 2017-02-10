package com.example.andrew.advancedlists;

/**
 * Created by Andrew on 21/10/2015.
 */
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

public class MyArrayAdapter extends ArrayAdapter<String>
{

        private final Context context;
        private final ArrayList<Object>  values = new ArrayList<Object>();

        public MyArrayAdapter(Context context, ArrayList<Object> values)
        {
            super(context, -1, values);
            this.context = context;
            this.values.addAll(values);
        }

        static class ViewHolder
        {
            public TextView textList;
            public ImageView imgOk;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {

            View rowView = convertView;
            if (rowView == null)
            {
                LayoutInflater inflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                rowView = inflater.inflate(R.layout.list_rowlayout, null);

                ViewHolder viewHolder = new ViewHolder();
                viewHolder.textList = (TextView) rowView.findViewById(R.id.textList);
                viewHolder.imgOk = (ImageView) rowView.findViewById(R.id.imgOk);
                rowView.setTag(viewHolder);
            }

            ViewHolder holder = (ViewHolder) rowView.getTag();
            RowClass rC = (RowClass) values.get(position);
            String countryName = rC.getCountry();
            holder.textList.setText(countryName);
            if (countryName.equals("Ireland"))
            {
                holder.imgOk.setImageResource(R.drawable.ok);
            }
            else
            {
                holder.imgOk.setImageResource(R.drawable.ok);
            }

            return rowView;

        }
        }



