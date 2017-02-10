package com.example.andrew.taskscheduler;

/**
 * Created by Andrew on 21/11/2015.
 */
public class User
{
    private int _id;
    private String userName;
    private String firstName;
    private String lastName;
    private String userPassWord;
    private String userLocation;
    private String userEmail;

    public int get_id()
    {
        return _id;
    }

    public void set_id(int _id)
    {
        this._id = _id;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getFirstName()
    {
        return firstName;
    }

    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }

    public String getLastName()
    {
        return lastName;
    }

    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public String getUserPassWord()
    {
        return userPassWord;
    }

    public void setUserPassWord(String userPassWord)
    {
        this.userPassWord = userPassWord;
    }

    public String getUserLocation()
    {
        return userLocation;
    }

    public void setUserLocation(String userLocation)
    {
        this.userLocation = userLocation;
    }

    public String getUserEmail()
    {
        return userEmail;
    }

    public void setUserEmail(String userEmail)
    {
        this.userEmail = userEmail;
    }
}
