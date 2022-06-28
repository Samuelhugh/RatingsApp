package com.rental_ratings.api.api.mvc.models;

import javax.validation.Valid;

public class RatingComment {
    
    @Valid
    private Rating rating;

    @Valid
    private Comment comment;
    
    public RatingComment () {}

    public Rating getRating() {
        return this.rating;
    }

    public void setRating(Rating rating) {
        this.rating = rating;
    }
    
    public Comment getComment() {
        return this.comment;
    }
    
    public void setComment(Comment comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "RatingComment [comment=" + comment + ", rating=" + rating + "]";
    }

}
