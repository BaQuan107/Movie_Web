/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author baqua
 */
public class Movie {
    
    private int id;
    private String name;
    private Director director;
    private Date realse_year;
    private int length;
    private String country;
    private int rating, price;
    private String src;
    private int numberView;
    private String description;
    private List<Genre> genreL;
    private List<Actor> actorL;

    public Movie() {
    }

    public Movie(int id, String name, Director director, Date realse_year, int length, String country, int rating, int price, String src, int numberView, String description, List<Genre> genreL, List<Actor> actorL) {
        this.id = id;
        this.name = name;
        this.director = director;
        this.realse_year = realse_year;
        this.length = length;
        this.country = country;
        this.rating = rating;
        this.price = price;
        this.src = src;
        this.numberView = numberView;
        this.description = description;
        this.genreL = genreL;
        this.actorL = actorL;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public Date getRealse_year() {
        return realse_year;
    }

    public void setRealse_year(Date realse_year) {
        this.realse_year = realse_year;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public int getNumberView() {
        return numberView;
    }

    public void setNumberView(int numberView) {
        this.numberView = numberView;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Genre> getGenreL() {
        return genreL;
    }

    public void setGenreL(List<Genre> genreL) {
        this.genreL = genreL;
    }

    public List<Actor> getActorL() {
        return actorL;
    }

    public void setActorL(List<Actor> actorL) {
        this.actorL = actorL;
    }
    
    
}
