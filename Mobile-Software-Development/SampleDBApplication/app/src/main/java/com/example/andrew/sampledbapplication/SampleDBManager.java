package com.example.andrew.sampledbapplication;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;

import java.sql.SQLException;

/**
 * Created by Andrew on 28/10/2015.
 */
public class SampleDBManager
{
    public static final String KEY_TASKNAME = "task_name";
    public static final String KEY_DESCRIPTION = "task_description";
    public static final String KEY_COMPLETESTATUS = "task_complete_status";

    private static final int DATABASE_VERSION = 1;

    private static final String DATABASE_NAME = "Sample Database";
    private static final String DATABASE_TABLE = "Tasks";

    private static final String DATABASE_CREATE =
            "create table Tasks(rowId integer primary key autoincrement, " +
                    "task_name text not null, " + "task_description text not null, " +
                    "task_complete_status integer)";

    private final Context context;
    private MyDatabaseHelper DBHelper;
    private SQLiteDatabase db;

    public SampleDBManager(Context ctx)
    {
        this.context = ctx;
        DBHelper = new MyDatabaseHelper(context);
    }

    private static class MyDatabaseHelper extends SQLiteOpenHelper
    {

        MyDatabaseHelper(Context context) {
            super(context, DATABASE_NAME, null, 1);
        }

        public void onCreate(SQLiteDatabase db) {
            db.execSQL(DATABASE_CREATE);
        }

        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion)
        {
            if (oldVersion != newVersion)
            {
                db.execSQL(DATABASE_CREATE);
            }

        }
    }

    public SQLiteDatabase open() throws SQLException
    {
        db = DBHelper.getWritableDatabase();
        return db;
    }

    public void close()
    {
        DBHelper.close();
    }

    public long insertSomething(String task_name, String task_description, int task_complete_status)
    {
        ContentValues initialValues = new ContentValues();

        initialValues.put(KEY_TASKNAME, task_name);
        initialValues.put(KEY_DESCRIPTION, task_description);
        initialValues.put(KEY_COMPLETESTATUS, task_complete_status);

        return db.insert(DATABASE_TABLE, null, initialValues);
    }

 /*   public Cursor selectSomething (long rowID) throws SQLException
    {
        Cursor mCursor = db.query(true, DATABASE_TABLE, new String[]
                {
                        KEY_ROWID,
                        KEY_TASKNAME,
                        KEY_DESCRIPTION,
                        KEY_COMPLETESTATUS
                },
                KEY_ROWID + "=" + rowId, null, null, null, null, null);

        if (mCursor != null)
        {
            mCursor.moveToFirst();
        }

        return mCursor;
    } */
}
